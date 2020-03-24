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
# Resource vSphere virtual machine
resource "vsphere_virtual_machine" "test_vs_services" {
    count            = 1
    name             = format("test-vs-services-%02s-%s", count.index + 1, substr(var.environment,0,4))
    num_cpus         = 2
    memory           = 1
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    network_interface {
      network_id = data.vsphere_network.network.id
    }


    tags   = [vsphere_tag.test_vsphere.id, vsphere_tag.test_vsphere_services.id]
}
# Resource tag category as a default to contain actual vSphere tags
resource "vsphere_tag_category" "category" {
  name        = "terraform-test-category"
  description = "Managed by Terraform"
  cardinality = "SINGLE"

  associable_types = [
    "VirtualMachine",
    "Datastore",
  ]
}
# Resource vSphere tag
resource "vsphere_tag" "test_vsphere" {
  name        = "test-vsphere"
  category_id = vsphere_tag_category.category.id
}
# Resource vSphere tag
resource "vsphere_tag" "test_vsphere_services" {
  name        = "test-vsphere-services"
  category_id = vsphere_tag_category.category.id
}
# Consuming existing vSphere datacenter
data "vsphere_datacenter" "dc" {
    name = var.vsphere_datacenter
}
# Consuming existing vSphere cluster
data "vsphere_compute_cluster" "cluster" {
    name = var.vsphere_compute_cluster
}
# Consuming existing vSphere network
data "vsphere_network" "network" {
    name          = var.vsphere_network
    datacenter_id = data.vsphere_datacenter.dc.id
}