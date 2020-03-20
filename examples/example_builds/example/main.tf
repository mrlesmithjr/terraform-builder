provider "digitalocean" {
    api_endpoint = "https://api.digitalocean.com"
    token        = var.do_token
}

# Setting required Terraform version or greater
terraform {
  required_version = ">= 0.12"
}
