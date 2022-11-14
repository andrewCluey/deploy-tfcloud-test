variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
}

locals {
  per_environment_settings = tomap({
    dev = {
      location = "uksouth"
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

    uat = {
      location = "uksouth"
    }
  })


  location = local.per_environment_settings[var.environment].location

}

variable "tags" {
  type        = map(any)
  description = "a map of tags to apply"
}
