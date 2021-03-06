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
Variables that only apply to environments should be defined here. Use them
as a way to define variables differently between environments if needed.

Environment configurations should be configured similar to the below example:

```yaml
environments:
  development:
    variables:
      azurerm_admin_password:
        type: string
        description: Default admin password
        default: var.azurerm_admin_password
      azurerm_admin_public_key:
        type: string
        description: Default admin SSH public key
        default: var.azurerm_admin_public_key
      azurerm_admin_username:
        type: string
        description: Default admin username
        default: var.azurerm_admin_username
      azurerm_location:
        type: string
        description: Default AzureRM location/region
        default: West US
      vsphere_domain:
        type: string
        description: Domain to use for resources
        default: example.org
  production:
    variables:
      azurerm_admin_password:
        type: string
        description: Default admin password
        default: var.azurerm_admin_password
      azurerm_admin_public_key:
        type: string
        description: Default admin SSH public key
        default: var.azurerm_admin_public_key
      azurerm_admin_username:
        type: string
        description: Default admin username
        default: var.azurerm_admin_username
      azurerm_location:
        type: string
        description: Default AzureRM location/region
        default: East US
      vsphere_domain:
        type: string
        description: Domain to use for resources
        default: example.org
  staging:
    variables:
      azurerm_admin_password:
        type: string
        description: Default admin password
        default: var.azurerm_admin_password
      azurerm_admin_public_key:
        type: string
        description: Default admin SSH public key
        default: var.azurerm_admin_public_key
      azurerm_admin_username:
        type: string
        description: Default admin username
        default: var.azurerm_admin_username
      azurerm_location:
        type: string
        description: Default AzureRM location/region
        default: Central US
      vsphere_domain:
        type: string
        description: Domain to use for resources
        default: example.org
```

## Modules

Modules allow us to construct our project into logical building blocks based on
resources required to be used together. Structure will be project_name/modules/{module} root needs to always exist. Each module will be named with the respective environment appended to the beginning of the module name. Example: `development-root`, `production-root`, and `staging-root`. Variables that only apply to modules should be defined here. Provider connection variables are a
good example.

Module configurations should be configured similar to below:

```yaml
modules:
  root:
    variables:
      azurerm_client_id:
        type: string
        description: Default AzureRM client id
      azurerm_client_secret:
        type: string
        description: Default AzureRM client secret
      azurerm_environment:
        type: string
        description: AzureRM Environment
        default: public
      azurerm_subscription_id:
        type: string
        description: AzureRM Subscription ID
      azurerm_tenant_id:
        type: string
        description: AzureRM Tenant ID
      vsphere_allow_unverified_ssl:
        type: bool
        description: Boolean that can be set to true to disable SSL certificate verification
        default: "false"
      vsphere_host_password:
        type: string
        description: Password for vSphere hosts
      vsphere_host_username:
        type: string
        description: Username for vSphere hosts
      vsphere_password:
        type: string
        description: Password for vSphere API operations
      vsphere_server:
        type: string
        description: vCenter server name for vSphere API operations
      vsphere_username:
        type: string
        description: Username for vSphere API operations
  network:
    variables: {}
  services:
    variables: {}
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

> NOTE: Need to add context for resource usage

```yaml
providers:
  AzureRM:
    resources:
      # Define image references
      images:
        ubuntu-16-04-x64:
          publisher: Canonical
          offer: UbuntuServer
          sku: 16.04-LTS
          version: latest
          os: linux
        ubuntu-18-04-x64:
          publisher: Canonical
          offer: UbuntuServer
          sku: 18.04-LTS
          version: latest
          os: linux
      # Define resource groups
      resource_groups:
        example-rg-root:
          create: true
          module: root
          # Define virtual networks
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
              public_ip: true
              num_cpus: 1
              subnet: 10.0.2.0/24
              tags: { "environment": "${var.environment}" }
    variables:
      azurerm_location:
        type: string
        description: Default AzureRM location/region
        default: ""
      azurerm_admin_password:
        type: string
        description: Default admin password
      azurerm_admin_public_key:
        type: string
        description: Default admin SSH public key
      azurerm_admin_username:
        type: string
        description: Default admin username
```

### DigitalOcean

> NOTE: Need to add context for resource usage

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
      vms:
        # Define firewall to apply, if applicable.
        # Define project to add VM to, if applicable.
        # Define private networking if you'd like internal addressing. Setting
        # this to true, will also create an internal domain name if
        # modules[module]['do_domain'] is defined.
        example-vm:
          backups: false
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
          monitoring: false
          num_cpus: 1
          private_networking: true
          tags:
            - example-digitalocean
          vpc: example-vpc-01
      vpcs:
        example-vpc-01:
          # ip_range: 10.0.1.0/24
          modules:
            - root
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

> NOTE: Need to add context for resource usage

#### vSphere - Creating All Resources

The following is an example of where we create all resource constructs
in preparation of consuming them for VMs.

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
                  network_interfaces:
                    - network: example-pg
                      address_allocation: dynamic
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: ""
                example-vm-from-template:
                  count: 1
                  memory: 2048
                  # Need a way to decide how to select either data.vsphere_network
                  # or other
                  network_interfaces:
                    - network: example-pg
                      address_allocation: static
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: ubuntu1804_x64
                example-win-vm-from-template:
                  count: 1
                  memory: 2048
                  network_interfaces:
                    - network: example-pg
                      address_allocation: dynamic
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: windows2019_x64
          module: root
          # Define existing networks to consume, not create
          # Add subnet info associated with network
          networks:
            example-pg:
              subnet: 192.168.250.0
              cidr: 24
              gateway: 192.168.250.1
          # Define existing templates to consume, not create
          # Because Terraform 0.12.x does not support SATA we need to define
          # whether or not the controller is sata to add logic. Should this be
          # a boolean instead?
          # Define os as either linux or windows
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
          # Define virtual switches to create
          # If false, they will just be skipped
          # Only works with hosts that are created
          # Still need to add subnet info associated with port_groups to allow
          # static IP assignments as we do with existing networks
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
      vsphere_domain:
        type: string
        description: Domain to use for resources
        default: ""
```

#### vSphere - Consuming Resources

The following is an example of where we consume all resource constructs
in preparation of creating VMs. In this example, we are consuming existing
Datacenters and clusters.

```yaml
providers:
  vSphere:
    resources:
      datacenters:
        example-dc:
          create: false
          clusters:
            example-cluster:
              create: false
              vms:
                example-vm:
                  count: 1
                  memory: 2048
                  network_interfaces:
                    - network: example-pg
                      address_allocation: dynamic
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: ""
                example-vm-from-template:
                  count: 1
                  memory: 2048
                  # Need a way to decide how to select either data.vsphere_network
                  # or other
                  network_interfaces:
                    - network: example-pg
                      address_allocation: static
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: ubuntu1804_x64
                example-win-vm-from-template:
                  count: 1
                  memory: 2048
                  network_interfaces:
                    - network: example-pg
                      address_allocation: dynamic
                  num_cpus: 1
                  tags:
                    - example-vsphere
                  template: windows2019_x64
          module: root
          # Define existing networks to consume, not create
          # Add subnet info associated with network
          networks:
            example-pg:
              subnet: 192.168.250.0
              cidr: 24
              gateway: 192.168.250.1
          # Define existing templates to consume, not create
          # Because Terraform 0.12.x does not support SATA we need to define
          # whether or not the controller is sata to add logic. Should this be
          # a boolean instead?
          # Define os as either linux or windows
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
      vsphere_domain:
        type: string
        description: Domain to use for resources
        default: ""
```
