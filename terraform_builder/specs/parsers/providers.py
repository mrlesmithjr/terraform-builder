"""terraform_builder/specs/parsers/providers.py"""

# This module configures provider configurations only. Not resources!

import logging


class Providers:
    """Resources class for JSON output."""

    def __init__(self):
        """Init a thing."""

        # Define providers list to append to
        self.providers = []

        # Setup logging
        self.logger = logging.getLogger(__name__)

    def parse(self, providers):
        """Parse providers from provider configurations."""

        provider_map = {'azurerm': self.azurerm,
                        'digitalocean': self.digitalocean,
                        'vsphere': self.vsphere}

        for provider in providers:
            provider_mapping = provider_map[provider.lower()]
            provider_config = provider_mapping()
            self.providers.append(provider_config)

        return self.providers

    def azurerm(self):
        """Parse AzureRM provider."""

        provider_config = {'provider': {'azurerm': {
            'environment': '${var.azurerm_environment}',
            'features': {}, 'client_id': '${var.azurerm_client_id}',
            'client_secret': '${var.azurerm_client_secret}',
            'subscription_id': '${var.azurerm_subscription_id}',
            'tenant_id': '${var.azurerm_tenant_id}'}}}

        self.logger.info('provider_config: %s', provider_config)

        return provider_config

    def digitalocean(self):
        """Parse DigitalOcean provider."""

        provider_config = {'provider': {'digitalocean': {
            'api_endpoint': '${var.do_api_endpoint}',
            'token': '${var.do_token}'}}}

        self.logger.info('provider_config: %s', provider_config)

        return provider_config

    def vsphere(self):
        """Parse vSphere provider."""

        provider_config = {'provider': {'vsphere': {
            'allow_unverified_ssl': '${var.vsphere_allow_unverified_ssl}',
            'password': '${var.vsphere_password}',
            'user': '${var.vsphere_username}',
            'vsphere_server': '${var.vsphere_server}'}}}

        self.logger.info('provider_config: %s', provider_config)

        return provider_config
