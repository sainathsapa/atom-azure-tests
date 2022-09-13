output "nsg" {
  value = azurerm_network_security_group.nsg
}

output "vnet" {
  value = azurerm_virtual_network.vnet
}

output "dns_zone" {
  value = azurerm_private_dns_zone.dns
}

output "subnet" {
  value = azurerm_subnet.subnet
}

output "db_subnet" {
  value = azurerm_subnet.db_subnet
}

output "public_ip" {
  value = azurerm_public_ip.pip
}

output "az_lb" {
  value = azurerm_lb.az_lb
}

output "pvt_lnk_ser" {
  value = azurerm_private_link_service.azure_private_link
}
