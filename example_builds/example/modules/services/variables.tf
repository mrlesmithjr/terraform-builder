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
# Variable azurerm_location config
variable "azurerm_location" {
    type = string
    description = "Default AzureRM location/region"
    default = ""
}
# Variable azurerm_admin_password config
variable "azurerm_admin_password" {
    type = string
    description = "Default admin password"
}
# Variable azurerm_admin_public_key config
variable "azurerm_admin_public_key" {
    type = string
    description = "Default admin SSH public key"
}
# Variable azurerm_admin_username config
variable "azurerm_admin_username" {
    type = string
    description = "Default admin username"
}
# Variable do_api_endpoint config
variable "do_api_endpoint" {
    type = string
    description = "This can be used to override the base URL for DigitalOcean API requests"
    default = "https://api.digitalocean.com"
}
# Variable do_domain config
variable "do_domain" {
    type = string
    description = "Default DigitalOcean domain for resources"
    default = ""
}
# Variable do_region config
variable "do_region" {
    type = string
    description = "DigitalOcean region"
    default = ""
}
# Variable do_ssh_keys config
variable "do_ssh_keys" {
    description = "DigitalOcean SSH keys to deploy to new droplets"
    default = []
}
# Variable do_token config
variable "do_token" {
    type = string
    description = "This is the DO API token"
    default = ""
}
# Variable vsphere_domain config
variable "vsphere_domain" {
    type = string
    description = "Domain to use for resources"
    default = ""
}