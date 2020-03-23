# Generated using https://github.com/mrlesmithjr/terraform-builder
# Module network config
module "network" {
    source      = "../../modules/network"
    environment = "development"
    do_api_endpoint = "https://api.digitalocean.com"
    do_domain = ""
    do_image = "ubuntu-18-04-x64"
    do_region = "nyc1"
    do_ssh_keys = "[]"
    do_token = ""
}
# Module services config
module "services" {
    source      = "../../modules/services"
    environment = "development"
    vsphere_allow_unverified_ssl = "false"
    vsphere_compute_cluster = ""
    vsphere_datacenter = ""
    vsphere_network = ""
    vsphere_password = ""
    vsphere_resource_pool = ""
    vsphere_server = ""
    vsphere_username = ""
}