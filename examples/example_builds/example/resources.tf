# Generated using https://github.com/mrlesmithjr/terraform-builder
# Resource AzureRM resource group
resource "azurerm_resource_group" "example_rg_root" {
  name     = "example-rg-root"
  location = var.azurerm_location
}
# Resource AzureRM virtual network
resource "azurerm_virtual_network" "example_net" {
  name                = "example-net"
  address_space       = ["10.0.0.0/16"]
  location            = var.azurerm_location
  resource_group_name = azurerm_resource_group.example_rg_root.name
}
# Resource AzureRM subnet
resource "azurerm_subnet" "example_net_subnet_0" {
  name                 = "example-net_subnet_0"
  resource_group_name  = azurerm_resource_group.example_rg_root.name
  virtual_network_name = azurerm_virtual_network.example_net.name
  address_prefix       = "10.0.1.0/24"
}
# Resource AzureRM subnet
resource "azurerm_subnet" "example_net_subnet_1" {
  name                 = "example-net_subnet_1"
  resource_group_name  = azurerm_resource_group.example_rg_root.name
  virtual_network_name = azurerm_virtual_network.example_net.name
  address_prefix       = "10.0.2.0/24"
}
# Resource AzureRM network interface
resource "azurerm_network_interface" "example_vm_root" {
  count               = 1
  name                = format("example-vm-root-%02s-nic", count.index + 1)
  location            = var.azurerm_location
  resource_group_name = azurerm_resource_group.example_rg_root.name

  ip_configuration {
    name                          = format("example-vm-root-%02s-ip-config", count.index + 1)
    subnet_id                     = azurerm_subnet.example_net_subnet_1.id
    private_ip_address_allocation = "Dynamic"
  }
}
# Resource AzureRM virtual machine
resource "azurerm_virtual_machine" "example_vm_root" {
  count                 = 1
  name                  = format("example-vm-root-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
  vm_size               = "Standard_DS1_v2"
  location              = var.azurerm_location
  resource_group_name   = azurerm_resource_group.example_rg_root.name
  network_interface_ids = [azurerm_network_interface.example_vm_root[count.index].id]

  storage_image_reference {
    publisher = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "publisher")
    offer     = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "offer")
    sku       = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "sku")
    version   = lookup(var.azurerm_image_reference.ubuntu-18-04-x64, "version")
  }
  storage_os_disk {
    name              = format("example-vm-root-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  tags = {"environment": "${var.environment}"}
}
# Resource DigitalOcean virtual machine
resource "digitalocean_droplet" "test_do_root" {
  count  = 1
  name   = format("test-do-root-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
  image  = "ubuntu-18-04-x64"
  region = var.do_region
  size   = "s-1vcpu-1gb"


  tags = [digitalocean_tag.test_digitalocean.id, digitalocean_tag.test_digitalocean_root.id]
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "test_digitalocean" {
  name = "test-digitalocean"
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "test_digitalocean_root" {
  name = "test-digitalocean-root"
}
# Resource vSphere datacenter
resource "vsphere_datacenter" "example_dc" {
  name = "example-dc"
}
# Resource vSphere compute cluster
resource "vsphere_compute_cluster" "example_cluster" {
  name          = "example-cluster"
  datacenter_id = vsphere_datacenter.example_dc.id
  # host_system_ids     = ["${data.vsphere_host.hosts.*.id}"]
  drs_enabled          = true
  drs_automation_level = "fullyAutomated"
  ha_enabled           = true
}
# Resource vSphere host
resource "vsphere_host" "example_esxi_01" {
  hostname = "10.10.10.1"
  username = var.vsphere_host_username
  password = var.vsphere_host_password
  cluster  = vsphere_compute_cluster.example_cluster.id
}
# Resource vSphere host virtual switch
resource "vsphere_host_virtual_switch" "example_switch" {
  name             = "example-switch"
  host_system_id   = vsphere_host.example_esxi_01.id
  network_adapters = ["vmnic0", "vmnic1"]
  active_nics      = ["vmnic0"]
  standby_nics     = ["vmnic1"]
}
# Resource vSphere host port group
resource "vsphere_host_port_group" "example_pg" {
  name                = "example-pg"
  host_system_id      = vsphere_host.example_esxi_01.id
  virtual_switch_name = vsphere_host_virtual_switch.example_switch.name
}
# Resource vSphere virtual machine
resource "vsphere_virtual_machine" "example_vm" {
  count            = 1
  name             = format("example-vm-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
  num_cpus         = 1
  memory           = 2
  resource_pool_id = vsphere_compute_cluster.example_cluster.resource_pool_id

  network_interface {
    network_id = vsphere_host_port_group.example_pg.id
  }

  tags = ["vsphere_tag.example_vsphere.id"]
}
# Resource vSphere tag category
resource "vsphere_tag_category" "example_category" {
  name        = "example-category"
  description = "Managed by Terraform"
  cardinality = "SINGLE"

  associable_types = ["ClusterComputeResource", "Datacenter", "Datastore", "HostSystem", "VirtualMachine"]
}
# Resource vSphere tag
resource "vsphere_tag" "example_vsphere" {
  name        = "example-vsphere"
  category_id = vsphere_tag_category.example_category.id
  description = "Managed by Terraform"
}