
/* Role Definition */

resource "azurerm_role_definition" "role_def" {
  role_definition_id = var.role_definition[0]
  name               = var.role_definition[1]
  scope              = var.role_definition[2]


  permissions {
    actions     = var.role_permissions
    not_actions = []
  }

}


/* Role Assignment */
resource "azurerm_role_assignment" "role_assign" {
  name               = var.role_assignment_name
  scope              = var.data_access_id
  role_definition_id = azurerm_role_definition.role_def.role_definition_resource_id
  /* User ID */
  principal_id = module.user_details.principal_id

}



