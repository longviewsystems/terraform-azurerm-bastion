azure_bastion_service_name          = "testbastion-service"
azure_bastion_subnet_address_prefix = ["10.2.1.192/26"]
bastion_host_sku                    = "Standard"
scale_units                         = 10
tags = {
  Env   = "dev"
  Owner = "Terraform"
}
azure_bastion_subnet_name = "AzureBastionSubnet"
location                  = "EastUS"
dns_servers               = ["10.2.1.10"]
vnet_address_space        = ["10.2.0.0/16"]