# Tenant B VNET Connection
resource "azurerm_virtual_hub_connection" "tenantb_resource_connection" {
  for_each                  = toset(var.tenantb_vnets)
  name                      = "${each.value}-vhub-connection"
  virtual_hub_id            = data.azurerm_virtual_hub.tenanta_vhub.id
  remote_virtual_network_id = data.azurerm_virtual_network.tenantb_resource_vnet[each.value].id
}

#Private DNS Zone Link for Tenant B
resource "azurerm_private_dns_zone_virtual_network_link" "vmb_link" {
  name                  = "vm-tenantb-vnet-link"
  resource_group_name   = var.tenanta_resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.azrcloud.name
  virtual_network_id    = data.azurerm_virtual_network.tenantb_resource_vnet["vm-spoke-tenant-b-vnet"].id
}