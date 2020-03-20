# Generated using https://github.com/mrlesmithjr/terraform-builder
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
# Resource DigitalOcean droplet
resource "digitalocean_droplet" "test_do" {
    count  = 1
    name   = format("test-do-%02s", count.index + 1)
    image  = var.do_image
    region = var.do_region
    size   = "s-1vcpu-1gb"
}
# Resource vSphere virtual machine
resource "vsphere_virtual_machine" "test_vs" {
    count            = 1
    name             = format("test-vs-%02s", count.index + 1)
    num_cpus         = 1
    memory           = 2
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    network_interface {
      network_id = data.vsphere_network.network.id
    }
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "test_digitalocean" {
  name = "test-digitalocean"
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