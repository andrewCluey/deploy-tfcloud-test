locals {
  default_tags = {
    environment = var.environment
  }
  assigned_tags = merge(local.default_tags, var.tags)
}

resource "azurerm_resource_group" "main" {
  name     = "rg-deploy-tfcloud-${var.environment}"
  location = local.location
  tags     = local.assigned_tags
}

resource "azurerm_storage_account" "main" {
  name                     = "sadeploytfcloud${var.environment}001"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.assigned_tags
}
