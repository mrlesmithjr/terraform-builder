# Generated using https://github.com/mrlesmithjr/terraform-builder
# Variable environment config
variable "environment" {
    type = string
    default = ""
}
# Variable environment_index config
variable "environment_index" {
    default = ""
}
# Variable azurerm_client_id config
variable "azurerm_client_id" {
    type = string
    description = "Default AzureRM client id"
    default = ""
}
# Variable azurerm_client_secret config
variable "azurerm_client_secret" {
    type = string
    description = "Default AzureRM client secret"
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
    default = ""
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
# Variable do_domain config
variable "do_domain" {
    default = "example.org"
}
# Variable do_region config
variable "do_region" {
    type = string
    description = "DigitalOcean region"
    default = ""
}
# Variable do_ssh_keys config
variable "do_ssh_keys" {
    default = [12121212]
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
# Variable vsphere_domain config
variable "vsphere_domain" {
    type = string
    description = "Define vSphere DNS domain - Used for VMs"
    default = ""
}
# Variable vsphere_host_password config
variable "vsphere_host_password" {
    type = string
    description = "Password for vSphere hosts"
    default = ""
}
# Variable vsphere_host_username config
variable "vsphere_host_username" {
    type = string
    description = "Username for vSphere hosts"
    default = ""
}
# Variable vsphere_password config
variable "vsphere_password" {
    type = string
    description = "Password for vSphere API operations"
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