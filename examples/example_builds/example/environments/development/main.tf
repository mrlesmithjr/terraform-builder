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
  azurerm_admin_password = "P@55w0rd1"
  azurerm_admin_username = "terraformadmin"
  azurerm_location = "West US"
}
# Module development-network config
module "development-network" {
  source      = "../../modules/network"
  environment = "development"
  environment_index = "0"
  azurerm_admin_password = "P@55w0rd1"
  azurerm_admin_username = "terraformadmin"
  azurerm_location = "West US"
}
# Module development-services config
module "development-services" {
  source      = "../../modules/services"
  environment = "development"
  environment_index = "0"
  azurerm_admin_password = "P@55w0rd1"
  azurerm_admin_username = "terraformadmin"
  azurerm_location = "West US"
}