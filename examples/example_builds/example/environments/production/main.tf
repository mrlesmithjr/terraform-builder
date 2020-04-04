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
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
}
# Module production-network config
module "production-network" {
  source      = "../../modules/network"
  environment = "production"
  environment_index = "1"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
}
# Module production-services config
module "production-services" {
  source      = "../../modules/services"
  environment = "production"
  environment_index = "1"
  azurerm_admin_password = var.azurerm_admin_password
  azurerm_admin_username = var.azurerm_admin_username
  azurerm_location = "East US"
}