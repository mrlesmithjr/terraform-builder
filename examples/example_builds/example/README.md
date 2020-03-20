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
  variables:
    azurerm_environment:
      default: public
      description: AzureRM Environment
      type: string
    azurerm_features:
      default: {}
      description: Customize the behaviour of certain Azure Provider resources.
    azurerm_subscription_id:
      default: ''
      description: AzureRM Subscription ID
      type: string
    azurerm_tenant_id:
      default: ''
      description: AzureRM Tenant ID
      type: string
DigitalOcean:
  variables:
    do_api_endpoint:
      default: https://api.digitalocean.com
      description: This can be used to override the base URL for DigitalOcean API
        requests
      type: string
    do_image:
      default: ubuntu-18-04-x64
      description: Default DigitalOcean droplet image
      type: string
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
      description: This is the DO API token
      type: string
vSphere:
  variables:
    vsphere_allow_unverified_ssl:
      default: 'false'
      description: Boolean that can be set to true to disable SSL certificate verification
      type: bool
    vsphere_compute_cluster:
      default: ''
      description: Compute cluster to use by default
      type: string
    vsphere_datacenter:
      default: ''
      description: Datacenter to use by default
      type: string
    vsphere_network:
      default: ''
      description: Network to use by default
      type: string
    vsphere_password:
      default: ''
      description: Password for vSphere API operations
      type: string
    vsphere_resource_pool:
      default: ''
      description: The resource pool to put virtual machine's in
      type: string
    vsphere_server:
      default: ''
      description: vCenter server name for vSphere API operations
      type: string
    vsphere_username:
      default: ''
      description: Username for vSphere API operations
      type: string

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

## Resources

> NOTE: From [https://www.terraform.io/docs/configuration/resources.html](https://www.terraform.io/docs/configuration/resources.html)

Resources are the most important element in the Terraform language. Each
resource block describes one or more infrastructure objects, such as
virtual networks, compute instances, or higher-level components such as DNS
records.

```yaml
projects:
  TerraformCloud:
    description: Terraform Cloud Project
    environment: development
    module: root
    provider: DigitalOcean
    purpose: Terraform Cloud Project
    resources: []
    tags:
    - test
vms:
  test-do-network:
    count: 1
    memory: 1024
    module: network
    num_cpus: 1
    provider: DigitalOcean
    tags:
    - test-digitalocean
    - test-vsphere-network
  test-do-root:
    count: 1
    memory: 1024
    module: root
    num_cpus: 1
    provider: DigitalOcean
    tags:
    - test-digitalocean
    - test-digitalocean-root
  test-vs-root:
    count: 1
    memory: 2048
    module: root
    num_cpus: 1
    provider: vSphere
    tags:
    - test-vsphere
    - test-vsphere-root
  test-vs-services:
    count: 1
    memory: 1024
    module: services
    num_cpus: 2
    provider: vSphere
    tags:
    - test-vsphere
    - test-vsphere-services

```

## Global Variables

```yaml
{}

```

## Project Structure

```bash
example
|-- LICENSE.md
|-- README.md
|-- environments
|  |-- development
|  |  |-- LICENSE.md
|  |  |-- README.md
|  |  |-- main.tf
|  |  |-- resources.tf
|  |  |-- variables.tf
|  |-- production
|  |  |-- LICENSE.md
|  |  |-- README.md
|  |  |-- main.tf
|  |  |-- resources.tf
|  |  |-- variables.tf
|  |-- staging
|     |-- LICENSE.md
|     |-- README.md
|     |-- main.tf
|     |-- resources.tf
|     |-- variables.tf
|-- main.tf
|-- modules
|  |-- network
|  |  |-- LICENSE.md
|  |  |-- README.md
|  |  |-- main.tf
|  |  |-- resources.tf
|  |  |-- variables.tf
|  |-- services
|     |-- LICENSE.md
|     |-- README.md
|     |-- main.tf
|     |-- resources.tf
|     |-- variables.tf
|-- requirements-dev.txt
|-- requirements.txt
|-- resources.tf
|-- variables.tf

```

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder