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
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = local.assigned_tags
}

# feature tag - dev only for now
resource "azurerm_virtual_network" "main" {
  for_each = local.vnet_address_space != dev ? [] : toset([1])

  name                = "vn-${var.environment}-main"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = local.vnet_address_space
  tags                = local.assigned_tags

  subnet {
    name           = "app"
    address_prefix = local.app_sn_address_apace
  }
}
