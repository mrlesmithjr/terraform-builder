
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