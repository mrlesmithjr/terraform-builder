# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module production-root config
module "production-root" {
  source      = "../../root"
  environment = "production"
  azurerm_location   = "West US 2"
  do_region   = "sfo2"
}
# Module production-network config
module "production-network" {
  source      = "../../modules/network"
  environment = "production"
  azurerm_location   = "West US 2"
  do_region   = "sfo2"
}
# Module production-services config
module "production-services" {
  source      = "../../modules/services"
  environment = "production"
  azurerm_location   = "West US 2"
  do_region   = "sfo2"
}