# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module root config
module "root" {
  source      = "../../root"
  environment = "staging"
  do_domain   = "stg.example.org"
  do_region   = "ams3"
}
# Module network config
module "network" {
  source      = "../../modules/network"
  environment = "staging"
  do_domain   = "stg.example.org"
  do_region   = "ams3"
}
# Module services config
module "services" {
  source      = "../../modules/services"
  environment = "staging"
  do_domain   = "stg.example.org"
  do_region   = "ams3"
}