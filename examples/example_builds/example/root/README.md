# Terraform Project - example - Module root

## Module Info

```yaml
root:
  variables:
    azurerm_client_id:
      description: Default AzureRM client id
      type: string
    azurerm_client_secret:
      description: Default AzureRM client secret
      type: string
    azurerm_environment:
      default: public
      description: AzureRM Environment
      type: string
    azurerm_subscription_id:
      description: AzureRM Subscription ID
      type: string
    azurerm_tenant_id:
      description: AzureRM Tenant ID
      type: string

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder