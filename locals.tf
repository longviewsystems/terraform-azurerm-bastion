locals {
  nsgrules = {

    AllowHttpsInbound = {
      name                       = "AllowHttpsInbound"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }

    AllowGatewayManagerInbound = {
      name                       = "AllowGatewayManagerInbound"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "GatewayManager"
      destination_address_prefix = "*"
    }

    AllowLoadBalancerInbound = {
      name                       = "AllowLoadBalancerInbound"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
    }
    AllowBastionHostCommunication = {
      name                       = "AllowBastionHostCommunication"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [8080, 5701]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    AllowSshRdpOutbound = {
      name                       = "AllowSshRdpOutbound"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [22, 3389]
      source_address_prefix      = "*"
      destination_address_prefix = "VirtualNetwork"
    }
    AllowAzureCloudOutbound = {
      name                       = "AllowAzureCloudOutbound"
      priority                   = 110
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "*"
      destination_address_prefix = "AzureCloud"
    }
    AllowBastionCommunication = {
      name                       = "AllowBastionCommunication"
      priority                   = 120
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [8080, 5701]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    AllowGetSessionInformation = {
      name                       = "AllowGetSessionInformation"
      priority                   = 130
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [80]
      source_address_prefix      = "*"
      destination_address_prefix = "Internet"
    }
  }

}