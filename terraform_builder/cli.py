"""Console script for terraform_builder."""

import argparse
from terraform_builder.release import __package_name__, __version__


def cli_args():
    """Console script for terraform_builder."""
    parser = argparse.ArgumentParser()
    parser.add_argument('--version', action='version',
                        version=f'{__package_name__} {__version__}')
    args = parser.parse_args()

    return args
