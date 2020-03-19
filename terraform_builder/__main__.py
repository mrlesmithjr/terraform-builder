"""terraform_builder/__main__.py"""

from terraform_builder.cli import cli_args
from terraform_builder.logger import setup_logger
from terraform_builder.config import Config
from terraform_builder.build import Build


def main():
    """Main execution of package."""

    # Setup root logger
    setup_logger()

    # Capture CLI arguments
    args = cli_args()

    # Parse config in preparation of processing
    config = Config(args)
    configs, secrets = config.parse()

    # Build
    build = Build(args, configs)
    build.configurations()


if __name__ == '__main__':
    main()
