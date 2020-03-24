# Generated using https://github.com/mrlesmithjr/terraform-builder
# Data AzureRM resource group
data "azurerm_resource_group" "default" {
  name = "default"
}
# Resource DigitalOcean virtual machine
resource "digitalocean_droplet" "test_do_root" {
  count  = 1
  name   = format("test-do-root-%02s-%s", count.index + 1, substr(var.environment,0,4))
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
  username = "root"
  password = "password"
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
  name             = format("example-vm-%02s-%s", count.index + 1, substr(var.environment,0,4))
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