# Generated using https://github.com/mrlesmithjr/terraform-builder
# Variable environment to use with resources
variable "environment" {
  type    = string
  default = ""
}
# Variable vsphere_allow_unverified_ssl config
variable "vsphere_allow_unverified_ssl" {
    type = bool
    description = "Boolean that can be set to true to disable SSL certificate verification"
    default = "false"
}
# Variable vsphere_compute_cluster config
variable "vsphere_compute_cluster" {
    type = string
    description = "Compute cluster to use by default"
    default = ""
}
# Variable vsphere_datacenter config
variable "vsphere_datacenter" {
    type = string
    description = "Datacenter to use by default"
    default = ""
}
# Variable vsphere_network config
variable "vsphere_network" {
    type = string
    description = "Network to use by default"
    default = ""
}
# Variable vsphere_password config
variable "vsphere_password" {
    type = string
    description = "Password for vSphere API operations"
    default = ""
}
# Variable vsphere_resource_pool config
variable "vsphere_resource_pool" {
    type = string
    description = "The resource pool to put virtual machine's in"
    default = ""
}
# Variable vsphere_server config
variable "vsphere_server" {
    type = string
    description = "vCenter server name for vSphere API operations"
    default = ""
}
# Variable vsphere_username config
variable "vsphere_username" {
    type = string
    description = "Username for vSphere API operations"
    default = ""
}