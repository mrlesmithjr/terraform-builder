"""Main module."""
from terraform_builder.cli import cli_args
from terraform_builder.logger import setup_logger


def main():
    """Main execution of package."""

    # Setup root logger
    setup_logger()

    # Capture CLI arguments
    args = cli_args()


if __name__ == '__main__':
    main()
