resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_wan" "vwan" {
  name                = var.virtual_wan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  type                = "Standard"
}

resource "azurerm_virtual_hub" "vhub" {
  name                = var.virtual_hub_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_prefix      = var.virtual_hub_address_prefix
  virtual_wan_id      = azurerm_virtual_wan.vwan.id
  sku                 = "Standard"
}

# DNS VNET Connection
resource "azurerm_virtual_hub_connection" "dns_connection" {
  name                      = "vhub_dns_connection"
  virtual_hub_id            = azurerm_virtual_hub.vhub.id
  remote_virtual_network_id = azurerm_virtual_network.dns_vnet.id
}

# VM in Tenant A Connection
resource "azurerm_virtual_hub_connection" "vma_connection" {
  name                      = "vhub_vma_connection"
  virtual_hub_id            = azurerm_virtual_hub.vhub.id
  remote_virtual_network_id = azurerm_virtual_network.vma_vnet.id
}