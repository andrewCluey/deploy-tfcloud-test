variable "location" {
  type    = string
  default = "uksouth"
}
variable "environment" {
  type        = string
  description = "The staging environment being deployed into"
  default     = "Dev"
}

variable "rg_name" {
  type    = string
  default = "rg-storage-01"
}

variable "storage_account_name" {
  type    = string
  default = "saukscsxdemo01"
}

variable "tags" {
  type    = map(any)
  default = {}
}
