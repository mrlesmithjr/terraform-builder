"""terraform_builder/loader.py"""

import logging
import sys
import yaml


class Config:
    """Main config loader class."""

    def __init__(self, args):
        """Init a thing."""

        # Define config to load up
        self.config = args.config
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

        return configs

    def parse(self):
        """Parse YAML configuration."""

        configs = self.load()

        return configs
