
output "client_id" {
  value     = data.azurerm_client_config.user.client_id
  sensitive = true
}


output "tenant_id" {
  value     = data.azurerm_client_config.user.tenant_id
  sensitive = true
}

output "subscription_id" {
  value     = data.azurerm_client_config.user.subscription_id
  sensitive = true
}

output "object_id" {
  value     = data.azurerm_client_config.user.object_id
  sensitive = true
}


# output "user" {
#   value = data.azurerm_client_config.user
# }
