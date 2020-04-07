# Terraform Project - example

Welcome to your `example` project. The following details outline
this project.

> NOTE: Ensure that you do not put any secret variables anywhere other than
> in `secrets.yml` and use the `--secrets` argument. The variables in this outline
> **SHOULD** only contain non-private information.

## Environments

Environments represent such things as: `development`, `staging`, and `production`.

```yaml
development:
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
      default: West US
      description: Default AzureRM location/region
      type: string
    vsphere_domain:
      default: example.org
      description: Domain to use for resources
      type: string
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
    vsphere_domain:
      default: example.org
      description: Domain to use for resources
      type: string
staging:
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
      default: Central US
      description: Default AzureRM location/region
      type: string
    vsphere_domain:
      default: example.org
      description: Domain to use for resources
      type: string

```

## Backends

> NOTE: From [https://www.terraform.io/docs/backends/index.html](https://www.terraform.io/docs/backends/index.html)

A `backend` in Terraform determines how state is loaded and how an operation
such as apply is executed. This abstraction enables non-local file state
storage, remote execution, etc.

By default, Terraform uses the `local` backend, which is the normal behavior of
Terraform you're used to.

```yaml
{}

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

### Resources

> NOTE: From [https://www.terraform.io/docs/configuration/resources.html](https://www.terraform.io/docs/configuration/resources.html)

Resources are the most important element in the Terraform language. Each
resource block describes one or more infrastructure objects, such as
virtual networks, compute instances, or higher-level components such as DNS
records.

```yaml
AzureRM:
  resources:
    images:
      ubuntu-16-04-x64:
        offer: UbuntuServer
        os: linux
        publisher: Canonical
        sku: 16.04-LTS
        version: latest
      ubuntu-18-04-x64:
        offer: UbuntuServer
        os: linux
        publisher: Canonical
        sku: 18.04-LTS
        version: latest
    resource_groups:
      example-rg-root:
        create: true
        module: root
        virtual_networks:
          example-net:
            address_space:
            - 10.0.0.0/16
            create: true
            subnets:
            - 10.0.1.0/24
            - 10.0.2.0/24
        vms:
          example-vm-root:
            count: 1
            image: ubuntu-18-04-x64
            memory: 512
            network: example-net
            num_cpus: 1
            public_ip: true
            subnet: 10.0.2.0/24
            tags:
              environment: ${var.environment}
  variables:
    azurerm_admin_password:
      description: Default admin password
      type: string
    azurerm_admin_public_key:
      description: Default admin SSH public key
      type: string
    azurerm_admin_username:
      description: Default admin username
      type: string
    azurerm_location:
      default: ''
      description: Default AzureRM location/region
      type: string
DigitalOcean:
  project_root:
    resources:
      dns_records:
      - domain: example.org
        name: services
        type: CNAME
        value: production.services.example.org.
      domains:
      - example.org
  resources:
    firewalls:
      default:
        modules:
        - root
        name: default-server-rules
        rules:
        - direction: inbound
          port_range: 22
          protocol: tcp
          source_addresses: []
        - destination_addresses:
          - 0.0.0.0/0
          - ::/0
          direction: outbound
          protocol: icmp
        - destination_addresses:
          - 0.0.0.0/0
          - ::/0
          direction: outbound
          port_range: 1-65535
          protocol: tcp
        - destination_addresses:
          - 0.0.0.0/0
          - ::/0
          direction: outbound
          port_range: 1-65535
          protocol: udp
        tags:
        - default-firewall
      web:
        create: true
        modules:
        - root
        name: web-server-rules
        rules:
        - direction: inbound
          port_range: 22
          protocol: tcp
          source_addresses: []
        - direction: inbound
          port_range: 80
          protocol: tcp
          source_addresses: []
        - direction: inbound
          port_range: 443
          protocol: tcp
          source_addresses: []
        - destination_addresses:
          - 0.0.0.0/0
          - ::/0
          direction: outbound
          protocol: icmp
        - destination_addresses:
          - 0.0.0.0/0
          - ::/0
          direction: outbound
          port_range: 1-65535
          protocol: tcp
        - destination_addresses:
          - 0.0.0.0/0
          - ::/0
          direction: outbound
          port_range: 1-65535
          protocol: udp
    projects:
      example:
        create: true
        description: Example project
        module: root
        purpose: Just to demonstrate an example project
    tags:
    - default-firewall
    - example-digitalocean
    vms:
      example-vm:
        count: 1
        dns_records:
        - name: portal
          private: true
          type: A
        firewall: default
        image: ubuntu-18-04-x64
        memory: 1024
        module: root
        num_cpus: 1
        private_networking: true
        tags:
        - example-digitalocean
  variables:
    do_api_endpoint:
      default: https://api.digitalocean.com
      description: This can be used to override the base URL for DigitalOcean API
        requests
      type: string
    do_domain:
      default: ''
      description: Default DigitalOcean domain for resources
      type: string
    do_region:
      default: ''
      description: DigitalOcean region
      type: string
    do_ssh_keys:
      default: []
      description: DigitalOcean SSH keys to deploy to new droplets
    do_token:
      default: ''
      description: This is the DO API token
      type: string
vSphere:
  resources:
    datacenters:
      example-dc:
        clusters:
          example-cluster:
            create: true
            drs_automation_level: fullyAutomated
            drs_enabled: true
            ha_enabled: true
            hosts:
              example-esxi-01:
                create: true
                hostname: 10.10.10.1
            vms:
              example-vm:
                count: 1
                memory: 2048
                network_interfaces:
                - address_allocation: dynamic
                  network: example-pg
                num_cpus: 1
                tags:
                - example-vsphere
                template: ''
              example-vm-from-template:
                count: 1
                memory: 2048
                network_interfaces:
                - address_allocation: static
                  network: example-pg
                num_cpus: 1
                tags:
                - example-vsphere
                template: ubuntu1804_x64
              example-win-vm-from-template:
                count: 1
                memory: 2048
                network_interfaces:
                - address_allocation: dynamic
                  network: example-pg
                num_cpus: 1
                tags:
                - example-vsphere
                template: windows2019_x64
        create: true
        module: root
        networks:
          example-pg:
            cidr: 24
            gateway: 192.168.250.1
            subnet: 192.168.250.0
        templates:
          ubuntu1604_x64:
            controller: scsi
            os: linux
          ubuntu1804_x64:
            controller: sata
            os: linux
          windows2019_x64:
            controller: sata
            os: windows
        virtual_switches:
          example-switch:
            active_nics:
            - vmnic0
            create: true
            network_adapters:
            - vmnic0
            - vmnic1
            port_groups:
              example-pg:
                create: true
            standby_nics:
            - vmnic1
            teaming_policy: loadbalance_srcid
            type: host
    tag_categories:
      example-category:
        associable_types:
        - ClusterComputeResource
        - Datacenter
        - Datastore
        - HostSystem
        - VirtualMachine
        cardinality: SINGLE
        create: true
        module: root
        tags:
        - example-vsphere
  variables:
    vsphere_domain:
      default: ''
      description: Domain to use for resources
      type: string

```

## Modules

> NOTE: From [https://www.terraform.io/docs/modules/index.html](https://www.terraform.io/docs/modules/index.html)

A module is a container for multiple resources that are used together. Modules
can be used to create lightweight abstractions, so that you can describe your
infrastructure in terms of its architecture, rather than directly in terms of
physical objects.

```yaml
network:
  variables: {}
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
services:
  variables: {}

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
|  |-- root
|  |  |-- LICENSE.md
|  |  |-- README.md
|  |  |-- main.tf
|  |  |-- resources.tf
|  |  |-- variables.tf
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

## Terraform Graph

Below is a graph of your Terraform configuration.

![example - Graph](example.jpg)

> NOTE: Generated using https://github.com/mrlesmithjr/terraform-builder