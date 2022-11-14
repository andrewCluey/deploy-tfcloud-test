variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
}


locals {
  per_environment_settings = tomap({
    dev = {
      location = "uksouth"
    }

    prod = {
      location = "eunorth"
    }
  })


  location = local.per_environment_settings[var.environment].location

}


