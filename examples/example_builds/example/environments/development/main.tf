# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module network config
module "network" {
  source      = "../../modules/network"
  environment = "development"
}
# Module services config
module "services" {
  source      = "../../modules/services"
  environment = "development"
}