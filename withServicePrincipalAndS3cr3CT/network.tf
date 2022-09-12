
/* NSG */
resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name      = "TestSecurityRuleName"
    priority  = 100
    direction = "Inbound"
    /* ON or OFF */
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
/* Virtual Network */
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4"]
}

resource "azurerm_private_dns_zone" "dns" {
  name                = "atomstate.privatelink.eastus.azmk8s.io"
  resource_group_name = azurerm_resource_group.rg.name
}

/* Subnet */
resource "azurerm_subnet" "subnet_one" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefix       = "10.0.1.0/24"
}


/* Assign NSG Rule for the Subnet*/
resource "azurerm_subnet_network_security_group_association" "assign_subnet_one" {
  subnet_id                 = azurerm_subnet.subnet_one.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

/* PUBLIC IP */
resource "azurerm_public_ip" "pip" {
  name                = "az-pip"
  sku                 = "Standard"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
}

/* Load Balancer for Request Handling */

resource "azurerm_lb" "az_lb" {
  name                = "az_lb"
  sku                 = "Standard"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                 = azurerm_public_ip.pip.name
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}


/* Connection for Private K8s */
resource "azurerm_private_link_service" "azure_private_link" {
  name                = "private_link"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location



  load_balancer_frontend_ip_configuration_ids = [azurerm_lb.az_lb.frontend_ip_configuration.0.id]

  nat_ip_configuration {
    name                       = "primary"
    private_ip_address         = azurerm_kubernetes_cluster.k8s.fqdn
    private_ip_address_version = "IPv4"
    subnet_id                  = azurerm_subnet.subnet_one.id
    primary                    = true
  }
}


/* Subnet for DB */
resource "azurerm_subnet" "db_subnet" {
  name                 = "db_subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]

  delegation {
    name = "managedinstancedelegation"

    service_delegation {
      name    = "Microsoft.Sql/managedInstances"
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
}
