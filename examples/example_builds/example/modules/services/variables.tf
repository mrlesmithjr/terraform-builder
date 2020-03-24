# Generated using https://github.com/mrlesmithjr/terraform-builder
# Variable environment to use with resources
variable "environment" {
  type    = string
  default = ""
}
# Variable azurerm_domain config
variable "azurerm_domain" {
    type = string
    description = "Default AzureRM domain for resources"
    default = ""
}
# Variable azurerm_environment config
variable "azurerm_environment" {
    type = string
    description = "AzureRM Environment"
    default = "public"
}
# Variable azurerm_features config
variable "azurerm_features" {
    description = "Customize the behaviour of certain Azure Provider resources."
    default = {}
}
# Variable azurerm_image_reference config
variable "azurerm_image_reference" {
    description = "Default OS image reference lookups"
    default = {"ubuntu-16-04-x64": {"publisher": "Canonical", "offer": "UbuntuServer", "sku": "16.04-LTS", "version": "latest"}, "ubuntu-18-04-x64": {"publisher": "Canonical", "offer": "UbuntuServer", "sku": "18.04-LTS", "version": "latest"}}
}
# Variable azurerm_location config
variable "azurerm_location" {
    type = string
    description = "Default AzureRM location/region"
    default = "East US"
}
# Variable azurerm_subscription_id config
variable "azurerm_subscription_id" {
    type = string
    description = "AzureRM Subscription ID"
    default = ""
}
# Variable azurerm_tenant_id config
variable "azurerm_tenant_id" {
    type = string
    description = "AzureRM Tenant ID"
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