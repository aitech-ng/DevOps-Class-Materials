terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.40.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dev_resource_group" {
  name     = "dev-resource-group"
  location = "West Europe"
}

resource "azurerm_virtual_network" "dev_virtual_network" {
  name                = "dev-virtual-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.dev_resource_group.location
  resource_group_name = azurerm_resource_group.dev_resource_group.name
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.dev_resource_group.name
  virtual_network_name = azurerm_virtual_network.dev_virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "network_interface" {
  name                = "main-nic"
  location            = azurerm_resource_group.dev_resource_group.location
  resource_group_name = azurerm_resource_group.dev_resource_group.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "dev_server" {
  name                = "dev-server"
  resource_group_name = azurerm_resource_group.dev_resource_group.name
  location            = azurerm_resource_group.dev_resource_group.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.network_interface.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}