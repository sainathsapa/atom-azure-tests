/* Providing Login Credentials */
provider "azurerm" {

  features {}

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


/* Virtual Network */
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4"]
}

/* Subnet */
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.1.0/24"
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
  name                = "ansumantestacr"
  resource_group_name = data.azurerm_resource_group.rg.name
}



/* Role Assignment */
resource "azurerm_role_assignment" "role_assign" {
  name               = var.role_assignment_name
  scope              = data.azurerm_container_registry.access_to_acr.id
  role_definition_id = azurerm_role_definition.role_def.role_definition_resource_id
  /* User ID */
  principal_id = var.principal_id

}



