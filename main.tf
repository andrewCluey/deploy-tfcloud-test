# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.77.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_test" {
  name     = var.rg_name
  location = var.location
}


resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.rg_test.name
  location                 = azurerm_resource_group.rg_test.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    deploymentType = "tfc"
  }
}