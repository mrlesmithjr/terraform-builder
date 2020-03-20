# Generated using https://github.com/mrlesmithjr/terraform-builder
# Variable do_api_endpoint config
variable "do_api_endpoint" {
    type = string
    description = "This can be used to override the base URL for DigitalOcean API requests"
    default = "https://api.digitalocean.com"
}
# Variable do_image config
variable "do_image" {
    type = string
    description = "Default DigitalOcean droplet image"
    default = "ubuntu-18-04-x64"
}
# Variable do_region config
variable "do_region" {
    type = string
    description = "DigitalOcean region"
    default = "nyc1"
}
# Variable do_ssh_keys config
variable "do_ssh_keys" {
    type = string
    description = "DigitalOcean SSH keys to deploy to new droplets"
    default = "[]"
}
# Variable do_token config
variable "do_token" {
    type = string
    description = "This is the DO API token"
    default = ""
}