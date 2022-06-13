module "azure-bastion" {
  source                       = "../../" #testing root module.
  resource_group_name          = azurerm_resource_group.fixture.name
  tags                         = var.tags
  virtual_network_name         = azurerm_virtual_network.vnet.name
  azure_bastion_service_name   = var.azure_bastion_service_name
  azure_bastion_subnet_address_prefix = var.azure_bastion_subnet_address_prefix
  bastion_host_sku                    = var.bastion_host_sku
  scale_units                         = var.scale_units
}
