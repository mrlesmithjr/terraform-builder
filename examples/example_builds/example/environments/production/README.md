# Terraform Project - example - Module production

## Module Info

```yaml
production:
  variables:
    azurerm_admin_password:
      default: var.azurerm_admin_password
      description: Default admin password
      type: string
    azurerm_admin_public_key:
      default: var.azurerm_admin_public_key
      description: Default admin SSH public key
      type: string
    azurerm_admin_username:
      default: var.azurerm_admin_username
      description: Default admin username
      type: string
    azurerm_location:
      default: East US
      description: Default AzureRM location/region
      type: string
    do_region:
      default: sfo2
      description: Defines DigitalOcean region
    vsphere_domain:
      default: example.org
      description: Domain to use for resources
      type: string

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder