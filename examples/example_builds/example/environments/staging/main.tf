# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module staging-root config
module "staging-root" {
  source      = "../../root"
  environment = "staging"
  azurerm_location   = "North Central US"
  do_region   = "ams3"
  vsphere_allow_unverified_ssl   = "true"
  vsphere_server   = "vc.staging.example.org"
}
# Module staging-network config
module "staging-network" {
  source      = "../../modules/network"
  environment = "staging"
  azurerm_location   = "North Central US"
  do_region   = "ams3"
  vsphere_allow_unverified_ssl   = "true"
  vsphere_server   = "vc.staging.example.org"
}
# Module staging-services config
module "staging-services" {
  source      = "../../modules/services"
  environment = "staging"
  azurerm_location   = "North Central US"
  do_region   = "ams3"
  vsphere_allow_unverified_ssl   = "true"
  vsphere_server   = "vc.staging.example.org"
}