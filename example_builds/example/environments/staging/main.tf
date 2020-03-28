# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module staging-root config
module "staging-root" {
  source      = "../../root"
  environment = "staging"
  azurerm_location   = "North Central US"
  do_domain   = "stg.example.org"
  do_region   = "ams3"
}
# Module staging-network config
module "staging-network" {
  source      = "../../modules/network"
  environment = "staging"
  azurerm_location   = "North Central US"
  do_domain   = "stg.example.org"
  do_region   = "ams3"
}
# Module staging-services config
module "staging-services" {
  source      = "../../modules/services"
  environment = "staging"
  azurerm_location   = "North Central US"
  do_domain   = "stg.example.org"
  do_region   = "ams3"
}