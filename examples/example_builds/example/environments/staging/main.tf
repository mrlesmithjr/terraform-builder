# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module network config
module "network" {
    source      = "../../modules/network"
    environment = "staging"
    do_api_endpoint = "https://api.digitalocean.com"
    do_domain = ""
    do_region = "nyc1"
    do_ssh_keys = "[]"
    do_token = ""
}
# Module services config
module "services" {
    source      = "../../modules/services"
    environment = "staging"
}