##############################################################################
# Outputs (IKS)
##############################################################################

output "cluster_id" {
  description = "ID of the cluster"
  value       = local.cluster_id
  depends_on  = [null_resource.confirm_network_healthy]
}

output "cluster_name" {
  description = "Name of the cluster"
  # robust access: handle both count=1 (indexed) and single resource forms
  value      = ibm_container_vpc_cluster.iks_cluster.name
  depends_on = [null_resource.confirm_network_healthy]
}

output "cluster_crn" {
  description = "CRN of the cluster"
  value       = local.cluster_crn
  depends_on  = [null_resource.confirm_network_healthy]
}

output "workerpools" {
  description = "Worker pools created"
  value       = module.worker_pools.workerpools
}

output "kube_version" {
  description = "Kubernetes version of the cluster"
  value       = ibm_container_vpc_cluster.iks_cluster.kube_version
}

output "vpc_id" {
  description = "ID of the cluster's VPC"
  value       = ibm_container_vpc_cluster.iks_cluster.vpc_id
}

output "region" {
  description = "Region that the cluster is deployed to"
  value       = var.region
}

output "resource_group_id" {
  description = "Resource group ID the cluster is deployed in"
  value       = ibm_container_vpc_cluster.iks_cluster.resource_group_id
}

output "ingress_hostname" {
  description = "The hostname that was assigned to your Ingress subdomain."
  value       = ibm_container_vpc_cluster.iks_cluster.ingress_hostname
}

output "private_service_endpoint_url" {
  description = "Private service endpoint URL"
  value       = ibm_container_vpc_cluster.iks_cluster.private_service_endpoint_url
}

output "public_service_endpoint_url" {
  description = "Public service endpoint URL"
  value       = ibm_container_vpc_cluster.iks_cluster.public_service_endpoint_url
}

output "master_url" {
  description = "The URL of the Kubernetes master."
  value       = ibm_container_vpc_cluster.iks_cluster.master_url
}

output "vpe_url" {
  description = "The virtual private endpoint URL of the Kubernetes cluster."
  value       = ibm_container_vpc_cluster.iks_cluster.vpe_service_endpoint_url
}

output "kms_config" {
  description = "KMS configuration details (input)"
  value       = var.kms_config
}

output "operating_system" {
  description = "The operating system of the workers in the default worker pool."
  value       = ibm_container_vpc_cluster.iks_cluster.operating_system
}

output "master_status" {
  description = "The status of the Kubernetes master."
  value       = ibm_container_vpc_cluster.iks_cluster.master_status
}

output "master_vpe" {
  description = "ID of the master (default) VPE."
  value       = local.master_vpe_id
}

output "api_vpe" {
  description = "ID of the API VPE (if exists)."
  value       = local.api_vpe_id
}

output "registry_vpe" {
  description = "ID of the registry VPE (if exists)."
  value       = local.registry_vpe_id
}

output "secrets_manager_integration_config" {
  description = "Information about the Secrets Manager ingress integration (if enabled)."
  value       = var.enable_secrets_manager_integration ? ibm_container_ingress_instance.instance : null
}
