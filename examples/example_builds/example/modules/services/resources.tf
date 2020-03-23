# Generated using https://github.com/mrlesmithjr/terraform-builder
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