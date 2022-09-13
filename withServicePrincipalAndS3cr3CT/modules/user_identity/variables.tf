
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
