# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module production-root config
module "production-root" {
  source      = "../../root"
  environment = "production"
  environment_index = "1"
  azurerm_location   = "West US 2"
  do_region   = "sfo2"
  vsphere_allow_unverified_ssl   = "false"
  vsphere_server   = "vc.production.example.org"
}
# Module production-network config
module "production-network" {
  source      = "../../modules/network"
  environment = "production"
  environment_index = "1"
  azurerm_location   = "West US 2"
  do_region   = "sfo2"
  vsphere_allow_unverified_ssl   = "false"
  vsphere_server   = "vc.production.example.org"
}
# Module production-services config
module "production-services" {
  source      = "../../modules/services"
  environment = "production"
  environment_index = "1"
  azurerm_location   = "West US 2"
  do_region   = "sfo2"
  vsphere_allow_unverified_ssl   = "false"
  vsphere_server   = "vc.production.example.org"
}