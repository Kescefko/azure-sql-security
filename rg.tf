# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "rg-dbsec-${random_id.suffix.hex}"
  location = var.location
}