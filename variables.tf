variable "location" {
  type    = string
  default = "uksouth"
}
variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
}

variable "rg_name" {
  type    = string
  default = "rg-storage-01"
}

variable "storage_account_name" {
  type    = string
}

variable "tags" {
  type    = map(any)
  default = {}
}
