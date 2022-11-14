
terraform {
  backend "remote" {
    organization = "asc-solutions"
    workspaces {
      prefix = "deploy-tfcloud-test-"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.6.0"
    }
  }
}

provider "azurerm" {
  features {}
}
