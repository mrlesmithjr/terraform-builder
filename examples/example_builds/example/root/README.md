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
    vsphere_allow_unverified_ssl:
      default: 'false'
      description: Boolean that can be set to true to disable SSL certificate verification
      type: bool
    vsphere_host_password:
      description: Password for vSphere hosts
      type: string
    vsphere_host_username:
      description: Username for vSphere hosts
      type: string
    vsphere_password:
      description: Password for vSphere API operations
      type: string
    vsphere_server:
      description: vCenter server name for vSphere API operations
      type: string
    vsphere_username:
      description: Username for vSphere API operations
      type: string

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder