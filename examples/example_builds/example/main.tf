
# Provider AzureRM config
provider "azurerm" {
    environment     = var.azrm_environment
    features        = {}
    subscription_id = var.azrm_subscription_id
    tenant_id       = var.azrm_tenant_id
}
# Provider DigitalOcean config
provider "digitalocean" {
    api_endpoint = "https://api.digitalocean.com"
    token        = var.do_token
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
