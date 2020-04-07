# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module development-root config
module "development-root" {
  source      = "../../root"
  environment = "development"
  environment_index = "0"
  azurerm_client_id = ""
  azurerm_client_secret = ""
  azurerm_environment = "public"
  azurerm_subscription_id = ""
  azurerm_tenant_id = ""
  vsphere_allow_unverified_ssl = "false"
  vsphere_host_password = ""
  vsphere_host_username = ""
  vsphere_password = ""
  vsphere_server = ""
  vsphere_username = ""
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "West US"
  vsphere_domain = "example.org"
}
# Module development-network config
module "development-network" {
  source      = "../../modules/network"
  environment = "development"
  environment_index = "0"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "West US"
  vsphere_domain = "example.org"
}
# Module development-services config
module "development-services" {
  source      = "../../modules/services"
  environment = "development"
  environment_index = "0"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "West US"
  vsphere_domain = "example.org"
}