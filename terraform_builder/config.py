"""terraform_builder/loader.py"""

import logging
import sys
import yaml


class Config:
    """Main config loader class."""

    def __init__(self, args):
        """Init a thing."""

        # Define config to load
        self.config = args.config
        # Define secrets to load
        self.secrets = args.secrets
        # Setup logging
        self.logger = logging.getLogger(__name__)

    def load(self):
        """Load YAML configuration."""

        try:
            # Log config path being loaded
            self.logger.info('Loading config: %s', self.config)

            with open(self.config, 'r') as file:
                # Load YAML file data
                configs = yaml.load(file, Loader=yaml.FullLoader)
                # Log data found
                self.logger.info('Data found: %s', configs)

            # Log and exit if no data found
            if configs is None:
                self.logger.error('No data found, exiting.')
                sys.exit(1)

        except FileNotFoundError as error:
            self.logger.error(error)
            sys.exit(1)

        try:
            # Log secrets path being loaded
            self.logger.info('Loading secrets: %s', self.secrets)

            with open(self.secrets, 'r') as file:
                # Load YAML file data and do not log
                secrets = yaml.load(file, Loader=yaml.FullLoader)

        except FileNotFoundError as error:
            self.logger.error(error)
            sys.exit(1)

        return configs, secrets

    def parse(self):
        """Parse YAML configuration."""

        configs = self.load()

        return configs
