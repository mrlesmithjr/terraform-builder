"""terraform_builder/build.py"""

import logging
import os
import jinja2
from terraform_builder.specs.important.files import important_files


class Build:
    """Main build class."""

    def __init__(self, args, configs):
        """Init a thing."""

        self.args = args
        self.configs = configs
        # Setup logging
        self.logger = logging.getLogger(__name__)
        # Define project root directory
        self.project_root = os.path.join(
            self.args.outputdir, self.configs['project_name'])
        # Log project root
        self.logger.info('project_root: %s', self.project_root)

    def template(self, args, module, file):
        # Defines absolute path to templates directory
        template_dir = os.path.join(os.path.dirname(
            os.path.abspath(__file__)), 'specs', 'templates')
        # Loads templates directory
        template_loader = jinja2.FileSystemLoader(template_dir)

        # Sets Jinja2 template environment
        template_env = jinja2.Environment(loader=template_loader)

        # Defines which template to get from file including .j2 extension
        template = template_env.get_template(
            f'{file}.tf.j2').render(args=args, module=module)

        return template

    def configurations(self):
        """Generate Terraform configurations."""

        self.structure()

    def structure(self):
        """Terraform directory structure."""

        # Create root directory structure
        self.root()
        # Create environmental directory structure
        self.environments()
        # Create modules directory structure
        self.modules()
        # Ensure important files such as README, LICENSE, etc. exist
        important_files(self.project_root, self.configs)

    def root(self):
        """Configured root environment - Parent directory."""

        # If project root does not exist, create it
        if not os.path.isdir(self.project_root):
            self.logger.info('Creating project_root: %s', self.project_root)
            os.makedirs(self.project_root)

        for file in ['main', 'variables']:
            template = self.template(self.configs, module='root', file=file)
            file_path = os.path.join(self.project_root, f'{file}.tf')
            with open(file_path, 'w') as config:
                self.logger.info('Creating: %s', file_path)
                config.write(template)

    def environments(self):
        """Configures environments."""

        environments = self.configs['environments']
        for env, _env_config in environments.items():
            env_dir = os.path.join(self.project_root, 'environments', env)
            if not os.path.isdir(env_dir):
                self.logger.info('Creating environment: %s', env_dir)
                os.makedirs(env_dir)

    def modules(self):
        """Configures modules."""

        modules = self.configs['modules']
        for module, _module_config in modules.items():
            if module.lower() != 'root':
                module_dir = os.path.join(self.project_root, 'modules', module)
                if not os.path.isdir(module_dir):
                    self.logger.info('Creating module: %s', module_dir)
                    os.makedirs(module_dir)
