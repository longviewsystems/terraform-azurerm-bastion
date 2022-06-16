# Overview
This repo creates an Azure Bastion Module, and commonly required configurations for Azure Bastion service.

# References
* [What is Azure Bastion?](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview)
* [Terraform - Azurerm Bastion Host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host#example-usage)
* [Working with NSG access and Azure Bastion](https://docs.microsoft.com/en-us/azure/bastion/bastion-nsg)
------------

# Usage

``` terraform
module "azure-bastion" {
  source                              = "../../" #testing root module.
  resource_group_name                 = "rg-name"
  virtual_network_name                = "vnet-name"
  azure_bastion_service_name          = "bastion-service-name"
  azure_bastion_subnet_address_prefix = ["bastion_subnet_address_prefix"]
  bastion_host_sku                    = "host_sku"
  scale_units                         = scale-units-number
}

```

------------
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=2.99.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=2.99.0, < 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_network_security_group.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.bastion_snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_bastion_service_name"></a> [azure\_bastion\_service\_name](#input\_azure\_bastion\_service\_name) | Specifies the name of the Bastion Host | `string` | `""` | no |
| <a name="input_azure_bastion_subnet_address_prefix"></a> [azure\_bastion\_subnet\_address\_prefix](#input\_azure\_bastion\_subnet\_address\_prefix) | The address prefix to use for the Azure Bastion subnet | `list(any)` | `[]` | no |
| <a name="input_azure_bastion_subnet_name"></a> [azure\_bastion\_subnet\_name](#input\_azure\_bastion\_subnet\_name) | The name of the azure bastion subnet | `string` | `""` | no |
| <a name="input_bastion_host_sku"></a> [bastion\_host\_sku](#input\_bastion\_host\_sku) | The SKU of the Bastion Host. Accepted values are `Basic` and `Standard` | `string` | `"Basic"` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | List of DNS servers to use for virtual network | `list(any)` | `[]` | no |
| <a name="input_domain_name_label"></a> [domain\_name\_label](#input\_domain\_name\_label) | Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system | `string` | `null` | no |
| <a name="input_enable_copy_paste"></a> [enable\_copy\_paste](#input\_enable\_copy\_paste) | Is Copy/Paste feature enabled for the Bastion Host? | `bool` | `true` | no |
| <a name="input_enable_file_copy"></a> [enable\_file\_copy](#input\_enable\_file\_copy) | Is File Copy feature enabled for the Bastion Host. Only supported whne `sku` is `Standard` | `bool` | `false` | no |
| <a name="input_enable_ip_connect"></a> [enable\_ip\_connect](#input\_enable\_ip\_connect) | Is IP Connect feature enabled for the Bastion Host? | `bool` | `false` | no |
| <a name="input_enable_shareable_link"></a> [enable\_shareable\_link](#input\_enable\_shareable\_link) | Is Shareable Link feature enabled for the Bastion Host. Only supported whne `sku` is `Standard` | `bool` | `false` | no |
| <a name="input_enable_tunneling"></a> [enable\_tunneling](#input\_enable\_tunneling) | Is Tunneling feature enabled for the Bastion Host. Only supported whne `sku` is `Standard` | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table' | `string` | `"EastUS"` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | Defines the allocation method for this IP address. Possible values are Static or Dynamic | `string` | `"Static"` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | A container that holds related resources for an Azure solution | `string` | `""` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | The number of scale units with which to provision the Bastion Host. Possible values are between `2` and `50`. `scale_units` only can be changed when `sku` is `Standard`. `scale_units` is always `2` when `sku` is `Basic`. | `number` | `2` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network | `string` | `""` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space to be used for the Azure virtual network. | `list(any)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_azure_bastion_host_fqdn"></a> [azure\_bastion\_host\_fqdn](#output\_azure\_bastion\_host\_fqdn) | The fqdn of the Bastion Host |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | The resource ID of the Bastion Host |
| <a name="output_azure_bastion_public_ip"></a> [azure\_bastion\_public\_ip](#output\_azure\_bastion\_public\_ip) | The public IP of the virtual network gateway |
| <a name="output_azure_bastion_public_ip_fqdn"></a> [azure\_bastion\_public\_ip\_fqdn](#output\_azure\_bastion\_public\_ip\_fqdn) | Fully qualified domain name of the virtual network gateway |
| <a name="output_azure_bastion_subnet_id"></a> [azure\_bastion\_subnet\_id](#output\_azure\_bastion\_subnet\_id) | The resource ID of Azure bastion subnet |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->