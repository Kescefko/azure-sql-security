variable "resource_group_name" {
  default = "rg-gyorgy-vault-dev"
}

variable "location" {
  default = "Switzerland North"
}

variable "subscription_id" {
  default = "1c2b3b73-e5d4-4ab6-9ac4-c807cb39e0ef"
}

provider "azurerm" {
  features {}
}

# Random suffix for unique naming
resource "random_id" "suffix" {
  byte_length = 4
}

variable "admin_login" {
  default = "kodekloud"
}

variable "admin_password" {
  default = "VMP@55w0rd"
}

