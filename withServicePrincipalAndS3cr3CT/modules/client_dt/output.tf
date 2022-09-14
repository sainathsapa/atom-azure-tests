
# output "client_id" {
#   value     = data.azurerm_client_config.current.client_id
#   sensitive = true
# }


# output "tenant_id" {
#   value     = data.azurerm_client_config.current.tenant_id
#   sensitive = true
# }

# output "subscription_id" {
#   value     = data.azurerm_client_config.current.subscription_id
#   sensitive = true
# }

# output "object_id" {
#   value     = data.azurerm_client_config.current.object_id
#   sensitive = true
# }


output "user" {
  value = data.azurerm_client_config.current
}
