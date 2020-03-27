# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module root config
module "root" {
  source      = "../../root"
  environment = "development"
  do_domain   = "dev.example.org"
  do_region   = "nyc1"
}
# Module network config
module "network" {
  source      = "../../modules/network"
  environment = "development"
  do_domain   = "dev.example.org"
  do_region   = "nyc1"
}
# Module services config
module "services" {
  source      = "../../modules/services"
  environment = "development"
  do_domain   = "dev.example.org"
  do_region   = "nyc1"
}