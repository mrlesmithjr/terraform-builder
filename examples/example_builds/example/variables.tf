
variable "do_region" {
    type = "string"
    description = "DigitalOcean region"
    default = "nyc1"
}
variable "do_ssh_keys" {
    type = "string"
    description = "DigitalOcean SSH keys to deploy to new droplets"
    default = "[]"
}
variable "do_token" {
    type = "string"
    description = "DigitialOcean token"
    default = ""
}