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
    azurerm_domain = ""
    azurerm_environment = "public"
    azurerm_features = "{}"
    azurerm_image_reference = "{'ubuntu-16-04-x64': {'publisher': 'Canonical', 'offer': 'UbuntuServer', 'sku': '16.04-LTS', 'version': 'latest'}, 'ubuntu-18-04-x64': {'publisher': 'Canonical', 'offer': 'UbuntuServer', 'sku': '18.04-LTS', 'version': 'latest'}}"
    azurerm_location = "East US"
    azurerm_subscription_id = ""
    azurerm_tenant_id = ""
    vsphere_allow_unverified_ssl = "false"
    vsphere_compute_cluster = ""
    vsphere_datacenter = ""
    vsphere_network = ""
    vsphere_password = ""
    vsphere_resource_pool = ""
    vsphere_server = ""
    vsphere_username = ""
}