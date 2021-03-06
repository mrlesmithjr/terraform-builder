# Generated using https://github.com/mrlesmithjr/terraform-builder
# Project root main.tf


# Module development config
module "development" {
  source            = "./environments/development"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "West US"
  do_region = "nyc1"
  vsphere_domain = "example.org"
}
# Module production config
module "production" {
  source            = "./environments/production"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
  do_region = "sfo2"
  vsphere_domain = "example.org"
}
# Module staging config
module "staging" {
  source            = "./environments/staging"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "Central US"
  do_region = "nyc3"
  vsphere_domain = "example.org"
}
# Generated using https://github.com/mrlesmithjr/terraform-builder

# Provider AzureRM config
provider "azurerm" {
  environment = var.azurerm_environment
  features    {}
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

# Resource DigitalOcean project
resource "digitalocean_project" "example" {
  name        = "example"
  description = "Example project"
  purpose     = "Just to demonstrate an example project"
  resources   = [for resource in flatten(local.project_root_resources) : resource]
}
# Resource DigitalOcean domain
resource "digitalocean_domain" "example_org" {
  name = "example.org"
}
# Resource DigitalOcean DNS record
resource "digitalocean_record" "services_example_org" {
  domain = digitalocean_domain.example_org.name
  type   = "CNAME"
  name   = "services"
  value  = "production.services.example.org."
}
# Obtain list of project resources as local and use
locals {
  project_root_resources = [digitalocean_domain.example_org.urn]
}

# Setting required Terraform version or greater
terraform {
  required_version = ">= 0.12.0"
}