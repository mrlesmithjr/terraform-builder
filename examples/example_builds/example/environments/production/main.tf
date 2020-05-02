# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module production-root config
module "production-root" {
  source      = "../../root"
  environment = "production"
  environment_index = "1"
  azurerm_client_id = ""
  azurerm_client_secret = ""
  azurerm_environment = "public"
  azurerm_subscription_id = ""
  azurerm_tenant_id = ""
  do_domain = "example.org"
  do_ssh_keys = [12121212]
  vsphere_allow_unverified_ssl = "false"
  vsphere_host_password = ""
  vsphere_host_username = ""
  vsphere_password = ""
  vsphere_server = ""
  vsphere_username = ""
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
  do_region = "sfo2"
  vsphere_domain = "example.org"
}
# Module production-network config
module "production-network" {
  source      = "../../modules/network"
  environment = "production"
  environment_index = "1"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
  do_region = "sfo2"
  vsphere_domain = "example.org"
}
# Module production-services config
module "production-services" {
  source      = "../../modules/services"
  environment = "production"
  environment_index = "1"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
  do_region = "sfo2"
  vsphere_domain = "example.org"
}