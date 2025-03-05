resource "azurerm_log_analytics_workspace" "example" {
  name                = "shared-laws-security-01"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                  = "PerGB2018"
}