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
# Resource DigitalOcean default domain
resource "digitalocean_domain" "default_env" {
  name = format("%s.%s", var.environment, var.do_domain)
}
# Resource DigitalOcean default internal domain
resource "digitalocean_domain" "default_env_internal" {
  name = format("%s.%s.%s", "internal", var.environment, var.do_domain)
}