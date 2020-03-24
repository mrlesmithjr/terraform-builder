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