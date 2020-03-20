
# Variable azrm_environment config
variable "azrm_environment" {
    type = string
    description = "AzureRM Environment"
    default = "public"
}
# Variable azrm_subscription_id config
variable "azrm_subscription_id" {
    type = string
    description = "AzureRM Subscription ID"
    default = ""
}
# Variable azrm_tenant_id config
variable "azrm_tenant_id" {
    type = string
    description = "AzureRM Tenant ID"
    default = ""
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
    description = "DigitialOcean token"
    default = ""
}
# Variable vsphere_allow_unverified_ssl config
variable "vsphere_allow_unverified_ssl" {
    type = bool
    description = "Boolean that can be set to true to disable SSL certificate verification"
    default = "false"
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