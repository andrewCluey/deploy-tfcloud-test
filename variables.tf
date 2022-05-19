
variable "rg_name" {
  type    = string
  default = "rg-storage-01"
}

variable "location" {
  type    = string
  default = "uksouth"
}

variable "storage_account_name" {
  type    = string
  default = "saukscsxdemo01"
}

variable "tags" {
  type    = map(any)
  default = {}
}
