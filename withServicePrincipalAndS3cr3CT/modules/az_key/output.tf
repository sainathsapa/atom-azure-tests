output "public_ssh_key" {
  value = azurerm_key_vault_secret.public_ssh_key
}

output "private_ssh_key" {
  value = azurerm_key_vault_secret.private_ssh_key
}


output "key_valut" {
  value = azurerm_key_vault.azkey_vault
}
