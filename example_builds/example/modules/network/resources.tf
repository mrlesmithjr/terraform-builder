# Generated using https://github.com/mrlesmithjr/terraform-builder
# Resource DigitalOcean tag
resource "digitalocean_tag" "default_firewall" {
  name = "default-firewall"
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "default_firewall_env" {
  name = format("%s", var.environment)
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "example_digitalocean" {
  name = "example-digitalocean"
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "example_digitalocean_env" {
  name = format("%s", var.environment)
}