# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module staging-root config
module "staging-root" {
  source      = "../../root"
  environment = "staging"
  environment_index = "2"
  azurerm_client_id = ""
  azurerm_client_secret = ""
  azurerm_environment = "public"
  azurerm_subscription_id = ""
  azurerm_tenant_id = ""
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "Central US"
}
# Module staging-network config
module "staging-network" {
  source      = "../../modules/network"
  environment = "staging"
  environment_index = "2"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "Central US"
}
# Module staging-services config
module "staging-services" {
  source      = "../../modules/services"
  environment = "staging"
  environment_index = "2"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_public_key = var.azurerm_admin_public_key
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "Central US"
}