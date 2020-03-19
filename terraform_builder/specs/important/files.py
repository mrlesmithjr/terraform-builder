"""terraform_builder/specs/important/files.py"""

# Ensures important files exist

import os
import logging
import jinja2
from terraform_builder.specs.filters.j2 import to_yaml


def important_files(project_root, configs):
    """Ensures important files exist and populated."""

    logger = logging.getLogger(__name__)
    logger.info('configs: %s', configs)

    # Defines important files to create from Jinja2 templates
    files = {
        '.gitignore': {},
        'LICENSE.md': {},
        'README.md': configs,
    }

    # Defines absolute path to templates directory
    template_dir = os.path.join(os.path.dirname(
        os.path.abspath(__file__)), 'templates')
    # Loads templates directory
    template_loader = jinja2.FileSystemLoader(template_dir)
    # Sets Jinja2 template environment
    template_env = jinja2.Environment(loader=template_loader)

    template_env.filters['to_yaml'] = to_yaml

    # Iterate over files
    for file, args in files.items():

        # Defines path to project root and file
        file_path = os.path.join(project_root, file)
        # Defines which template to get from file including .j2 extension
        template = template_env.get_template(f'{file}.j2').render(args=args)

        with open(file_path, 'w') as config:
            logger.info('Creating important file: %s',
                        os.path.join(project_root, file))
            config.write(template)
