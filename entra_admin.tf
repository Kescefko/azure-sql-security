# resource "azurerm_mssql_active_directory_administrator" "sql_ad_admin" {
#   server_id            = azurerm_mssql_server.sql_server.id
#   login               = "MyAADAdmin"  # This is just a display name
#   object_id           = data.azuread_client_config.current.object_id
#   tenant_id           = data.azuread_client_config.current.tenant_id
# }