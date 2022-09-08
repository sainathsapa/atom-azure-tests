terraform {
  required_version = ">= 0.14"


  required_providers {

    /* Azure Service Provider*/
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.66.0"
    }

    /* K8S Service Provider*/
    kubernets = {
      source  = "hashicorp/kubernets"
      version = ">= 2.6"
    }

    /* TLS for Key */
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0"
    }
  }


}
