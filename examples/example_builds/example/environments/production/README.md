# Terraform Project - example - Module production

## Module Info

```yaml
production:
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
      default: East US
      description: Default AzureRM location/region
      type: string

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder