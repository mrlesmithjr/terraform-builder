"""terraform_builder/specs/parsers/modules.py"""

import logging


class Modules:
    """Modules class for JSON output."""

    def __init__(self, **kwargs):
        """Init a thing."""

        # Define module being processed
        self.module = kwargs['data']['module']

        # If module is root, we only parse environments
        if self.module == 'root':
            self.data = kwargs['data']['environments']

        # If module is environments, we only parse module configs
        elif self.module == 'environments':
            self.data = {'environment': kwargs['data']['environment'],
                         'module_configs': kwargs['data']['module_configs']}

        # Define variables list to append to
        self.modules = []

        # Setup logging
        self.logger = logging.getLogger(__name__)

    def parse(self):
        """Parse modules from provider configurations."""

        # Define modules map to decide function
        modules_map = {'environments': self.environments, 'root': self.root}
        # Get function from module name
        module_mapping = modules_map[self.module]
        # Execute function
        module_mapping(self.data)

        return self.modules

    def environments(self, data):
        """Parse environment modules."""

        # Define environment
        environment = data['environment']
        # Iterate through modules to define modules for each environment
        for module, _config in data['module_configs'].items():
            # If module is root, we skip it because it is already handled
            if module != 'root':
                module_config = {'module': {
                    module: {'source': f'../../modules/{module}',
                             'environment': environment}}}

                self.modules.append(module_config)

    def root(self, data):
        """Parse root modules."""

        # Iterate through environments to define root modules
        for environment, _config in data.items():
            module_config = {'module': {
                environment: {'source': f'./environments/{environment}',
                              'environment': environment}}}

            self.modules.append(module_config)
