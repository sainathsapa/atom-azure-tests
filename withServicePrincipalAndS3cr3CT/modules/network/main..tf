
/* NSG */
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  security_rule {
    name      = "TestSecurityRuleName"
    priority  = 100
    direction = "Inbound"
    /* ON or OFF */
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
/* Virtual Network */
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
}

resource "azurerm_private_dns_zone" "dns" {
  name                = var.dns_zone_name
  resource_group_name = var.rg_name
}

/* Subnet */
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prifix
}


/* Assign NSG Rule for the Subnet*/
resource "azurerm_subnet_network_security_group_association" "assign_subnet_one" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

/* PUBLIC IP */
resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  sku                 = "Standard"
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = var.pip_alloc_method
}

/* Load Balancer for Request Handling */

resource "azurerm_lb" "az_lb" {
  name                = var.az_lb_name
  sku                 = "Standard"
  location            = var.rg_location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = azurerm_public_ip.pip.name
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}


/* Connection for Private K8s */
resource "azurerm_private_link_service" "azure_private_link" {
  name                = var.pvt_lnk_service_name
  location            = var.rg_location
  resource_group_name = var.rg_name



  load_balancer_frontend_ip_configuration_ids = [azurerm_lb.az_lb.frontend_ip_configuration.0.id]

  nat_ip_configuration {
    name                       = "primary"
    private_ip_address         = var.pvt_lnk_service_k8s_ip
    private_ip_address_version = "IPv4"
    subnet_id                  = azurerm_subnet.subnet.id
    primary                    = true
  }
}


/* Subnet for DB */
resource "azurerm_subnet" "db_subnet" {
  name                 = var.db_subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.db_subnet_address_prefix

  delegation {
    name = "managedinstancedelegation"

    service_delegation {
      name = "Microsoft.Sql/managedInstances"
      # actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
      actions = var.db_action
    }
  }
}
