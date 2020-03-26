"""terraform_builder/specs/parsers/resources.py"""

import logging

# pylint: disable=line-too-long


class Resources:
    """Resources class for JSON output."""

    def __init__(self, **kwargs):
        """Init a thing."""

        # Define module being processed
        self.module = kwargs['data']['module']

        self.providers = kwargs['data']['provider_configs']

        # Define resources list to append to
        self.resources = []

        # Setup logging
        self.logger = logging.getLogger(__name__)

    def parse(self):
        """Parse providers from provider configurations."""

        # Define provider map for function
        provider_map = {'azurerm': self.azurerm,
                        'digitalocean': self.digitalocean,
                        'vsphere': self.vsphere}

        # Iterate through providers and their configs
        for provider, config in self.providers.items():
            # Obtain provider mapping from provider map
            provider_mapping = provider_map[provider.lower()]
            # Define resources from config to pass onto function
            resources = config['resources']
            # Execute function and get results
            provider_config_resources = provider_mapping(resources)

            # Skip resources returned as None|null
            if provider_config_resources is not None:
                self.resources.append(provider_config_resources)

        return self.resources

    def azurerm(self, resources):
        """Parse AzureRM provider."""

        # Check to ensure resource groups are defined
        if resources['resource_groups']:
            for resource_group, rg_config in resources[
                    'resource_groups'].items():
                if rg_config['module'] == self.module:
                    self.azurerm_rg(resource_group, rg_config)

    def azurerm_rg(self, resource_group, rg_config):
        """Parse AzureRM resource group."""

        # Check to ensure resource group is to be created
        if rg_config['create']:
            resource = {
                'resource': {
                    'azurerm_resource_group': {
                        resource_group.replace('-', '_'): {
                            'name': '${format("'+f'{resource_group}'+'-%s", substr(var.environment, 0, 4))}',
                            'location': '${var.azurerm_location}'
                        }
                    }
                }
            }

            self.resources.append(resource)

    def digitalocean(self, resources):
        """Parse DigitalOcean provider."""

        # Check if there are any projects defined
        if resources['projects']:
            # Iterate over projects and their configs
            for proj, proj_config in resources['projects'].items():
                # Ensure that the project module is to be placed in the current
                # module
                if proj_config['module'] == self.module:
                    # Execute project function
                    self.digitalocean_proj(proj, proj_config)

    def digitalocean_proj(self, proj, proj_config):
        """Parse DigitalOcean project."""

        # Check if project is to be created
        if proj_config['create']:
            # Define resource
            resource = {
                'resource': {
                    'digitalocean_project': {
                        proj.replace('-', '_'): {
                            'name': '${format("'+f'{proj}'+'-%s", substr(var.environment, 0, 4))}',
                            'description': '${format("'+f"{proj_config['description']}"+' - %s", var.environment)}',
                            'purpose': '${format("'+f"{proj_config['purpose']}"+' - %s", var.environment)}',
                            'environment': '${var.environment}',
                            'resources': '${[for resource in flatten(local.project_resources) : resource]}'
                        }
                    }
                }
            }

            self.resources.append(resource)

            # Define project resources list to contain resources to add to
            # project
            project_resources = []

            # Check if there are any project domains defined
            if proj_config['domains']:
                # Iterate over domains and their configs
                for domain, domain_config in proj_config['domains'].items():
                    # Check if domain is to be created
                    if domain_config['create']:
                        # Define resource
                        resource = {'resource': {'digitalocean_domain': {
                            domain.replace('-', '_').replace('.', '_'): {'name': domain}}}}

                        self.resources.append(resource)

                        # Append to project resources to add to project
                        project_resources.append(
                            'digitalocean_domain.'+domain.replace('-', '_').replace('.', '_')+'.urn')

            resource = {
                "locals": {
                    "project_resources": project_resources
                }
            }

            self.resources.append(resource)

    def vsphere(self, resources):
        """Parse vSphere provider."""
