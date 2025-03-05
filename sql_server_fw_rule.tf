# Create SQL Firewall Rule (Allow all IPs)
resource "azurerm_mssql_firewall_rule" "fw_rule" {
  name             = "AllowedIPs"
  server_id       = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
