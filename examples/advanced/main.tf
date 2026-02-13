
########################################################################################################################
# Resource Group
########################################################################################################################

module "resource_group" {
  source  = "terraform-ibm-modules/resource-group/ibm"
  version = "1.4.7"
  # if an existing resource group is not set (null) create a new one using prefix
  resource_group_name          = var.resource_group == null ? "${var.prefix}-resource-group" : null
  existing_resource_group_name = var.resource_group
}

########################################################################################################################
# VPC + Subnet + Public Gateway
#
# NOTE: This is a very simple VPC with single subnet in a single zone with a public gateway enabled, that will allow
# all traffic ingress/egress by default.
# For production use cases this would need to be enhanced by adding more subnets and zones for resiliency, and
# ACLs/Security Groups for network security.
########################################################################################################################

resource "ibm_is_vpc" "vpc" {
  name                      = "${var.prefix}-vpc"
  resource_group            = module.resource_group.resource_group_id
  address_prefix_management = "auto"
  tags                      = var.resource_tags
}

resource "ibm_is_public_gateway" "gateway" {
  name           = "${var.prefix}-gateway-1"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = module.resource_group.resource_group_id
  zone           = "${var.region}-1"
}

resource "ibm_is_subnet" "subnet_zone_1" {
  name                     = "${var.prefix}-subnet-1"
  vpc                      = ibm_is_vpc.vpc.id
  resource_group           = module.resource_group.resource_group_id
  zone                     = "${var.region}-1"
  total_ipv4_address_count = 256
  public_gateway           = ibm_is_public_gateway.gateway.id
}

########################################################################################################################
# Key Protect
########################################################################################################################

locals {
  key_ring        = "iks"
  cluster_key     = "${var.prefix}-cluster-data-encryption-key"
  boot_volume_key = "${var.prefix}-boot-volume-encryption-key"
}

module "kp_all_inclusive" {
  source                    = "terraform-ibm-modules/kms-all-inclusive/ibm"
  version                   = "5.5.21"
  key_protect_instance_name = "${var.prefix}-kp-instance"
  resource_group_id         = module.resource_group.resource_group_id
  region                    = var.region
  resource_tags             = var.resource_tags
  keys = [{
    key_ring_name = local.key_ring
    keys = [
      {
        key_name     = local.cluster_key
        force_delete = true
      },
      {
        key_name     = local.boot_volume_key
        force_delete = true
      }
    ]
  }]
}

########################################################################################################################
#  VPC cluster (single zone)
########################################################################################################################

locals {
  cluster_vpc_subnets = {
    default = [
      {
        id         = ibm_is_subnet.subnet_zone_1.id
        cidr_block = ibm_is_subnet.subnet_zone_1.ipv4_cidr_block
        zone       = ibm_is_subnet.subnet_zone_1.zone
      }
    ]
  }
  boot_volume_encryption_kms_config = {
    crk             = module.kp_all_inclusive.keys["${local.key_ring}.${local.boot_volume_key}"].key_id
    kms_instance_id = module.kp_all_inclusive.kms_guid
  }

  worker_pools = [
    {
      subnet_prefix                     = "zone-1"
      pool_name                         = "default"
      machine_type                      = "bx2.4x16"
      workers_per_zone                  = 1
      operating_system                  = "UBUNTU_24_64"
      enableAutoscaling                 = true
      minSize                           = 1
      maxSize                           = 6
      boot_volume_encryption_kms_config = local.boot_volume_encryption_kms_config
    }
  ]
}

module "iks_base" {
  source                              = "../.."
  resource_group_id                   = module.resource_group.resource_group_id
  region                              = var.region
  tags                                = var.resource_tags
  cluster_name                        = var.prefix
  force_delete_storage                = true
  vpc_id                              = ibm_is_vpc.vpc.id
  vpc_subnets                         = local.cluster_vpc_subnets
  worker_pools                        = local.worker_pools
  access_tags                         = var.access_tags
  disable_outbound_traffic_protection = true # set as True to enable outbound traffic from cluster workers
  kms_config = {
    instance_id = module.kp_all_inclusive.kms_guid
    crk_id      = module.kp_all_inclusive.keys["${local.key_ring}.${local.cluster_key}"].key_id
  }
  addons = {
    cluster-autoscaler = {
      version = "2.0.0"
    }
  }
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id   = module.iks_base.cluster_id
  resource_group_id = module.iks_base.resource_group_id
  config_dir        = "${path.module}/../../kubeconfig"
}
