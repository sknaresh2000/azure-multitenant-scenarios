# Create a DNS Spoke Virtual Network
resource "azurerm_virtual_network" "dns_vnet" {
  name                = "dns-spoke-tenant-b-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.dns_vnet_address_space
}

# Create a Inbound Subnet for DNS Resolver
resource "azurerm_subnet" "dns_inbound_resolver_subnet" {
  name                 = "inbound"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.dns_vnet.name
  address_prefixes     = var.dns_inbound_resolver_subnet_address_prefix
  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

# Create a Outbound Subnet for DNS Resolver
resource "azurerm_subnet" "dns_outbound_resolver_subnet" {
  name                 = "outbound"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.dns_vnet.name
  address_prefixes     = var.dns_outbound_resolver_subnet_address_prefix
  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

# Create Azure DNS Resolver
resource "azurerm_private_dns_resolver" "dns_resolver" {
  name                = "multitenant-dns-resolver-tenant-b"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_id  = azurerm_virtual_network.dns_vnet.id
}

# Create Outbound Endpoint
resource "azurerm_private_dns_resolver_outbound_endpoint" "outbound_endpoint" {
  name                    = "outbound"
  private_dns_resolver_id = azurerm_private_dns_resolver.dns_resolver.id
  location                = azurerm_resource_group.rg.location
  subnet_id               = azurerm_subnet.dns_outbound_resolver_subnet.id
}

resource "azurerm_private_dns_resolver_dns_forwarding_ruleset" "forwarding_rule_set" {
  name                                       = "forwarding-rule-set"
  private_dns_resolver_outbound_endpoint_ids = [azurerm_private_dns_resolver_outbound_endpoint.outbound_endpoint.id]
  location                                   = azurerm_resource_group.rg.location
  resource_group_name                        = azurerm_resource_group.rg.name
}

resource "azurerm_private_dns_resolver_forwarding_rule" "forwarding_rule" {
  name                      = "default"
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_rule_set.id
  domain_name               = "."
  target_dns_servers {
    ip_address = "10.1.0.4"
    port       = 53
  }
}

resource "azurerm_private_dns_resolver_forwarding_rule" "blob_forwarding_rule" {
  name                      = "blob"
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_rule_set.id
  domain_name               = "privatelink.blob.core.windows.net."
  target_dns_servers {
    ip_address = "10.1.0.4"
    port       = 53
  }
}

resource "azurerm_private_dns_resolver_virtual_network_link" "vmb_link" {
  name                      = "vmb-link"
  dns_forwarding_ruleset_id = azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_rule_set.id
  virtual_network_id        = azurerm_virtual_network.vmb_vnet.id
}