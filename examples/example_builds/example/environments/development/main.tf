# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module development-root config
module "development-root" {
  source      = "../../root"
  environment = "development"
  azurerm_location   = "East US"
  do_region   = "nyc1"
  vsphere_allow_unverified_ssl   = "true"
  vsphere_server   = "vc.development.example.org"
}
# Module development-network config
module "development-network" {
  source      = "../../modules/network"
  environment = "development"
  azurerm_location   = "East US"
  do_region   = "nyc1"
  vsphere_allow_unverified_ssl   = "true"
  vsphere_server   = "vc.development.example.org"
}
# Module development-services config
module "development-services" {
  source      = "../../modules/services"
  environment = "development"
  azurerm_location   = "East US"
  do_region   = "nyc1"
  vsphere_allow_unverified_ssl   = "true"
  vsphere_server   = "vc.development.example.org"
}