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
  azurerm_admin_password = "P@55w0rd1"
  azurerm_admin_username = "terraformadmin"
  azurerm_location = "Central US"
}
# Module staging-network config
module "staging-network" {
  source      = "../../modules/network"
  environment = "staging"
  environment_index = "2"
  azurerm_admin_password = "P@55w0rd1"
  azurerm_admin_username = "terraformadmin"
  azurerm_location = "Central US"
}
# Module staging-services config
module "staging-services" {
  source      = "../../modules/services"
  environment = "staging"
  environment_index = "2"
  azurerm_admin_password = "P@55w0rd1"
  azurerm_admin_username = "terraformadmin"
  azurerm_location = "Central US"
}