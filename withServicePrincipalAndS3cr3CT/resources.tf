/* Providing Login Credentials */
provider "azurerm" {

  features {
    /* Key Module Format */
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }

  /* Passing Credentials to Terraform */
  subscription_id = module.user_details.0.subscription_id
  client_id       = module.user_details.0.client_id
  client_secret   = module.user_details.0.object_id
  tenant_id       = module.user_details.0.tenant_id
}



