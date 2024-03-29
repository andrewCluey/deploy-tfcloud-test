# Vars to apply to all environments (see terraform.auto.tfvars & Terraformn Cloud Workspace.)
variable "tags" {
  type        = map(any)
  description = "a map of tags to apply"
}

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
          app_sn_address_apace = "10.0.1.0/24"
        }
      }
    }

    qa = {
      location     = "uksouth"
      vnet_enabled = false
      networks = {
        main = {
          vnet_address_space   = ["10.1.0.0/16"]
          app_sn_address_apace = "10.1.1.0/24"
        }
      }
    }

    prod = {
      location     = "eunorth"
      vnet_enabled = false
      networks = {
        main = {
          vnet_address_space   = ["10.2.0.0/16"]
          app_sn_address_apace = "10.2.1.0/24"
        }
      }
    }
  }
}

# local vars used in resource definitions.
locals {
  location     = local.per_environment_settings[var.environment].location
  networks     = local.per_environment_settings[var.environment].networks
  vnet_enabled = local.per_environment_settings[var.environment].vnet_enabled
}


