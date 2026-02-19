<!-- Update this title with a descriptive name. Use sentence case. -->
# Terraform modules template project

<!--
Update status and "latest release" badges:
  1. For the status options, see https://terraform-ibm-modules.github.io/documentation/#/badge-status
  2. Update the "latest release" badge to point to the correct module's repo. Replace "terraform-ibm-module-template" in two places.
-->
[![Incubating (Not yet consumable)](https://img.shields.io/badge/status-Incubating%20(Not%20yet%20consumable)-red)](https://terraform-ibm-modules.github.io/documentation/#/badge-status)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-base-iks-vpc?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-base-iks-vpc/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

<!--
Add a description of modules in this repo.
Expand on the repo short description in the .github/settings.yml file.

For information, see "Module names and descriptions" at
https://terraform-ibm-modules.github.io/documentation/#/implementation-guidelines?id=module-names-and-descriptions
-->

TODO: Replace this with a description of the modules in this repo.


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGIN OVERVIEW HOOK -->
## Overview
* [terraform-ibm-base-iks-vpc](#terraform-ibm-base-iks-vpc)
* [Submodules](./modules)
* [Examples](./examples)
:information_source: Ctrl/Cmd+Click or right-click on the Schematics deploy button to open in a new tab
    * <a href="./examples/advanced">Advanced example</a> <a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=base-iks-vpc-advanced-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-base-iks-vpc/tree/main/examples/advanced"><img src="https://img.shields.io/badge/Deploy%20with IBM%20Cloud%20Schematics-0f62fe?logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics" style="height: 16px; vertical-align: text-bottom; margin-left: 5px;"></a>
    * <a href="./examples/basic">Basic example</a> <a href="https://cloud.ibm.com/schematics/workspaces/create?workspace_name=base-iks-vpc-basic-example&repository=https://github.com/terraform-ibm-modules/terraform-ibm-base-iks-vpc/tree/main/examples/basic"><img src="https://img.shields.io/badge/Deploy%20with IBM%20Cloud%20Schematics-0f62fe?logo=ibm&logoColor=white&labelColor=0f62fe" alt="Deploy with IBM Cloud Schematics" style="height: 16px; vertical-align: text-bottom; margin-left: 5px;"></a>
* [Contributing](#contributing)
<!-- END OVERVIEW HOOK -->


<!-- Replace this heading with the name of the root level module (the repo name) -->
## terraform-ibm-base-iks-vpc

### Usage

<!--
Add an example of the use of the module in the following code block.

Use real values instead of "var.<var_name>" or other placeholder values
unless real values don't help users know what to change.
-->

```hcl
terraform {
  required_version = ">= 1.9.0"
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "X.Y.Z"  # Lock into a provider version that satisfies the module constraints
    }
  }
}

locals {
    region = "us-south"
}

provider "ibm" {
  ibmcloud_api_key = "XXXXXXXXXX"  # replace with apikey value
  region           = local.region
}

module "module_template" {
  source            = "terraform-ibm-modules/<replace>/ibm"
  version           = "X.Y.Z" # Replace "X.Y.Z" with a release version to lock into a specific release
  region            = local.region
  name              = "instance-name"
  resource_group_id = "xxXXxxXXxXxXXXXxxXxxxXXXXxXXXXX" # Replace with the actual ID of resource group to use
}
```

### Required access policies

<!-- PERMISSIONS REQUIRED TO RUN MODULE
If this module requires permissions, uncomment the following block and update
the sample permissions, following the format.
Replace the 'Sample IBM Cloud' service and roles with applicable values.
The required information can usually be found in the services official
IBM Cloud documentation.
To view all available service permissions, you can go in the
console at Manage > Access (IAM) > Access groups and click into an existing group
(or create a new one) and in the 'Access' tab click 'Assign access'.
-->

<!--
You need the following permissions to run this module:

- Service
    - **Resource group only**
        - `Viewer` access on the specific resource group
    - **Sample IBM Cloud** service
        - `Editor` platform access
        - `Manager` service access
-->

<!-- NO PERMISSIONS FOR MODULE
If no permissions are required for the module, uncomment the following
statement instead the previous block.
-->

<!-- No permissions are needed to run this module.-->


<!-- The following content is automatically populated by the pre-commit hook -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.0 |
| <a name="requirement_ibm"></a> [ibm](#requirement\_ibm) | >= 1.86.0, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.16.1, < 3.0.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.2.1, < 4.0.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9.1, < 1.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_attach_sg_to_api_vpe"></a> [attach\_sg\_to\_api\_vpe](#module\_attach\_sg\_to\_api\_vpe) | terraform-ibm-modules/security-group/ibm | 2.8.0 |
| <a name="module_attach_sg_to_lb"></a> [attach\_sg\_to\_lb](#module\_attach\_sg\_to\_lb) | terraform-ibm-modules/security-group/ibm | 2.8.0 |
| <a name="module_attach_sg_to_master_vpe"></a> [attach\_sg\_to\_master\_vpe](#module\_attach\_sg\_to\_master\_vpe) | terraform-ibm-modules/security-group/ibm | 2.8.0 |
| <a name="module_attach_sg_to_registry_vpe"></a> [attach\_sg\_to\_registry\_vpe](#module\_attach\_sg\_to\_registry\_vpe) | terraform-ibm-modules/security-group/ibm | 2.8.0 |
| <a name="module_cbr_rule"></a> [cbr\_rule](#module\_cbr\_rule) | terraform-ibm-modules/cbr/ibm//modules/cbr-rule-module | 1.33.7 |
| <a name="module_existing_secrets_manager_instance_parser"></a> [existing\_secrets\_manager\_instance\_parser](#module\_existing\_secrets\_manager\_instance\_parser) | terraform-ibm-modules/common-utilities/ibm//modules/crn-parser | 1.2.0 |
| <a name="module_worker_pools"></a> [worker\_pools](#module\_worker\_pools) | ./modules/worker-pool | n/a |

### Resources

| Name | Type |
|------|------|
| [ibm_container_addons.addons](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/container_addons) | resource |
| [ibm_container_ingress_instance.instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/container_ingress_instance) | resource |
| [ibm_container_vpc_cluster.iks_cluster](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/container_vpc_cluster) | resource |
| [ibm_iam_authorization_policy.secrets_manager_iam_auth_policy](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/iam_authorization_policy) | resource |
| [ibm_resource_tag.cluster_access_tag](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_tag) | resource |
| [kubernetes_config_map_v1_data.set_autoscaling](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map_v1_data) | resource |
| [null_resource.config_map_status](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.confirm_network_healthy](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [time_sleep.wait_for_auth_policy](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [ibm_container_addons.existing_addons](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/container_addons) | data source |
| [ibm_container_cluster_config.cluster_config](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/container_cluster_config) | data source |
| [ibm_container_cluster_versions.cluster_versions](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/container_cluster_versions) | data source |
| [ibm_is_lbs.all_lbs](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_lbs) | data source |
| [ibm_is_virtual_endpoint_gateway.api_vpe](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_virtual_endpoint_gateway) | data source |
| [ibm_is_virtual_endpoint_gateway.master_vpe](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_virtual_endpoint_gateway) | data source |
| [ibm_is_virtual_endpoint_gateway.registry_vpe](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_virtual_endpoint_gateway) | data source |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_tags"></a> [access\_tags](#input\_access\_tags) | A list of access tags to apply to the resources created by the module. | `list(string)` | `[]` | no |
| <a name="input_additional_lb_security_group_ids"></a> [additional\_lb\_security\_group\_ids](#input\_additional\_lb\_security\_group\_ids) | Additional security groups to add to the load balancers associated with the cluster. Ensure that the `number_of_lbs` is set to the number of LBs associated with the cluster. This comes in addition to the IBM maintained security group. | `list(string)` | `[]` | no |
| <a name="input_additional_vpe_security_group_ids"></a> [additional\_vpe\_security\_group\_ids](#input\_additional\_vpe\_security\_group\_ids) | Additional security groups to add to existing VPEs (master, api, registry). Each entry is a list of SG IDs. | <pre>object({<br/>    master   = optional(list(string), [])<br/>    registry = optional(list(string), [])<br/>    api      = optional(list(string), [])<br/>  })</pre> | `{}` | no |
| <a name="input_addons"></a> [addons](#input\_addons) | Map of cluster add-on versions to install. For full list of supported add-ons and versions, see IBM Cloud docs. | <pre>object({<br/>    vpc-file-csi-driver = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>    static-route = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>    cluster-autoscaler = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>    vpc-block-csi-driver = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>    ibm-storage-operator = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>    diagnostics-and-debug-tool = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>    alb-oauth-proxy = optional(object({<br/>      version         = optional(string)<br/>      parameters_json = optional(string)<br/>    }))<br/>  })</pre> | `{}` | no |
| <a name="input_allow_default_worker_pool_replacement"></a> [allow\_default\_worker\_pool\_replacement](#input\_allow\_default\_worker\_pool\_replacement) | (Advanced users) Set to true to allow the module to recreate a default worker pool. If you wish to make any change to the default worker pool which requires the re-creation of the default pool follow the module README. | `bool` | `false` | no |
| <a name="input_attach_ibm_managed_security_group"></a> [attach\_ibm\_managed\_security\_group](#input\_attach\_ibm\_managed\_security\_group) | Specify whether to attach the IBM-defined default security group (whose name is kube-<clusterid>) to all worker nodes. Only applicable if `custom_security_group_ids` is set. | `bool` | `true` | no |
| <a name="input_cbr_rules"></a> [cbr\_rules](#input\_cbr\_rules) | The context-based restrictions rule to create. Only one rule is allowed. | <pre>list(object({<br/>    description = string<br/>    account_id  = string<br/>    rule_contexts = list(object({<br/>      attributes = optional(list(object({<br/>        name  = string<br/>        value = string<br/>      })))<br/>    }))<br/>    enforcement_mode = string<br/>    tags = optional(list(object({<br/>      name  = string<br/>      value = string<br/>    })), [])<br/>    operations = optional(list(object({<br/>      api_types = list(object({<br/>        api_type_id = string<br/>      }))<br/>    })))<br/>  }))</pre> | `[]` | no |
| <a name="input_cluster_config_endpoint_type"></a> [cluster\_config\_endpoint\_type](#input\_cluster\_config\_endpoint\_type) | Specify which type of endpoint to use for cluster config access: 'default', 'private', 'vpe', 'link'. | `string` | `"default"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name that is assigned to the provisioned cluster. | `string` | n/a | yes |
| <a name="input_custom_security_group_ids"></a> [custom\_security\_group\_ids](#input\_custom\_security\_group\_ids) | Security groups to add to all worker nodes. This comes in addition to the IBM maintained security group if `attach_ibm_managed_security_group` is set to true. If this variable is set, the default VPC security group is NOT assigned to the worker nodes. | `list(string)` | `null` | no |
| <a name="input_disable_outbound_traffic_protection"></a> [disable\_outbound\_traffic\_protection](#input\_disable\_outbound\_traffic\_protection) | Whether to allow public outbound access from the cluster workers. Set per your environment's security requirements. | `bool` | `false` | no |
| <a name="input_enable_secrets_manager_integration"></a> [enable\_secrets\_manager\_integration](#input\_enable\_secrets\_manager\_integration) | Integrate with IBM Cloud Secrets Manager to manage Ingress certificates and other secrets. | `bool` | `false` | no |
| <a name="input_existing_secrets_manager_instance_crn"></a> [existing\_secrets\_manager\_instance\_crn](#input\_existing\_secrets\_manager\_instance\_crn) | CRN of the Secrets Manager instance where Ingress certificate secrets are stored. Required if secrets manager integration is enabled. | `string` | `null` | no |
| <a name="input_force_delete_storage"></a> [force\_delete\_storage](#input\_force\_delete\_storage) | Flag indicating whether or not to delete attached storage when destroying the cluster. | `bool` | `false` | no |
| <a name="input_ignore_worker_pool_size_changes"></a> [ignore\_worker\_pool\_size\_changes](#input\_ignore\_worker\_pool\_size\_changes) | Enable if using worker autoscaling. Stops Terraform managing worker count | `bool` | `false` | no |
| <a name="input_kms_config"></a> [kms\_config](#input\_kms\_config) | Use to attach a KMS instance to the cluster. If account\_id is not provided, defaults to the account in use. | <pre>object({<br/>    crk_id           = string<br/>    instance_id      = string<br/>    private_endpoint = optional(bool, true) # defaults to true<br/>    account_id       = optional(string)     # To attach KMS instance from another account<br/>    wait_for_apply   = optional(bool, true) # defaults to true so terraform will wait until the KMS is applied to the master<br/>  })</pre> | `null` | no |
| <a name="input_kube_version"></a> [kube\_version](#input\_kube\_version) | The version of Kubernetes cluster that should be provisioned (format 1.x). If no value is specified, the current default version is used. You can also specify `default`. This input is used only during initial cluster provisioning and is ignored for updates. | `string` | `null` | no |
| <a name="input_manage_all_addons"></a> [manage\_all\_addons](#input\_manage\_all\_addons) | Instructs Terraform to manage all cluster addons, even if addons were installed outside of the module. | `bool` | `false` | no |
| <a name="input_number_of_lbs"></a> [number\_of\_lbs](#input\_number\_of\_lbs) | The number of LBs to associated the `additional_lb_security_group_names` security group with. | `number` | `1` | no |
| <a name="input_pod_subnet_cidr"></a> [pod\_subnet\_cidr](#input\_pod\_subnet\_cidr) | Specify a custom subnet CIDR to provide private IP addresses for pods. Default value is provider default when null. | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | The IBM Cloud region where the cluster is provisioned. | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of an existing IBM Cloud resource group where the cluster is grouped. | `string` | n/a | yes |
| <a name="input_secrets_manager_secret_group_id"></a> [secrets\_manager\_secret\_group\_id](#input\_secrets\_manager\_secret\_group\_id) | Secret group ID where Ingress secrets are stored in the Secrets Manager instance. | `string` | `null` | no |
| <a name="input_service_subnet_cidr"></a> [service\_subnet\_cidr](#input\_service\_subnet\_cidr) | Specify a custom subnet CIDR to provide private IP addresses for services. Default value is provider default when null. | `string` | `null` | no |
| <a name="input_skip_secrets_manager_iam_auth_policy"></a> [skip\_secrets\_manager\_iam\_auth\_policy](#input\_skip\_secrets\_manager\_iam\_auth\_policy) | Skip creating auth policy that allows cluster 'Manager' role access in the existing Secrets Manager instance. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Metadata labels describing this cluster deployment, i.e. test | `list(string)` | `[]` | no |
| <a name="input_verify_worker_network_readiness"></a> [verify\_worker\_network\_readiness](#input\_verify\_worker\_network\_readiness) | By setting this to true, a script runs kubectl commands to verify that all worker nodes can communicate successfully with the master. If the runtime does not have access to the kube cluster to run kubectl commands, set this value to false. | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC instance where this cluster is provisioned. | `string` | n/a | yes |
| <a name="input_vpc_subnets"></a> [vpc\_subnets](#input\_vpc\_subnets) | Metadata that describes the VPC's subnets. Obtain this information from the VPC where this cluster is created. | <pre>map(list(object({<br/>    id         = string<br/>    zone       = string<br/>    cidr_block = string<br/>  })))</pre> | n/a | yes |
| <a name="input_worker_pools"></a> [worker\_pools](#input\_worker\_pools) | List of worker pools | <pre>list(object({<br/>    subnet_prefix = optional(string)<br/>    vpc_subnets = optional(list(object({<br/>      id         = string<br/>      zone       = string<br/>      cidr_block = string<br/>    })))<br/>    pool_name         = string<br/>    machine_type      = string<br/>    workers_per_zone  = number<br/>    resource_group_id = optional(string)<br/>    operating_system  = string<br/>    labels            = optional(map(string))<br/>    minSize           = optional(number)<br/>    secondary_storage = optional(string)<br/>    maxSize           = optional(number)<br/>    enableAutoscaling = optional(bool)<br/>    boot_volume_encryption_kms_config = optional(object({<br/>      crk             = string<br/>      kms_instance_id = string<br/>      kms_account_id  = optional(string)<br/>    }))<br/>    additional_security_group_ids = optional(list(string))<br/>  }))</pre> | n/a | yes |
| <a name="input_worker_pools_taints"></a> [worker\_pools\_taints](#input\_worker\_pools\_taints) | Optional, Map of lists containing node taints by node-pool name | `map(list(object({ key = string, value = string, effect = string })))` | `null` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_vpe"></a> [api\_vpe](#output\_api\_vpe) | ID of the API VPE (if exists). |
| <a name="output_cluster_crn"></a> [cluster\_crn](#output\_cluster\_crn) | CRN of the cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID of the cluster |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the cluster |
| <a name="output_ingress_hostname"></a> [ingress\_hostname](#output\_ingress\_hostname) | The hostname that was assigned to your Ingress subdomain. |
| <a name="output_kms_config"></a> [kms\_config](#output\_kms\_config) | KMS configuration details (input) |
| <a name="output_kube_version"></a> [kube\_version](#output\_kube\_version) | Kubernetes version of the cluster |
| <a name="output_master_status"></a> [master\_status](#output\_master\_status) | The status of the Kubernetes master. |
| <a name="output_master_url"></a> [master\_url](#output\_master\_url) | The URL of the Kubernetes master. |
| <a name="output_master_vpe"></a> [master\_vpe](#output\_master\_vpe) | ID of the master (default) VPE. |
| <a name="output_operating_system"></a> [operating\_system](#output\_operating\_system) | The operating system of the workers in the default worker pool. |
| <a name="output_private_service_endpoint_url"></a> [private\_service\_endpoint\_url](#output\_private\_service\_endpoint\_url) | Private service endpoint URL |
| <a name="output_public_service_endpoint_url"></a> [public\_service\_endpoint\_url](#output\_public\_service\_endpoint\_url) | Public service endpoint URL |
| <a name="output_region"></a> [region](#output\_region) | Region that the cluster is deployed to |
| <a name="output_registry_vpe"></a> [registry\_vpe](#output\_registry\_vpe) | ID of the registry VPE (if exists). |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource group ID the cluster is deployed in |
| <a name="output_secrets_manager_integration_config"></a> [secrets\_manager\_integration\_config](#output\_secrets\_manager\_integration\_config) | Information about the Secrets Manager ingress integration (if enabled). |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of the cluster's VPC |
| <a name="output_vpe_url"></a> [vpe\_url](#output\_vpe\_url) | The virtual private endpoint URL of the Kubernetes cluster. |
| <a name="output_workerpools"></a> [workerpools](#output\_workerpools) | Worker pools created |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- Leave this section as is so that your module has a link to local development environment set-up steps for contributors to follow -->
## Contributing

You can report issues and request features for this module in GitHub issues in the module repo. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
