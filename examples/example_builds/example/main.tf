# Generated using https://github.com/mrlesmithjr/terraform-builder
# module: root
# Backend local config
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
# Provider AzureRM config
provider "azurerm" {
  environment = var.azurerm_environment
  features {}
  client_id       = var.azurerm_client_id
  client_secret   = var.azurerm_client_secret
  subscription_id = var.azurerm_subscription_id
  tenant_id       = var.azurerm_tenant_id
}
# Provider DigitalOcean config
provider "digitalocean" {
  api_endpoint = var.do_api_endpoint
  token        = var.do_token
}
# Provider vSphere config
provider "vsphere" {
  allow_unverified_ssl = var.vsphere_allow_unverified_ssl
  password             = var.vsphere_password
  user                 = var.vsphere_username
  vsphere_server       = var.vsphere_server
}
# Module development config
module "development" {
  source      = "./environments/development"
  environment = "development"
}
# Module production config
module "production" {
  source      = "./environments/production"
  environment = "production"
}
# Module staging config
module "staging" {
  source      = "./environments/staging"
  environment = "staging"
}
# Setting required Terraform version or greater
terraform {
  required_version = ">= 0.12.0"
}