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


# Example of a `feature flag` to deploy resources to ENVS only where its enabled.
resource "azurerm_virtual_network" "main" {
  for_each = { for k, v in local.networks : k => v if local.vnet_enabled }

  name                = "vn-${var.environment}-${each.key}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = each.value.vnet_address_space
  tags                = local.assigned_tags

  subnet {
    name           = "app"
    address_prefix = each.value.app_sn_address_apace
  }
}
