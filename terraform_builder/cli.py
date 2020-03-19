"""terraform_builder/cli.py"""

import argparse
import os
from terraform_builder.release import __package_name__, __version__


def cli_args():
    """Console script for terraform_builder."""

    # Get parent directory to load example configs if --config not passed
    parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--config', help='Configuration (YAML) to load',
        default=os.path.join(parent_dir, 'examples', 'configs.yml'))
    parser.add_argument('--version', action='version',
                        version=f'{__package_name__} {__version__}')
    args = parser.parse_args()

    return args
