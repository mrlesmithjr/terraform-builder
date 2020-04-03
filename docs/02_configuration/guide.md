# Configuration Guide

## Configs

Configurations should be defined in a `configs.yml` file.

## Secrets

## Backends

The following backends are supported with limited functionality.

- Local(Default)
- Consul

Backends are configured in our `configs.yml` file as below:

```yaml
backends: {}
```

If our backends are configured exactly as above, we will use the default `local`
backend.

### Local

If you'd like a bit more control over the [`local`](https://www.terraform.io/docs/backends/types/local.html) backend. You can define the `local` backend as below:

```yaml
backends:
  local:
    path: terraform.tfstate
```

### Consul

Currently [`Consul`](https://www.terraform.io/docs/backends/types/consul.html)
backend configurations supported are limited. But will be enhanced over time.

You can configurare a `Consul` backend as below:

```yaml
backends:
  remote:
    consul:
      address: http://127.0.0.1:8500
      scheme: http
      path: example/terraform
```

## Environments

As mentioned before, Terraform Builder enforces multiple environments by default
to ensure we have proper constructs in place from the beginning.

The following environments are defaults:

- Development
- Production
- Staging

We can configure environment specifics such as variables, etc. per environment.
By defining variables within environments, we can override the defaults defined
in our providers.

Environment configurations should be configured similar to the below example:

```yaml
environments:
  development:
    variables:
      azurerm_location: East US
      do_region: nyc1
      vsphere_allow_unverified_ssl: "true"
      vsphere_server: vc.development.example.org
  production:
    variables:
      azurerm_location: West US 2
      do_region: sfo2
      vsphere_allow_unverified_ssl: "false"
      vsphere_server: vc.production.example.org
  staging:
    variables:
      azurerm_location: North Central US
      do_region: ams3
      vsphere_allow_unverified_ssl: "true"
      vsphere_server: vc.staging.example.org
```

## Modules

Modules allow us to construct our project into logical building blocks based on
resources required to be used together. Structure will be project_name/modules/{module} root needs to always exist. Each module will be named with the respective environment appended to the beginning of the module name. Example: `development-root`, `production-root`, and `staging-root`. You can define variables specific to a module which will override the defaults defined in providers to allow flexibilty between modules.

Module configurations should be configured similar to below:

```yaml
modules:
  root:
    variables:
      do_domain: example.org
      do_ssh_keys: [12121212]
  network:
    variables:
      do_domain: network.example.org
      do_ssh_keys: [12121212]
  services:
    variables:
      do_domain: services.example.org
      do_ssh_keys: [12121212]
```

## Supported Providers

> NOTE: The supported providers will be an iterative process. Initially the
> provider support will be very limited to ensure that the modeling is proven
> out. This will ensure that additional providers will follow the same modeling.

Currently the following provider are supported with limited functionality.

- AzureRM
- DigitalOcean
- vSphere

Below you find examples of each supported provider with configs.

### AzureRM

```yaml
providers:
  AzureRM:
    resources:
      resource_groups:
        example-rg-root:
          create: true
          module: root
          virtual_networks:
            example-net:
              create: true
              address_space:
                - 10.0.0.0/16
              subnets:
                - 10.0.1.0/24
                - 10.0.2.0/24
          vms:
            example-vm-root:
              count: 1
              image: ubuntu-18-04-x64
              memory: 1024
              network: example-net
              subnet: 10.0.2.0/24
              num_cpus: 1
              tags: { "environment": "${var.environment}" }
    variables:
      azurerm_client_id:
        type: string
        description: Default AzureRM client id
        default: ""
      azurerm_client_secret:
        type: string
        description: Default AzureRM client secret
        default: ""
      azurerm_domain:
        type: string
        description: Default AzureRM domain for resources
        default: ""
      azurerm_environment:
        type: string
        description: AzureRM Environment
        default: public
      azurerm_features:
        description: Customize the behaviour of certain Azure Provider resources.
        default: {}
      azurerm_image_reference:
        description: Default OS image reference lookups
        default:
          {
            "ubuntu-16-04-x64":
              {
                "publisher": "Canonical",
                "offer": "UbuntuServer",
                "sku": "16.04-LTS",
                "version": "latest",
              },
            "ubuntu-18-04-x64":
              {
                "publisher": "Canonical",
                "offer": "UbuntuServer",
                "sku": "18.04-LTS",
                "version": "latest",
              },
          }
      azurerm_location:
        type: string
        description: Default AzureRM location/region
        default: ""
      azurerm_subscription_id:
        type: string
        description: AzureRM Subscription ID
        default: ""
      azurerm_tenant_id:
        type: string
        description: AzureRM Tenant ID
        default: ""
```

### DigitalOcean

```yaml
providers:
  DigitalOcean:
    # Define resources, etc. only required in the project root.
    project_root:
      resources:
        domains:
          - example.org
        dns_records:
          - name: services
            type: CNAME
            domain: example.org
            value: production.services.example.org.
    resources:
      firewalls:
        # droplets will select firewall rules by name. Under modules, add any
        # modules which you'd like the firewall available within. This allows
        # us to define a single firewall, and make it available across modules.
        # Therefore, reducing the number of firewalls to configure.
        default:
          modules:
            - root
          name: default-server-rules
          rules:
            - protocol: tcp
              port_range: 22
              source_addresses: []
              direction: inbound
            - protocol: icmp
              destination_addresses: ["0.0.0.0/0", "::/0"]
              direction: outbound
            - protocol: tcp
              port_range: 1-65535
              destination_addresses: ["0.0.0.0/0", "::/0"]
              direction: outbound
            - protocol: udp
              port_range: 1-65535
              destination_addresses: ["0.0.0.0/0", "::/0"]
              direction: outbound
          tags:
            - default-firewall
        web:
          create: true
          modules:
            - root
          name: web-server-rules
          rules:
            - protocol: tcp
              port_range: 22
              source_addresses: []
              direction: inbound
            - protocol: tcp
              port_range: 80
              source_addresses: []
              direction: inbound
            - protocol: tcp
              port_range: 443
              source_addresses: []
              direction: inbound
            - protocol: icmp
              destination_addresses: ["0.0.0.0/0", "::/0"]
              direction: outbound
            - protocol: tcp
              port_range: 1-65535
              destination_addresses: ["0.0.0.0/0", "::/0"]
              direction: outbound
            - protocol: udp
              port_range: 1-65535
              destination_addresses: ["0.0.0.0/0", "::/0"]
              direction: outbound
      projects:
        example:
          create: true
          description: Example project
          module: root
          purpose: Just to demonstrate an example project
      # Define tags that need to be available across all modules. Then you can
      # define the applicable tags to the respective resources. An additional
      # tag will be created that will append each environment to the tag name.
      # Ex. example-digitalocean-development, example-digitalocean-production,
      # example-digitalocean-staging. Resources with tags defined will also be
      # add to the tag with the environment as well.
      tags:
        - default-firewall
        - example-digitalocean
      vms:
        # Define firewall to apply, if applicable.
        # Define project to add VM to, if applicable.
        # Define private networking if you'd like internal addressing. Setting
        # this to true, will also create an internal domain name if
        # modules[module]['do_domain'] is defined.
        example-vm:
          count: 1
          # Example DNS record for each environment's internal URL.
          # Ensures that URL is contained internally only.
          dns_records:
            - name: portal
              type: A
              private: true
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
        type: string
        description: This can be used to override the base URL for DigitalOcean API requests
        default: https://api.digitalocean.com
      do_domain:
        type: string
        description: Default DigitalOcean domain for resources
        default: ""
      do_region:
        type: string
        description: DigitalOcean region
        default: ""
      do_ssh_keys:
        description: DigitalOcean SSH keys to deploy to new droplets
        default: []
      do_token:
        type: string
        description: This is the DO API token
        default: ""
```

### vSphere

```yaml
providers:
  vSphere:
    resources:
      datacenters:
        example-dc:
          create: true
          clusters:
            example-cluster:
              create: true
              drs_enabled: true
              drs_automation_level: fullyAutomated
              ha_enabled: true
              hosts:
                example-esxi-01:
                  create: true
                  hostname: 10.10.10.1
              vms:
                example-vm:
                  count: 1
                  memory: 2048
                  network: example-pg
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: ""
                example-vm-from-template:
                  count: 1
                  memory: 2048
                  # Need a way to decide how to select either data.vsphere_network
                  # or other
                  network: example-network
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: ubuntu1804_x64
          module: root
          # Define existing networks to consume, not create
          networks:
            - example-network
          # Define existing templates to consume, not create
          # Because Terraform 0.12.x does not support SATA we need to define
          # whether or not the controller is sata to add logic. Should this be
          # a boolean instead?
          templates:
            ubuntu1604_x64:
              controller: scsi
            ubuntu1804_x64:
              controller: sata
          # Define virtual switches to create
          # If false, they will just be skipped
          # Only works with hosts that are created
          virtual_switches:
            example-switch:
              create: true
              type: host
              network_adapters:
                - vmnic0
                - vmnic1
              active_nics:
                - vmnic0
              standby_nics:
                - vmnic1
              teaming_policy: loadbalance_srcid
              # Define port groups to create
              # If false, they will just be skipped
              port_groups:
                example-pg:
                  create: true
      tag_categories:
        example-category:
          create: true
          associable_types:
            - ClusterComputeResource
            - Datacenter
            - Datastore
            - HostSystem
            - VirtualMachine
          cardinality: SINGLE
          module: root
          tags:
            - example-vsphere
    variables:
      vsphere_allow_unverified_ssl:
        type: bool
        description: Boolean that can be set to true to disable SSL certificate verification
        default: "false"
      vsphere_host_password:
        type: string
        description: Password for vSphere hosts
        default: ""
      vsphere_host_username:
        type: string
        description: Username for vSphere hosts
        default: ""
      vsphere_password:
        type: string
        description: Password for vSphere API operations
        default: ""
      vsphere_server:
        type: string
        description: vCenter server name for vSphere API operations
        default: ""
      vsphere_username:
        type: string
        description: Username for vSphere API operations
        default: ""
```