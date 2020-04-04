# Terraform Project - example - Module staging

## Module Info

```yaml
staging:
  variables:
    azurerm_admin_password:
      default: var.azurerm_admin_password
      description: Default admin password
      type: string
    azurerm_admin_username:
      default: var.azurerm_admin_username
      description: Default admin username
      type: string
    azurerm_location:
      default: Central US
      description: Default AzureRM location/region
      type: string

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder