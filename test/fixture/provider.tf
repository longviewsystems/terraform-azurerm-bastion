terraform {
  required_version = ">= 1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.99.0, < 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}
