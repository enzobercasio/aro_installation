resource "azurerm_resource_group" "aro" {
  name     = "aro-rg-lbercasi"
  location = "southeastasia"
}

module "arovnet" {
  source              = "Azure/vnet/azurerm"
  depends_on          = [azurerm_resource_group.aro]
  resource_group_name = azurerm_resource_group.aro.name
  vnet_name           = "aro-vnet"
  address_space       = ["10.0.0.0/22"]
  subnet_prefixes     = ["10.0.0.0/23", "10.0.2.0/23"]
  subnet_names        = ["master-subnet", "worker-subnet"]
  subnet_service_endpoints = {"master-subnet" = ["Microsoft.ContainerRegistry"],
                              "worker-subnet" = ["Microsoft.ContainerRegistry"]
                             }
  subnet_enforce_private_link_service_network_policies = {
    "master-subnet" = true,
    "worker-subnet" = true
  }
  tags                = {}
}
