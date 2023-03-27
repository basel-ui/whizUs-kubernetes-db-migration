terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.30.0"  
    }
  }
}

provider "azurerm" {
  subscription_id = "e18ec77a-7e31-4ad0-bf0e-b10fa2129505"
  skip_provider_registration = "true"
  features {}
}