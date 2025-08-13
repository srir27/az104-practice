terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.33.0"
    }
  }
  required_version = ">= 1.12.0"
  backend "azurerm" {
  use_azuread_auth = false
}
}

provider "azurerm" {
  # Configuration options
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }

  }
  #subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "North Europe"
}

