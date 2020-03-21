# Generated using https://github.com/mrlesmithjr/terraform-builder
# Variable environment to use with resources
variable "environment" {
  type    = string
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
    default = "{}"
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
# Variable do_api_endpoint config
variable "do_api_endpoint" {
    type = string
    description = "This can be used to override the base URL for DigitalOcean API requests"
    default = "https://api.digitalocean.com"
}
# Variable do_image config
variable "do_image" {
    type = string
    description = "Default DigitalOcean droplet image"
    default = "ubuntu-18-04-x64"
}
# Variable do_region config
variable "do_region" {
    type = string
    description = "DigitalOcean region"
    default = "nyc1"
}
# Variable do_ssh_keys config
variable "do_ssh_keys" {
    type = string
    description = "DigitalOcean SSH keys to deploy to new droplets"
    default = "[]"
}
# Variable do_token config
variable "do_token" {
    type = string
    description = "This is the DO API token"
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