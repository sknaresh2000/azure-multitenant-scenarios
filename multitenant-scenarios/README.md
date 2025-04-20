## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | =2.2.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | =4.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | =4.1.0 |
| <a name="provider_azurerm.tenantb"></a> [azurerm.tenantb](#provider\_azurerm.tenantb) | =4.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_zone_virtual_network_link.vmb_link](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_virtual_hub_connection.tenantb_resource_connection](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/resources/virtual_hub_connection) | resource |
| [azurerm_private_dns_zone.azrcloud](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/data-sources/private_dns_zone) | data source |
| [azurerm_virtual_hub.tenanta_vhub](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/data-sources/virtual_hub) | data source |
| [azurerm_virtual_network.tenantb_resource_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/4.1.0/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tenanta_id"></a> [tenanta\_id](#input\_tenanta\_id) | ID of Tenand A | `string` | n/a | yes |
| <a name="input_tenanta_resource_group_name"></a> [tenanta\_resource\_group\_name](#input\_tenanta\_resource\_group\_name) | The name of the resource group in Tenant A | `string` | `"azure-multitenant-tenant-a-rg"` | no |
| <a name="input_tenanta_subscription_id"></a> [tenanta\_subscription\_id](#input\_tenanta\_subscription\_id) | ID of the subscription where the resources will be deployed | `string` | n/a | yes |
| <a name="input_tenantb_id"></a> [tenantb\_id](#input\_tenantb\_id) | ID of Tenand B | `string` | n/a | yes |
| <a name="input_tenantb_resource_group_name"></a> [tenantb\_resource\_group\_name](#input\_tenantb\_resource\_group\_name) | The name of the resource group in Tenant B | `string` | `"azure-multitenant-tenant-b-rg"` | no |
| <a name="input_tenantb_subscription_id"></a> [tenantb\_subscription\_id](#input\_tenantb\_subscription\_id) | ID of the subscription residing in Tenand B where the resources will be deployed | `string` | n/a | yes |
| <a name="input_tenantb_vnets"></a> [tenantb\_vnets](#input\_tenantb\_vnets) | List of VNETs in Tenant B | `list(string)` | <pre>[<br/>  "vm-spoke-tenant-b-vnet",<br/>  "dns-spoke-tenant-b-vnet"<br/>]</pre> | no |

## Outputs

No outputs.
