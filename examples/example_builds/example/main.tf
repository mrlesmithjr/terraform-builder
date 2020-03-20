
# Provider AzureRM config
provider "azurerm" {
    environment     = var.azurerm_environment
    features        = var.azurerm_features
    subscription_id = var.azurerm_subscription_id
    tenant_id       = var.azurerm_tenant_id
}
# Provider DigitalOcean config
provider "digitalocean" {
    api_endpoint = "https://api.digitalocean.com"
    token        = var.do_token
}
# Provider vSphere config
provider "vsphere" {
    allow_unverified_ssl = var.vsphere_allow_unverified_ssl
    password = var.vsphere_password
    user = var.vsphere_username
    vsphere_server = var.vsphere_server
}
# Module development config
module "development" {
    source = "./environments/development"
}
# Module production config
module "production" {
    source = "./environments/production"
}
# Module staging config
module "staging" {
    source = "./environments/staging"
}
# Setting required Terraform version or greater
terraform {
  required_version = ">= 0.12"
}
