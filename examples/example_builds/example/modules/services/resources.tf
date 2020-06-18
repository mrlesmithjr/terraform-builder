# Generated using https://github.com/mrlesmithjr/terraform-builder
# Resource DigitalOcean tag
resource "digitalocean_tag" "env" {
  name = format("%s", var.environment)
}
# Data vSphere tag category
data "vsphere_tag_category" "environment" {
  name = format("%s", var.environment)
}
# Data vSphere tag
data "vsphere_tag" "environment" {
  name        = format("%s", var.environment)
  category_id = data.vsphere_tag_category.environment.id
}