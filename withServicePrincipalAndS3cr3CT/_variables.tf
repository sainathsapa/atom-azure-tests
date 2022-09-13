/* Principal ID */

variable "principal_id" {
  type        = string
  default     = "RANDOM"
  description = "Principal ID"
  sensitive   = true
}

/* Subscription ID */
variable "subscription_id" {
  default     = "RANDOM"
  type        = string
  description = "Subscription ID to be used"
  sensitive   = true
}

/* Client ID */
variable "client_id" {
  default     = "RANDOM"
  type        = string
  sensitive   = true
  description = "Client ID to be used"


}

/* Client Secret */
variable "client_secret" {
  default     = "RANDOM"
  type        = string
  sensitive   = true
  description = "Client secret to be used"
}

/* Tenant ID */
variable "tenant_id" {
  default     = "RANDOM"
  type        = string
  sensitive   = true
  description = "Tenant ID to be used"
}


/* Resource Group Name */
variable "resource_group_name" {

  description = "Resource group name to be used"
  default     = "atomstate-resource-group-name"
  type        = string

}

/* Location for RG */
variable "location" {

  description = "Location Setting for Any Resource"
  default     = "East US"
  type        = string

}


/* Cluster Name */
variable "cluster_name" {
  description = "Cluster name to be used to deploy the cluster"
  default     = "atomstate-cluster-name"
  type        = string
}

/* UserName for KubeCluster's VMachine */
variable "admin_user_name" {

  default     = "stateatom-admin-user-name"
  type        = string
  description = "User name for VMachine"

}

/* DNS Prefix for KubeCluster*/

variable "dns_prefix" {
  description = "DNS Prefix for KubeCluster"
  type        = string
  default     = "atomstate.dns.io"
}

/* Node_Pool Modification for KubeCluster*/

variable "vm_name" {
  /* VM Name */
  default     = "MyVMName"
  type        = string
  description = "Name for VM Machine of K8s"

}

variable "vm_size_proccer_ram" {
  /* Specs */
  description = "Define Proccesor and RAM size Based on the Azure "
  default     = "Standard_D2_v2"
  type        = string
}

variable "vm_os_disk_size_gb" {
  /* Disk Size */
  default     = 10
  type        = number
  description = "Disk Size for VM"
}
variable "cluster_node_count" {
  /* Default node count for KubeCluster*/
  type        = number
  description = "Set Default Node count for KubeCluster"
  default     = 2

}

variable "cluster_node_min_count" {
  /* Minimum number of nodes*/
  type        = number
  description = "Set Default Node Minimum count for KubeCluster"
  default     = 2
}

variable "cluster_node_max_count" {
  /* Maximum number of nodes*/
  type        = number
  description = "Set Default Node Maximum count for KubeCluster"
  default     = 10
}


/* Variables for Role Definition */

variable "role_definition" {
  type        = list(string)
  description = "Role assignments to be used for"
  /* [ role_id, role_name, role_scope ] */
  default = ["123456789012345678901234567890123", "NameforCurrentUserRole", "/subscription_id/etc"]
}

variable "role_permissions" {
  type        = list(string)
  description = "Role Action Permissions to be used"
  default     = ["value", "value", "value", "value", "value", "value", "value"]
}


/* Role Assignmet */


variable "role_assignment_name" {

  type        = string
  default     = "MyRoleAssignmentName"
  description = "Role Assignmet Name"

}
