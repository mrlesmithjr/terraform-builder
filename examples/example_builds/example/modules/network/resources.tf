# Generated using https://github.com/mrlesmithjr/terraform-builder
# Resource DigitalOcean virtual machine
resource "digitalocean_droplet" "test_do_network" {
    count  = 1
    name   = format("test-do-network-%02s-%s", count.index + 1, substr(var.environment,0,4))
    image  = "ubuntu-18-04-x64"
    region = var.do_region
    size   = "s-1vcpu-1gb"


    tags   = [digitalocean_tag.test_digitalocean.id, digitalocean_tag.test_digitalocean_network.id]
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "test_digitalocean" {
  name = "test-digitalocean"
}
# Resource DigitalOcean tag
resource "digitalocean_tag" "test_digitalocean_network" {
  name = "test-digitalocean-network"
}