variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
}

# Per environment variables. Defined here so that we can apply different settings in each env.
locals {
  per_environment_settings = {
    dev = {
      location     = "uksouth"
      vnet_enabled = true
      networks = {
        main = {
          vnet_address_space   = ["10.0.0.0/16"]
          app_sn_address_apace = ["10.0.1.0/24"]
        }
      }
    }

    qa = {
      location = "uksouth"
      vnet_enabled = false
    }

    prod = {
      location = "eunorth"
      vnet_enabled = false
    }
  }

  location     = local.per_environment_settings[var.environment].location
  networks     = local.per_environment_settings[var.environment].networks
  vnet_enabled = local.per_environment_settings[var.environment].vnet_enabled

}

variable "tags" {
  type        = map(any)
  description = "a map of tags to apply"
}
