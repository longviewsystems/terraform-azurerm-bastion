/*****************************************
/*   Naming conventions
/*****************************************/

module "naming" {
  source  = "Azure/naming/azurerm"
  version = "0.1.1"
  prefix  = ["mod", "test"]
  # suffix = random_string.random.value

  unique-include-numbers = false
  unique-length          = 4
}

/*****************************************
/*   Resource Group
/*****************************************/

resource "azurerm_resource_group" "fixture" {
  name     = module.naming.resource_group.name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = module.naming.virtual_network.name
  location            = var.location
  resource_group_name = azurerm_resource_group.fixture.name
  dns_servers         = var.dns_servers
  address_space       = var.vnet_address_space
  tags                = var.tags

}

/*****************************************
/*   Resources for VM to test bastion service
     Uncomment the following lines to test the connection between bastion service to the VM. 
/*****************************************/
#resource "azurerm_subnet" "vmsnet" {
#  name                 = "vmsnet"
#  resource_group_name  = azurerm_resource_group.fixture.name
#  virtual_network_name = azurerm_virtual_network.vnet.name
#  address_prefixes     = ["10.2.2.0/24"]
#}
#
#resource "azurerm_network_interface" "vmnic" {
#  name                = module.naming.network_interface.name
#  location            = var.location
#  resource_group_name = azurerm_resource_group.fixture.name
#
#  ip_configuration {
#    name                          = "testvmnic1"
#    subnet_id                     = azurerm_subnet.vmsnet.id
#    private_ip_address_allocation = "Dynamic"
#  }
#}
#
#resource "azurerm_virtual_machine" "testvm" {
#  name                  = module.naming.virtual_machine.name
#  location              = var.location
#  resource_group_name   = azurerm_resource_group.fixture.name
#  network_interface_ids = [azurerm_network_interface.vmnic.id]
#  vm_size               = "Standard_DS1_v2"
#
#  # Uncomment this line to delete the OS disk automatically when deleting the VM
#  # delete_os_disk_on_termination = true
#
#  # Uncomment this line to delete the data disks automatically when deleting the VM
#  # delete_data_disks_on_termination = true
#
#  storage_image_reference {
#    publisher = "Canonical"
#    offer     = "UbuntuServer"
#    sku       = "16.04-LTS"
#    version   = "latest"
#  }
#  storage_os_disk {
#    name              = "myosdisk1"
#    caching           = "ReadWrite"
#    create_option     = "FromImage"
#    managed_disk_type = "Standard_LRS"
#  }
#  os_profile {
#    computer_name  = "hostname"
#    admin_username = "testadmin"
#    admin_password = "Password1234!"
#  }
#  os_profile_linux_config {
#    disable_password_authentication = false
#  }
#  tags = var.tags
#}