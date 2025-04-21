# Tenant B VNET data source
data "azurerm_virtual_network" "tenantb_resource_vnet" {
  for_each            = toset(var.tenantb_vnets)
  provider            = azurerm.tenantb
  name                = each.value
  resource_group_name = var.tenantb_resource_group_name
}

# Tenant A vHub data source
data "azurerm_virtual_hub" "tenanta_vhub" {
  name                = "EastUS-Hub"
  resource_group_name = var.tenanta_resource_group_name
}

# Tenant A Priavte DNS Zone data source
data "azurerm_private_dns_zone" "azrcloud" {
  name                = "azr.cloud"
  resource_group_name = var.tenanta_resource_group_name
}