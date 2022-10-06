resource "azurerm_dns_zone" "aro" {
  name                = "lbercasi.southeastasia.aroapp.io"
  resource_group_name = azurerm_resource_group.aro.name
}
