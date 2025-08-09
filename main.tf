# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "9a11755d-a926-4ef7-b329-2f1a3dc2e9c5"
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "North Europe"
}
