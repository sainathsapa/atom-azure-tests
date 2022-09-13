/* Key Vault Name */

variable "key_vault_name" {
  type        = string
  description = "Name of the key Vault to be used"
  default     = "MyKeyVaultName"
}

variable "soft_delete_retention_days" {
  type        = number
  description = "KeyVaule Retention Days Count"
  default     = 2

}


variable "certificate_permissions " {
  type        = list(string)
  description = "define certificate_permissions"
  default     = ["create", "delete", "deleteissuers", "get", "update"]

}

variable "key_permissions" {
  type        = list(string)
  description = "define key_permissions"
  default     = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey", ]
}


variable "secret_permissions" {
  type        = list(string)
  description = "Secret permissions"
  default     = ["get"]

}

variable "storage_permissions " {

  type        = list(string)
  description = "Storage permissions"
  default     = ["get"]


}

/* Key Secret Name */
variable "private_key_secret_name" {
  description = "Name for Key Secret"
  default     = "MyKeySecretName"
  type        = string
  sensitive   = true

}

variable "public_key_secret_name" {
  description = "Name for Key Secret"
  default     = "MyKeySecretName"
  type        = string
  sensitive   = true

}
