terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
    azapi = {
      source  = "azure/azapi"
      version = "=2.2.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.tenanta_subscription_id
  tenant_id       = var.tenanta_id
}