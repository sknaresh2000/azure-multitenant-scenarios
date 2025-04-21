## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | =2.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vmb](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/network_interface) | resource |
| [azurerm_private_dns_resolver.dns_resolver](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_resolver) | resource |
| [azurerm_private_dns_resolver_dns_forwarding_ruleset.forwarding_rule_set](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_resolver_dns_forwarding_ruleset) | resource |
| [azurerm_private_dns_resolver_forwarding_rule.blob_forwarding_rule](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_resolver_forwarding_rule) | resource |
| [azurerm_private_dns_resolver_forwarding_rule.forwarding_rule](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_resolver_forwarding_rule) | resource |
| [azurerm_private_dns_resolver_outbound_endpoint.outbound_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_resolver_outbound_endpoint) | resource |
| [azurerm_private_dns_resolver_virtual_network_link.vmb_link](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_resolver_virtual_network_link) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.dns_inbound_resolver_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/subnet) | resource |
| [azurerm_subnet.dns_outbound_resolver_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/subnet) | resource |
| [azurerm_subnet.vm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.dns_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network.vmb_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_inbound_resolver_subnet_address_prefix"></a> [dns\_inbound\_resolver\_subnet\_address\_prefix](#input\_dns\_inbound\_resolver\_subnet\_address\_prefix) | Address prefix for the DNS Resolver subnet | `list(string)` | <pre>[<br/>  "10.101.0.0/27"<br/>]</pre> | no |
| <a name="input_dns_outbound_resolver_subnet_address_prefix"></a> [dns\_outbound\_resolver\_subnet\_address\_prefix](#input\_dns\_outbound\_resolver\_subnet\_address\_prefix) | Address prefix for the DNS Resolver subnet | `list(string)` | <pre>[<br/>  "10.101.0.32/27"<br/>]</pre> | no |
| <a name="input_dns_vnet_address_space"></a> [dns\_vnet\_address\_space](#input\_dns\_vnet\_address\_space) | Address space for the Virtual Network | `list(string)` | <pre>[<br/>  "10.101.0.0/24"<br/>]</pre> | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where resources will be created | `string` | `"East US"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | `"azure-multitenant-tenant-b-rg"` | no |
| <a name="input_tenantb_id"></a> [tenantb\_id](#input\_tenantb\_id) | ID of Tenand B | `string` | n/a | yes |
| <a name="input_tenantb_subscription_id"></a> [tenantb\_subscription\_id](#input\_tenantb\_subscription\_id) | ID of the subscription where the resources will be deployed | `string` | n/a | yes |
| <a name="input_vmb_admin_password"></a> [vmb\_admin\_password](#input\_vmb\_admin\_password) | Password for VM in Tenant A | `string` | n/a | yes |
| <a name="input_vmb_subnet_address_prefix"></a> [vmb\_subnet\_address\_prefix](#input\_vmb\_subnet\_address\_prefix) | Address prefix for the VM in Tenant A subnet | `list(string)` | <pre>[<br/>  "10.100.0.0/27"<br/>]</pre> | no |
| <a name="input_vmb_vnet_address_space"></a> [vmb\_vnet\_address\_space](#input\_vmb\_vnet\_address\_space) | Address space for the Virtual Network | `list(string)` | <pre>[<br/>  "10.100.0.0/24"<br/>]</pre> | no |

## Outputs

No outputs.
