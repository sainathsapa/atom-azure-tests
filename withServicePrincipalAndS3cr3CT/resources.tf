/* Providing Login Credentials */
provider "azurerm" {

  features {
    /* Key Module Format */
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  /* Passing Credentials to Terraform */
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}



/* Resource Group Name */

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}



/* User Identity */

resource "azurerm_user_assigned_identity" "user_identity" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  name                = "Name of the user_identity"
}

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

data "azurerm_container_registry" "access_to_acr" {
  name                = "ResourcesAccesNameforUse"
  resource_group_name = data.azurerm_resource_group.rg.name
}





/* Role Assignment */
resource "azurerm_role_assignment" "role_assign" {
  name               = var.role_assignment_name
  scope              = data.azurerm_container_registry.dns.id
  role_definition_id = azurerm_role_definition.role_def.role_definition_resource_id
  /* User ID */
  principal_id = azurerm_user_assigned_identity.user_identity.principal_id

}



