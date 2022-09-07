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
  type = string
}

/* UserName for KubeCluster's VMachine */
variable "admin_user_name" {

  default     = "stateatom-admin-user-name"
  type        = string
  description = "User name for VMachine"

}



/* VNet Name */

variable "vnet_name" {

  description = "Name for VNet to be used for KubeCluster"
  type        = string
  default     = "MyKubeVnetName"


}

/* SubNet Name */

variable "subnet_name" {
  type        = string
  description = "Name for Subnet to be used for KubeCluster"
  default     = "MyKubeSubnetName"
}


/* Variables for Role Definition */

variable "role_definition" {
  type        = list(string)
  description = "Role assignments to be used for"
  /* [ role_name, role_name, role_scope ] */
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
