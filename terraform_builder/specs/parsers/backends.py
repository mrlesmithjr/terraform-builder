"""terraform_builder/specs/parsers/backends.py"""

import logging


class Backends:
    """Backends class for JSON output."""

    def __init__(self):
        """Init a thing."""

        # Define backends list to append to
        self.backends = []

        # Setup logging
        self.logger = logging.getLogger(__name__)

    def parse(self, backends):
        """Parse backends from configurations."""

        self.logger.info('backends: %s', backends)

        if not backends['remote'] or backends['remote'] == {}:
            local_config = backends['local']
            backend_config = self.local(local_config)

        else:
            backend_config = {}

        return backend_config

    def local(self, local_config):
        """Local backend configuration."""

        local_backend = {'local': local_config}

        self.logger.info('local_backend: %s', local_backend)

        return local_backend

    def remote(self):
        """Remote backend configuration."""
