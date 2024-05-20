# Creates a virtual machine and leverages the variable terraform file

#############################################################################
# TERRAFORM CONFIG
#############################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75"
    }
  }
}

#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  features {}
}


#############################################################################
# VIRTUAL NETWORK COMPONENTS RESOURCE DEPLOYMENT - VNET, PUBLIC IP, NIC, NSG
#############################################################################

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group
}

resource "azurerm_subnet" "internal" {
  name                 = "snet-${var.vnet_name}"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "pip" {
  name                    = var.public_ip
  location                = var.location
  resource_group_name     = var.resource_group
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30

}

resource "azurerm_network_interface" "main" {
  name                = "nic-${var.vm_name}"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_security_group" "inwayz" {
  name                = var.network_security_group
  location            = var.location
  resource_group_name = var.resource_group

  security_rule {
    name                        = "allow-rdp"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "3389"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
}
}

#############################################################################
# VIRTUAL MACHINE RESOURCE DEPLOYMENT
#############################################################################

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.vm_name
  resource_group_name = var.resource_group
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}