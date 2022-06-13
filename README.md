# Overview
This repo creates an Azure Bastion Module, and commonly required configurations for Azure Bastion service.

# References
* [What is Azure Bastion?](https://docs.microsoft.com/en-us/azure/bastion/bastion-overview)
* [Terraform - azurerm_bastion_host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host#example-usage)
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

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->