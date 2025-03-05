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

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-dbsec-${random_id.suffix.hex}"
  location = var.location
}

# Create SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = "sql-server-${random_id.suffix.hex}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.admin_login
  administrator_login_password = var.admin_password

  # Security Settings
  minimum_tls_version = "1.2"
}

# Create SQL Firewall Rule (Allow all IPs)
resource "azurerm_mssql_firewall_rule" "fw_rule" {
  name             = "AllowedIPs"
  server_id       = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Create SQL Database with AdventureWorks Sample
resource "azurerm_mssql_database" "sql_db" {
  name                 = "db-adv-works"
  server_id            = azurerm_mssql_server.sql_server.id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  max_size_gb          = 2
  sku_name             = "Basic"
  sample_name          = 
