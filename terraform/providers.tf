terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.30.0"  
    }
  }
}

provider "azurerm" {
  subscription_id = "0fae3288-9176-4b50-b829-4659df3e4b66"
  skip_provider_registration = "true"
  features {}
}