# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module root config
module "root" {
  source      = "../../root"
  environment = "production"
  azurerm_location   = "West US 2"
  do_domain   = "prd.example.org"
  do_region   = "sfo1"
}
# Module network config
module "network" {
  source      = "../../modules/network"
  environment = "production"
  azurerm_location   = "West US 2"
  do_domain   = "prd.example.org"
  do_region   = "sfo1"
}
# Module services config
module "services" {
  source      = "../../modules/services"
  environment = "production"
  azurerm_location   = "West US 2"
  do_domain   = "prd.example.org"
  do_region   = "sfo1"
}