"""terraform_builder/specs/parsers/variables.py"""

import logging


class Variables:
    """Variables class for JSON output."""

    def __init__(self):
        """Init a thing."""

        # Define variables list to append to
        self.variables = []

        # Setup logging
        self.logger = logging.getLogger(__name__)

    def parse(self, provider_configs):
        """Parse variables from provider configurations."""

        # Append the default environment variable
        self.variables.append({'variable': {'environment': {'type': 'string',
                                                            'default': ''}}})

        # Iterate over providers
        for _provider, provider_config in provider_configs.items():
            # Check if provider_config is not empty
            if provider_config != {}:
                # If provider_config has variables defined
                if provider_config['variables']:
                    # Extract provider variables
                    self.extract(provider_config['variables'])

        return self.variables

    def extract(self, variables):
        """Extract variables from each provider configuration."""

        # Iterate through variables defined for provider and append
        for variable, variable_config in variables.items():
            self.variables.append({'variable': {
                variable: variable_config}})
