"""terraform_builder/__main__.py"""

import json
from terraform_builder.cli import cli_args
from terraform_builder.logger import setup_logger
from terraform_builder.config import Config


def main():
    """Main execution of package."""

    # Setup root logger
    setup_logger()

    # Capture CLI arguments
    args = cli_args()

    # Parse config in preparation of processing
    config = Config(args)
    configs = config.parse()
    print(json.dumps(configs))


if __name__ == '__main__':
    main()
