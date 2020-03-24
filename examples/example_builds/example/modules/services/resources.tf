# Generated using https://github.com/mrlesmithjr/terraform-builder
# Resource AzureRM resource group
resource "azurerm_resource_group" "example" {
  name     = "example"
  location = var.azurerm_location
}
# Resource AzureRM virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example"
  address_space       = ["10.0.0.0/16"]
  location            = var.azurerm_location
  resource_group_name = azurerm_resource_group.example.name
}
# Resource AzureRM subnet
resource "azurerm_subnet" "example_subnet_0" {
  name                 = "example_subnet_0"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix       = "10.0.1.0/24"
}
# Resource AzureRM subnet
resource "azurerm_subnet" "example_subnet_1" {
  name                 = "example_subnet_1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefix       = "10.0.2.0/24"
}
# Resource AzureRM network interface
resource "azurerm_network_interface" "test-az-root" {
  count               = 2
  name                = format("test-az-root-%02s-nic", count.index +1)
  location            = var.azurerm_location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = format("test-az-root-%02s-ip-config", count.index +1)
    subnet_id                     = azurerm_subnet.example_subnet_1.id
    private_ip_address_allocation = "Dynamic"
  }
}
# Resource AzureRM virtual machine
resource "azurerm_virtual_machine" "test_az_root" {
  count                 = 2
  name                  = format("test-az-root-%02s-%s", count.index + 1, substr(var.environment,0,4))
  vm_size               = "Standard_DS1_v2"
  location              = var.azurerm_location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.test-az-root[count.index].id]

  storage_image_reference {
    publisher = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "publisher")
    offer     = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "offer")
    sku       = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "sku")
    version   = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "version")
  }
  storage_os_disk {
    name              = format("test-az-root-%02s-%s", count.index + 1, substr(var.environment,0,4))
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}