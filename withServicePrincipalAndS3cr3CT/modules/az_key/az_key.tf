

/* Azure Key Vault */
resource "azurerm_key_vault" "azkey_vault" {
  name                        = var.key_vault_name
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  enabled_for_deployment      = true
  enable_rbac_authorization   = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = var.soft_delete_retention_days
  purge_protection_enabled    = false

  sku_name = "standard"

  /* Key Accessing Policy in Key Vault */
  access_policy {
    tenant_id               = var.tenant_id
    object_id               = var.principal_id
    certificate_permissions = var.certificate_permissions

    key_permissions = var.key_permissions

    secret_permissions = var.secret_permissions

    storage_permissions = var.storage_permissions
  }

  network_acls {
    bypass                     = "None" /* for better security */
    default_action             = "Allow"
    virtual_network_subnet_ids = azurerm_subnet.subnet.service_endpoint_policy_ids
  }

}


/* Key Gen by using TLS Key Gen */
resource "tls_private_key" "tls_keygen" {
  algorithm = "RSA"
  rsa_bits  = 2048
}


/* Assign the Key to Secret and store to keyVault */
resource "azurerm_key_vault_secret" "public_ssh_key" {
  name         = var.key_secret_name
  value        = tls_private_key.tls_keygen.public_key_openssh
  key_vault_id = azurerm_key_vault.azkey_vault.id
}

resource "azurerm_key_vault_secret" "private_ssh_key" {
  /* Storing Private Key */
  name         = var.key_secret_name
  value        = tls_private_key.tls_keygen.private_key_pem
  key_vault_id = azurerm_key_vault.azkey_vault.id
}

