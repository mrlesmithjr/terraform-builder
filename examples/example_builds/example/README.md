# Terraform Project - example

Welcome to your `example` project. The following details outline
this project.

> NOTE: Ensure that you do not put any secret variables anywhere other than
> in `secrets.yml` and use the `--secrets` argument. The variables in this outline
> **SHOULD** only contain non-private information.

## Environments

Environments represent such things as: `development`, `staging`, and `production`.

```yaml
development: {}
production: {}
staging: {}

```

## Backends

> NOTE: From [https://www.terraform.io/docs/backends/index.html](https://www.terraform.io/docs/backends/index.html)

A `backend` in Terraform determines how state is loaded and how an operation
such as apply is executed. This abstraction enables non-local file state
storage, remote execution, etc.

By default, Terraform uses the `local` backend, which is the normal behavior of
Terraform you're used to.

```yaml
local: {}
remote: {}

```

## Providers

> NOTE: From [https://www.terraform.io/docs/providers/index.html](https://www.terraform.io/docs/providers/index.html)

Terraform is used to create, manage, and update infrastructure resources such
as physical machines, VMs, network switches, containers, and more. Almost any
infrastructure type can be represented as a resource in Terraform. A provider
is responsible for understanding API interactions and exposing resources.
Providers generally are an IaaS (e.g. Alibaba Cloud, AWS, GCP, Microsoft Azure,
OpenStack), PaaS (e.g. Heroku), or SaaS services (e.g. Terraform Cloud,
DNSimple, Cloudflare).

```yaml
AzureRM:
  environment: var.azrm_environment
  features: {}
  subscription_id: var.azrm_subscription_id
  tenant_id: var.azrm_tenant_id
  variables:
    azrm_environment:
      default: public
      description: AzureRM Environment
      type: string
    azrm_subscription_id:
      default: ''
      description: AzureRM Subscription ID
      type: string
    azrm_tenant_id:
      default: ''
      description: AzureRM Tenant ID
      type: string
DigitalOcean:
  api_endpoint: https://api.digitalocean.com
  token: var.do_token
  variables:
    do_region:
      default: nyc1
      description: DigitalOcean region
      type: string
    do_ssh_keys:
      default: []
      description: DigitalOcean SSH keys to deploy to new droplets
      type: string
    do_token:
      default: ''
      description: DigitialOcean token
      type: string
vSphere:
  allow_unverified_ssl: var.vsphere_allow_unverified_ssl
  password: var.vsphere_password
  user: var.vsphere_username
  variables:
    vsphere_allow_unverified_ssl:
      default: 'false'
      description: Boolean that can be set to true to disable SSL certificate verification
      type: bool
    vsphere_password:
      default: ''
      description: Password for vSphere API operations
      type: string
    vsphere_server:
      default: ''
      description: vCenter server name for vSphere API operations
      type: string
    vsphere_username:
      default: ''
      description: Username for vSphere API operations
      type: string
  vsphere_server: var.vsphere_server

```

## Modules

> NOTE: From [https://www.terraform.io/docs/modules/index.html](https://www.terraform.io/docs/modules/index.html)

A module is a container for multiple resources that are used together. Modules
can be used to create lightweight abstractions, so that you can describe your
infrastructure in terms of its architecture, rather than directly in terms of
physical objects.

```yaml
network: {}
root: {}
services: {}

```

## Global Variables

```yaml
{}

```

## Project Structure

```bash
example
|__environments
   |__development
   |__production
   |__staging
|__modules
   |__root
   |__network
   |__services

```