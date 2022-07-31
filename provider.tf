terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.15.0"
     }
  }
}

provider "azurerm" {
  subscription_id = "d227de07-9426-416c-b112-49233e369b61"
  features {
    
  }
}