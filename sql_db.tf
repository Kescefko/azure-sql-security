# Create SQL Database with AdventureWorks Sample
resource "azurerm_mssql_database" "sql_db" {
  name                 = "db-adv-works"
  server_id            = azurerm_mssql_server.sql_server.id
  collation            = "SQL_Latin1_General_CP1_CI_AS"
  license_type         = "LicenseIncluded"
  max_size_gb          = 2
  sku_name             = "Basic"
  sample_name          = "AdventureWorksLT"
}
