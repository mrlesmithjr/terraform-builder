# Generated using https://github.com/mrlesmithjr/terraform-builder
# Variable environment to use with resources
variable "environment" {
  type    = string
  default = ""
}
# Variable do_api_endpoint config
variable "do_api_endpoint" {
    type = string
    description = "This can be used to override the base URL for DigitalOcean API requests"
    default = "https://api.digitalocean.com"
}
# Variable do_domain config
variable "do_domain" {
    type = string
    description = "Default DigitalOcean domain for resources"
    default = ""
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