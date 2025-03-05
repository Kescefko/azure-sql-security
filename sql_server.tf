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