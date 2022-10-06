terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.45.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
  }
  /*backend "azurerm" {
    resource_group_name  = "rg-name"
    storage_account_name = "saname"
    container_name       = "tfstate"
    key                  = "aro.tfstate"
  }*/
}

provider "azurerm" {
  features {}
}
