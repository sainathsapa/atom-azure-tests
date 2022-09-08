terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.66.0"
    }
    kubernets = {
      source  = "hashicorp/kubernets"
      version = ">= 2.6"
    }
  }

  required_version = ">= 0.14"
}
