# Generated using https://github.com/mrlesmithjr/terraform-builder
# Resource AzureRM resource group
resource "azurerm_resource_group" "example_rg_root" {
  name     = format("example-rg-root-%s", substr(var.environment, 0, 4))
  location = var.azurerm_location
}
# Resource AzureRM virtual network
resource "azurerm_virtual_network" "example_net" {
  name                = format("example-net-%s", substr(var.environment, 0, 4))
  address_space       = ["10.0.0.0/16"]
  location            = var.azurerm_location
  resource_group_name = azurerm_resource_group.example_rg_root.name
}
# Resource AzureRM subnet
resource "azurerm_subnet" "example_net_subnet_0" {
  name                 = format("example-net_subnet_0-%s", substr(var.environment, 0, 4))
  resource_group_name  = azurerm_resource_group.example_rg_root.name
  virtual_network_name = azurerm_virtual_network.example_net.name
  address_prefix       = "10.0.1.0/24"
}
# Resource AzureRM subnet
resource "azurerm_subnet" "example_net_subnet_1" {
  name                 = format("example-net_subnet_1-%s", substr(var.environment, 0, 4))
  resource_group_name  = azurerm_resource_group.example_rg_root.name
  virtual_network_name = azurerm_virtual_network.example_net.name
  address_prefix       = "10.0.2.0/24"
}
# Resource AzureRM network interface
resource "azurerm_network_interface" "example_vm_root" {
  count               = 1
  name                = format("example-vm-root-%02s-nic-%s", count.index + 1, substr(var.environment, 0, 4))
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
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  os_profile {
    computer_name  = format("example-vm-root-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
    admin_username = var.azurerm_admin_username
    admin_password = var.azurerm_admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  storage_os_disk {
    name              = format("example-vm-root-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  tags = {"environment": "${var.environment}"}
}
# Resource DigitalOcean firewall
resource "digitalocean_firewall" "default" {
  name = format("default-server-rules-root-%s", var.environment)
  droplet_ids = concat(digitalocean_droplet.example_vm.*.id)
  tags     = [digitalocean_tag.default_firewall.id, digitalocean_tag.default_firewall_env.id]
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = []
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
# Resource DigitalOcean firewall
resource "digitalocean_firewall" "web" {
  name = format("web-server-rules-root-%s", var.environment)
  tags     = []
  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = []
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = []
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = []
  }
  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "default_firewall" {
  name = "default-firewall"
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "default_firewall_env" {
  name = format("%s", var.environment)
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "example_digitalocean" {
  name = "example-digitalocean"
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "example_digitalocean_env" {
  name = format("%s", var.environment)
}
# Resource DigitalOcean virtual machine
resource "digitalocean_droplet" "example_vm" {
  count    = 1
  name     = format("example-vm-%02s.%s.%s", count.index + 1, var.environment, var.do_domain)
  image    = "ubuntu-18-04-x64"
  region   = var.do_region
  size     = "s-1vcpu-1gb"
  ssh_keys = var.do_ssh_keys
  private_networking = true
  tags     = [digitalocean_tag.example_digitalocean.id, digitalocean_tag.example_digitalocean_env.id]
}
# Resource DigitalOcean internal DNS record
resource "digitalocean_record" "example_vm_internal" {
  count  = 1
  domain = format("%s.%s.%s", "internal", var.environment, var.do_domain)
  type   = "A"
  name   = format("example_vm-%02s", count.index + 1)
  value  = digitalocean_droplet.example_vm[count.index].ipv4_address_private
}
# Resource DigitalOcean internal DNS record
resource "digitalocean_record" "portal_internal" {
  count  = 1
  domain = format("%s.%s.%s", "internal", var.environment, var.do_domain)
  type   = "A"
  name   = "portal"
  value  = digitalocean_droplet.example_vm[count.index].ipv4_address_private
}
# Resource DigitalOcean project
resource "digitalocean_project" "example" {
  name        = format("example-%s", var.environment)
  description = format("Example project - %s", var.environment)
  purpose     = format("Just to demonstrate an example project - %s", var.environment)
  environment = var.environment
  resources   = [for resource in flatten(local.project_resources) : resource]
}
# Obtain list of project resources as local and use
locals {
  project_resources = [digitalocean_droplet.example_vm.*.urn]
}
# Resource vSphere datacenter
resource "vsphere_datacenter" "example_dc" {
  name = "example-dc"
}
# Data vSphere virtual machine template
data "vsphere_virtual_machine" "ubuntu1604_x64" {
  name          = "ubuntu1604_x64"
  datacenter_id = vsphere_datacenter.example_dc.id
}
# Data vSphere virtual machine template
data "vsphere_virtual_machine" "ubuntu1804_x64" {
  name          = "ubuntu1804_x64"
  datacenter_id = vsphere_datacenter.example_dc.id
}
# Data vSphere virtual machine template
data "vsphere_virtual_machine" "windows2019_x64" {
  name          = "windows2019_x64"
  datacenter_id = vsphere_datacenter.example_dc.id
}
# Data vSphere network
data "vsphere_network" "example_pg" {
  name          = "example-pg"
  datacenter_id = vsphere_datacenter.example_dc.id
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
  count    = 1
  name     = format("example-vm-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
  num_cpus = 1
  memory   = 2048
  network_interface {
    network_id = data.vsphere_network.example_pg.id
  }
  resource_pool_id = vsphere_compute_cluster.example_cluster.resource_pool_id

  tags = ["vsphere_tag.example_vsphere.id"]
}
# Resource vSphere virtual machine
resource "vsphere_virtual_machine" "example_vm_from_template" {
  count    = 1
  name     = format("example-vm-from-template-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
  num_cpus = 1
  memory   = 2048
  network_interface {
    network_id = data.vsphere_network.example_pg.id
  }
  resource_pool_id = vsphere_compute_cluster.example_cluster.resource_pool_id
  guest_id         = data.vsphere_virtual_machine.ubuntu1804_x64.guest_id
  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu1804_x64.id
    customize {
      linux_options {
      host_name = format("example-vm-from-template-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
      domain    = var.vsphere_domain
      }
      network_interface {
        ipv4_address = cidrhost("192.168.250.0/24", count.index + 1 + ((var.environment_index) * 1))
        ipv4_netmask = 24
      }
      ipv4_gateway = "192.168.250.1"
    }
  }
  # https://github.com/terraform-providers/terraform-provider-vsphere/issues/523
  disk {
    label            = format("example-vm-from-template_%02s.vmdk", count.index + 1)
    size             = "1"
    thin_provisioned = "1"
    eagerly_scrub    = "0"
  }

  tags = ["vsphere_tag.example_vsphere.id"]
}
# Resource vSphere virtual machine
resource "vsphere_virtual_machine" "example_win_vm_from_template" {
  count    = 1
  name     = format("example-win-vm-from-template-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
  num_cpus = 1
  memory   = 2048
  network_interface {
    network_id = data.vsphere_network.example_pg.id
  }
  resource_pool_id = vsphere_compute_cluster.example_cluster.resource_pool_id
  guest_id         = data.vsphere_virtual_machine.windows2019_x64.guest_id
  clone {
    template_uuid = data.vsphere_virtual_machine.windows2019_x64.id
    customize {
      windows_options {
        computer_name  = format("example-win-vm-from-template-%02s-%s", count.index + 1, substr(var.environment, 0, 4))
      }
    }
  }
  # https://github.com/terraform-providers/terraform-provider-vsphere/issues/523
  disk {
    label            = format("example-win-vm-from-template_%02s.vmdk", count.index + 1)
    size             = "1"
    thin_provisioned = "1"
    eagerly_scrub    = "0"
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