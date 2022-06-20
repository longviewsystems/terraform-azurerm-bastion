#-----------------------------------------------------------------------
# Subnets Creation for Azure Bastion Service 
#-----------------------------------------------------------------------
resource "azurerm_subnet" "bastion_snet" {
  count                = var.azure_bastion_subnet_address_prefix != null ? 1 : 0
  name                 = var.azure_bastion_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.azure_bastion_subnet_address_prefix
}

resource "azurerm_network_security_group" "bastion" {
  name                = "bastion"
  location            = var.location
  resource_group_name = var.resource_group_name
  depends_on = [
    azurerm_subnet.bastion_snet
  ]
}

resource "azurerm_network_security_rule" "bastion" {
  for_each                    = local.nsgrules
  name                        = each.key
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.bastion.name
}


resource "azurerm_subnet_network_security_group_association" "bastion" {
  subnet_id                 = azurerm_subnet.bastion_snet[0].id
  network_security_group_id = azurerm_network_security_group.bastion.id
  depends_on                = [azurerm_network_security_rule.bastion]
}


#---------------------------------------------
# Public IP for Azure Bastion Service
#---------------------------------------------
resource "azurerm_public_ip" "pip" {
  name                = lower("${var.azure_bastion_service_name}-${var.location}-pip")
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
  domain_name_label   = var.domain_name_label
  tags                = merge({ "ResourceName" = lower("${var.azure_bastion_service_name}-${var.location}-pip") }, var.tags, )

  lifecycle {
    ignore_changes = [
      tags,
      ip_tags,
    ]
  }
}

#---------------------------------------------
# Azure Bastion Service host
#---------------------------------------------
resource "azurerm_bastion_host" "main" {
  name                   = lower(var.azure_bastion_service_name)
  location               = var.location
  resource_group_name    = var.resource_group_name
  copy_paste_enabled     = var.enable_copy_paste
  file_copy_enabled      = var.bastion_host_sku == "Standard" ? var.enable_file_copy : null
  sku                    = var.bastion_host_sku
  ip_connect_enabled     = var.enable_ip_connect
  scale_units            = var.bastion_host_sku == "Standard" ? var.scale_units : 2
  shareable_link_enabled = var.bastion_host_sku == "Standard" ? var.enable_shareable_link : null
  tunneling_enabled      = var.bastion_host_sku == "Standard" ? var.enable_tunneling : null
  tags                   = merge({ "ResourceName" = lower(var.azure_bastion_service_name) }, var.tags, )

  ip_configuration {
    name                 = "${lower(var.azure_bastion_service_name)}-network"
    subnet_id            = azurerm_subnet.bastion_snet[0].id
    public_ip_address_id = azurerm_public_ip.pip.id
  }
}
