# Terraform Builder Usage

## Requirements

### Clone Project

To obtain the project simply clone it down:

```bash
git clone https://github.com/mrlesmithjr/terraform-builder
```

### Python Packages

Install required Python packages included in the project you cloned from above.

```bash
pip3 install -r requirements.txt
```

### Terraform Version Manager

Terraform version manager is a tool that I use personally. It assists in easily
managing different Terraform versions for you to use. Rather than installing a
version, and then having to do some random things to switch between versions.
Definitely check it out [here](https://github.com/tfutils/tfenv).

### Graphviz

It is recommended that you install [Graphviz](https://graphviz.gitlab.io/download/) to get a visible graph in your project README.

## Using Terraform Builder

Is using Terraform Builder easy? Of course it is. But first we need to explore
some of the concepts.

### Configurations

Configurations are defined in YAML, and must follow a specific format. By doing
this, we can ensure that we have consistency in our Terraform configurations. We
use `configs.yml` but the filename can be anything you wish. However, if the
content must be consistent.

#### Example Configuration

Below is an example of our `configs.yml`:

```yaml
---
# This is an example config layout

# Defines project name which becomes parent root directory
project_name: example

# Define backends
backends:
  local: {}
  remote: {}

# Defines environments
environments:
  development: {}
  production: {}
  staging: {}

# Define global variables
global_variables: {}

# Define modules - Structure will be project_name/modules/{module}
# root needs to always exist
modules:
  root: {}
  network: {}
  services: {}

# Define providers and variables
providers:
  AzureRM:
    resources: {}
    variables:
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
      azurerm_location:
        description: Default AzureRM location
        type: string
        default: ""
      azurerm_resource_group:
        description: Default AzureRM resource group
        type: string
        default: ""
      azurerm_subscription_id:
        type: string
        description: AzureRM Subscription ID
        default: ""
      azurerm_tenant_id:
        type: string
        description: AzureRM Tenant ID
        default: ""
  DigitalOcean:
    resources:
      vms:
        test-do-root:
          count: 1
          memory: 1024
          module: root
          num_cpus: 1
          tags:
            - test-digitalocean
            - test-digitalocean-root
        test-do-network:
          count: 1
          memory: 1024
          module: network
          num_cpus: 1
          tags:
            - test-digitalocean
            - test-digitalocean-network
    variables:
      do_api_endpoint:
        type: string
        description: This can be used to override the base URL for DigitalOcean API requests
        default: https://api.digitalocean.com
      do_domain:
        type: string
        description: Default DigitalOcean domain for resources
        default: ""
      do_image:
        type: string
        description: Default DigitalOcean droplet image
        default: ubuntu-18-04-x64
      do_region:
        type: string
        description: DigitalOcean region
        default: nyc1
      do_ssh_keys:
        type: string
        description: DigitalOcean SSH keys to deploy to new droplets
        default: []
      do_token:
        type: string
        description: This is the DO API token
        default: ""
  vSphere:
    resources:
      vms:
        test-vs-root:
          count: 1
          memory: 2048
          module: root
          num_cpus: 1
          tags:
            - test-vsphere
            - test-vsphere-root
        test-vs-services:
          count: 1
          memory: 1024
          module: services
          num_cpus: 2
          tags:
            - test-vsphere
            - test-vsphere-services
    variables:
      vsphere_allow_unverified_ssl:
        type: bool
        description: Boolean that can be set to true to disable SSL certificate verification
        default: "false"
      vsphere_compute_cluster:
        type: string
        description: Compute cluster to use by default
        default: ""
      vsphere_datacenter:
        type: string
        description: Datacenter to use by default
        default: ""
      vsphere_network:
        type: string
        description: Network to use by default
        default: ""
      vsphere_password:
        type: string
        description: Password for vSphere API operations
        default: ""
      vsphere_resource_pool:
        type: string
        description: The resource pool to put virtual machine's in
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

To properly secure secrets such as API tokens, usernames, passwords, etc.
Ensure to define them in `secrets.yml` and not in `configs.yml`. Anything placed in `secrets.yml` will be created in the root module folder as `terraform.tfvars.json`.

Example of `secrets.yml`:

```yaml
---
# Define secrets - Use with caution
secrets:
  {}
  # azurerm_subscription_id: SuperSecretSubscriptionID
  # azurerm_tenant_id: SuperSecretTenantID
  # do_token: SuperSecretAPItoken
  # vsphere_password: SuperSecretPass
  # vsphere_username: SuperSecretUser
```

### Help

You can get Terraform Builder help:

```bash
python -m terraform_builder -h
...
usage: __main__.py [-h] [--config CONFIG] [--outputdir OUTPUTDIR]
                   [--secrets SECRETS] [--version]

optional arguments:
  -h, --help            show this help message and exit
  --config CONFIG       Configuration (YAML) to load
  --outputdir OUTPUTDIR
                        Define path to save configs.
  --secrets SECRETS     Path to secrets
  --version             show program's version number and exit
```

### Executing

Executing Terraform Builder is extremely easy as well. Of course!

You can play with the configs.yml` included in [examples](https://github.com/mrlesmithjr/terraform-builder/tree/master/examples) to get familiar with the
concepts, etc.

```bash
python -m terraform_builder --config examples/configs.yml --outputdir examples/example_builds
...
Initializing modules...

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.azurerm: version = "~> 2.2"
* provider.digitalocean: version = "~> 1.15"
* provider.vsphere: version = "~> 1.16"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Success! The configuration is valid.
```

As you can see from above, there is very minimal output. However, after the
configurations have been generated, `terraform init` and `terraform validate`
are invoked in the `--outputdir`. By doing this we can ensure that our
configurations are good.

You will also find a `logs/terraform_builder.log`, which has a good amount of
info collected throughout the Terraform Builder process.

Example of `logs/terraform_builder.log`:

```bash
2020-03-20 21:23:04,460 - terraform_builder.config - INFO - Loading config: examples/configs.yml
2020-03-20 21:23:04,479 - terraform_builder.config - INFO - Data found: {'project_name': 'example', 'backends': {'local': {}, 'remote': {}}, 'environments': {'development': {}, 'production': {}, 'staging': {}}, 'global_variables': {}, 'modules': {'root': {}, 'network': {}, 'services': {}}, 'providers': {'AzureRM': {'variables': {'azurerm_environment': {'type': 'string', 'description': 'AzureRM Environment', 'default': 'public'}, 'azurerm_features': {'description': 'Customize the behaviour of certain Azure Provider resources.', 'default': {}}, 'azurerm_subscription_id': {'type': 'string', 'description': 'AzureRM Subscription ID', 'default': ''}, 'azurerm_tenant_id': {'type': 'string', 'description': 'AzureRM Tenant ID', 'default': ''}}}, 'DigitalOcean': {'variables': {'do_api_endpoint': {'type': 'string', 'description': 'This can be used to override the base URL for DigitalOcean API requests', 'default': 'https://api.digitalocean.com'}, 'do_image': {'type': 'string', 'description': 'Default DigitalOcean droplet image', 'default': 'ubuntu-18-04-x64'}, 'do_region': {'type': 'string', 'description': 'DigitalOcean region', 'default': 'nyc1'}, 'do_ssh_keys': {'type': 'string', 'description': 'DigitalOcean SSH keys to deploy to new droplets', 'default': []}, 'do_token': {'type': 'string', 'description': 'This is the DO API token', 'default': ''}}}, 'vSphere': {'variables': {'vsphere_allow_unverified_ssl': {'type': 'bool', 'description': 'Boolean that can be set to true to disable SSL certificate verification', 'default': 'false'}, 'vsphere_compute_cluster': {'type': 'string', 'description': 'Compute cluster to use by default', 'default': ''}, 'vsphere_datacenter': {'type': 'string', 'description': 'Datacenter to use by default', 'default': ''}, 'vsphere_network': {'type': 'string', 'description': 'Network to use by default', 'default': ''}, 'vsphere_password': {'type': 'string', 'description': 'Password for vSphere API operations', 'default': ''}, 'vsphere_resource_pool': {'type': 'string', 'description': "The resource pool to put virtual machine's in", 'default': ''}, 'vsphere_server': {'type': 'string', 'description': 'vCenter server name for vSphere API operations', 'default': ''}, 'vsphere_username': {'type': 'string', 'description': 'Username for vSphere API operations', 'default': ''}}}}, 'resources': {'projects': {'TerraformCloud': {'description': 'Terraform Cloud Project', 'environment': 'development', 'module': 'root', 'provider': 'DigitalOcean', 'purpose': 'Terraform Cloud Project', 'resources': [], 'tags': ['test']}}, 'vms': {'test-do-root': {'count': 1, 'memory': 1024, 'module': 'root', 'num_cpus': 1, 'provider': 'DigitalOcean', 'tags': ['test-digitalocean', 'test-digitalocean-root']}, 'test-do-network': {'count': 1, 'memory': 1024, 'module': 'network', 'num_cpus': 1, 'provider': 'DigitalOcean', 'tags': ['test-digitalocean', 'test-vsphere-network']}, 'test-vs-root': {'count': 1, 'memory': 2048, 'module': 'root', 'num_cpus': 1, 'provider': 'vSphere', 'tags': ['test-vsphere', 'test-vsphere-root']}, 'test-vs-services': {'count': 1, 'memory': 1024, 'module': 'services', 'num_cpus': 2, 'provider': 'vSphere', 'tags': ['test-vsphere', 'test-vsphere-services']}}}}
2020-03-20 21:23:04,479 - terraform_builder.config - INFO - Loading secrets: /Users/larrysmithjr/Git_Projects/Personal/GitHub/mrlesmithjr/terraform-builder/examples/secrets.yml
2020-03-20 21:23:04,480 - terraform_builder.build - INFO - project_root: examples/example_builds/example
2020-03-20 21:23:04,480 - terraform_builder.build - INFO - Rendering template for module: root using: main.tf.j2
2020-03-20 21:23:04,495 - terraform_builder.build - INFO - Creating: examples/example_builds/example/main.tf
2020-03-20 21:23:04,495 - terraform_builder.build - INFO - Rendering template for module: root using: resources.tf.j2
2020-03-20 21:23:04,520 - terraform_builder.build - INFO - Creating: examples/example_builds/example/resources.tf
2020-03-20 21:23:04,520 - terraform_builder.build - INFO - Rendering template for module: root using: variables.tf.j2
2020-03-20 21:23:04,531 - terraform_builder.build - INFO - Creating: examples/example_builds/example/variables.tf
2020-03-20 21:23:04,532 - terraform_builder.build - INFO - Rendering template for module: development using: main.tf.j2
2020-03-20 21:23:04,543 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/development/main.tf
2020-03-20 21:23:04,543 - terraform_builder.build - INFO - Rendering template for module: development using: resources.tf.j2
2020-03-20 21:23:04,569 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/development/resources.tf
2020-03-20 21:23:04,569 - terraform_builder.build - INFO - Rendering template for module: development using: variables.tf.j2
2020-03-20 21:23:04,580 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/development/variables.tf
2020-03-20 21:23:04,581 - terraform_builder.build - INFO - Rendering template for module: production using: main.tf.j2
2020-03-20 21:23:04,593 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/production/main.tf
2020-03-20 21:23:04,593 - terraform_builder.build - INFO - Rendering template for module: production using: resources.tf.j2
2020-03-20 21:23:04,620 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/production/resources.tf
2020-03-20 21:23:04,620 - terraform_builder.build - INFO - Rendering template for module: production using: variables.tf.j2
2020-03-20 21:23:04,631 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/production/variables.tf
2020-03-20 21:23:04,632 - terraform_builder.build - INFO - Rendering template for module: staging using: main.tf.j2
2020-03-20 21:23:04,643 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/staging/main.tf
2020-03-20 21:23:04,643 - terraform_builder.build - INFO - Rendering template for module: staging using: resources.tf.j2
2020-03-20 21:23:04,668 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/staging/resources.tf
2020-03-20 21:23:04,668 - terraform_builder.build - INFO - Rendering template for module: staging using: variables.tf.j2
2020-03-20 21:23:04,681 - terraform_builder.build - INFO - Creating: examples/example_builds/example/environments/staging/variables.tf
2020-03-20 21:23:04,682 - terraform_builder.build - INFO - Rendering template for module: network using: main.tf.j2
2020-03-20 21:23:04,694 - terraform_builder.build - INFO - Creating: examples/example_builds/example/modules/network/main.tf
2020-03-20 21:23:04,694 - terraform_builder.build - INFO - Rendering template for module: network using: resources.tf.j2
2020-03-20 21:23:04,720 - terraform_builder.build - INFO - Creating: examples/example_builds/example/modules/network/resources.tf
2020-03-20 21:23:04,720 - terraform_builder.build - INFO - Rendering template for module: network using: variables.tf.j2
2020-03-20 21:23:04,732 - terraform_builder.build - INFO - Creating: examples/example_builds/example/modules/network/variables.tf
2020-03-20 21:23:04,733 - terraform_builder.build - INFO - Rendering template for module: services using: main.tf.j2
2020-03-20 21:23:04,747 - terraform_builder.build - INFO - Creating: examples/example_builds/example/modules/services/main.tf
2020-03-20 21:23:04,748 - terraform_builder.build - INFO - Rendering template for module: services using: resources.tf.j2
2020-03-20 21:23:04,779 - terraform_builder.build - INFO - Creating: examples/example_builds/example/modules/services/resources.tf
2020-03-20 21:23:04,779 - terraform_builder.build - INFO - Rendering template for module: services using: variables.tf.j2
2020-03-20 21:23:04,797 - terraform_builder.build - INFO - Creating: examples/example_builds/example/modules/services/variables.tf
2020-03-20 21:23:04,797 - terraform_builder.specs.important.files - INFO - configs: {'project_name': 'example', 'backends': {'local': {}, 'remote': {}}, 'environments': {'development': {}, 'production': {}, 'staging': {}}, 'global_variables': {}, 'modules': {'root': {}, 'network': {}, 'services': {}}, 'providers': {'AzureRM': {'variables': {'azurerm_environment': {'type': 'string', 'description': 'AzureRM Environment', 'default': 'public'}, 'azurerm_features': {'description': 'Customize the behaviour of certain Azure Provider resources.', 'default': {}}, 'azurerm_subscription_id': {'type': 'string', 'description': 'AzureRM Subscription ID', 'default': ''}, 'azurerm_tenant_id': {'type': 'string', 'description': 'AzureRM Tenant ID', 'default': ''}}}, 'DigitalOcean': {'variables': {'do_api_endpoint': {'type': 'string', 'description': 'This can be used to override the base URL for DigitalOcean API requests', 'default': 'https://api.digitalocean.com'}, 'do_image': {'type': 'string', 'description': 'Default DigitalOcean droplet image', 'default': 'ubuntu-18-04-x64'}, 'do_region': {'type': 'string', 'description': 'DigitalOcean region', 'default': 'nyc1'}, 'do_ssh_keys': {'type': 'string', 'description': 'DigitalOcean SSH keys to deploy to new droplets', 'default': []}, 'do_token': {'type': 'string', 'description': 'This is the DO API token', 'default': ''}}}, 'vSphere': {'variables': {'vsphere_allow_unverified_ssl': {'type': 'bool', 'description': 'Boolean that can be set to true to disable SSL certificate verification', 'default': 'false'}, 'vsphere_compute_cluster': {'type': 'string', 'description': 'Compute cluster to use by default', 'default': ''}, 'vsphere_datacenter': {'type': 'string', 'description': 'Datacenter to use by default', 'default': ''}, 'vsphere_network': {'type': 'string', 'description': 'Network to use by default', 'default': ''}, 'vsphere_password': {'type': 'string', 'description': 'Password for vSphere API operations', 'default': ''}, 'vsphere_resource_pool': {'type': 'string', 'description': "The resource pool to put virtual machine's in", 'default': ''}, 'vsphere_server': {'type': 'string', 'description': 'vCenter server name for vSphere API operations', 'default': ''}, 'vsphere_username': {'type': 'string', 'description': 'Username for vSphere API operations', 'default': ''}}}}, 'resources': {'projects': {'TerraformCloud': {'description': 'Terraform Cloud Project', 'environment': 'development', 'module': 'root', 'provider': 'DigitalOcean', 'purpose': 'Terraform Cloud Project', 'resources': [], 'tags': ['test']}}, 'vms': {'test-do-root': {'count': 1, 'memory': 1024, 'module': 'root', 'num_cpus': 1, 'provider': 'DigitalOcean', 'tags': ['test-digitalocean', 'test-digitalocean-root']}, 'test-do-network': {'count': 1, 'memory': 1024, 'module': 'network', 'num_cpus': 1, 'provider': 'DigitalOcean', 'tags': ['test-digitalocean', 'test-vsphere-network']}, 'test-vs-root': {'count': 1, 'memory': 2048, 'module': 'root', 'num_cpus': 1, 'provider': 'vSphere', 'tags': ['test-vsphere', 'test-vsphere-root']}, 'test-vs-services': {'count': 1, 'memory': 1024, 'module': 'services', 'num_cpus': 2, 'provider': 'vSphere', 'tags': ['test-vsphere', 'test-vsphere-services']}}}}
2020-03-20 21:23:04,798 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/modules/network/LICENSE.md
2020-03-20 21:23:04,798 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/modules/services/LICENSE.md
2020-03-20 21:23:04,799 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/environments/development/LICENSE.md
2020-03-20 21:23:04,799 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/environments/production/LICENSE.md
2020-03-20 21:23:04,799 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/environments/staging/LICENSE.md
2020-03-20 21:23:04,818 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/modules/network/README.md
2020-03-20 21:23:04,818 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/modules/services/README.md
2020-03-20 21:23:04,819 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/environments/development/README.md
2020-03-20 21:23:04,820 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/environments/production/README.md
2020-03-20 21:23:04,821 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/environments/staging/README.md
2020-03-20 21:23:04,821 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/LICENSE.md
2020-03-20 21:23:04,839 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/README.md
2020-03-20 21:23:04,840 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/.gitignore
2020-03-20 21:23:04,841 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/requirements.txt
2020-03-20 21:23:04,843 - terraform_builder.specs.important.files - INFO - Creating important file: examples/example_builds/example/requirements-dev.txt
2020-03-20 21:23:04,843 - terraform_builder.build - INFO - terraform_path: /usr/local/bin/terraform
2020-03-20 21:23:04,843 - terraform_builder.build - INFO - Initializing config in: examples/example_builds/example
2020-03-20 21:23:05,674 - terraform_builder.build - INFO - terraform init: [0m[1mInitializing modules...[0m

[0m[1mInitializing the backend...[0m

[0m[1mInitializing provider plugins...[0m

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.azurerm: version = "~> 2.2"
* provider.digitalocean: version = "~> 1.15"
* provider.vsphere: version = "~> 1.16"

[0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
[0m[32m
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.[0m

2020-03-20 21:23:05,674 - terraform_builder.build - INFO - Validating config in: examples/example_builds/example
2020-03-20 21:23:07,153 - terraform_builder.build - INFO - terraform validate: [32m[1mSuccess![0m The configuration is valid.
[0m

```
