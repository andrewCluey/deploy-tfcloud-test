variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
}

locals {
  per_environment_settings = tomap({
    dev = {
      location             = "uksouth"
      vnet_address_space   = ["10.0.0.0/16"]
      app_sn_address_apace = ["10.0.1.0/24"]
    }

    uat = {
      location = "eunorth"
    }

    qa = {
      location = "uksouth"
    }

    prod = {
      location = "eunorth"
    }
  })


  location             = local.per_environment_settings[var.environment].location
  vnet_address_space   = local.per_environment_settings[var.environment].vnet_address_space
  app_sn_address_apace = local.per_environment_settings[var.environment].app_sn_address_apace

}

variable "tags" {
  type        = map(any)
  description = "a map of tags to apply"
}
