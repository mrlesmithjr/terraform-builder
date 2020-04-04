# Terraform Project - example - Module staging

## Module Info

```yaml
staging:
  variables:
    azurerm_admin_password:
      default: P@55w0rd1
      description: Default admin password
      type: string
    azurerm_admin_username:
      default: terraformadmin
      description: Default admin username
      type: string
    azurerm_location:
      default: Central US
      description: Default AzureRM location/region
      type: string

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder