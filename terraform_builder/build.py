"""terraform_builder/build.py"""

import logging
import os
import shutil
import subprocess
import sys
import jinja2
from graphviz import Source
from terraform_builder.specs.important.files import important_files
from terraform_builder.specs.filters.j2 import to_json


class Build:
    """Main build class."""

    def __init__(self, args, configs, secrets):
        """Init a thing."""

        self.args = args
        self.configs = configs
        self.secrets = secrets
        # Setup logging
        self.logger = logging.getLogger(__name__)
        self.project_name = self.configs['project_name']
        # Define project root directory
        self.project_root = os.path.join(
            self.args.outputdir, self.configs['project_name'])
        # Log project root
        self.logger.info('project_root: %s', self.project_root)

    def template(self, args, secrets, module, file):
        """Renders template and returns the config."""

        # Defines absolute path to templates directory
        template_dir = os.path.join(os.path.dirname(
            os.path.abspath(__file__)), 'specs', 'templates')
        # Loads templates directory
        template_loader = jinja2.FileSystemLoader(template_dir)

        # Sets Jinja2 template environment
        template_env = jinja2.Environment(loader=template_loader)

        template_env.filters['to_json'] = to_json

        self.logger.info(
            'Rendering template for module: %s using: %s.tf.j2', module, file)

        # Defines which template to get from file including .j2 extension
        template = template_env.get_template(
            f'{file}.j2').render(args=args, secrets=secrets, module=module)

        return template

    def configurations(self):
        """Generate Terraform configurations."""

        self.structure()

        # Ensure Terraform command found
        terraform_path = shutil.which('terraform')

        # If Terraform command is found, continue
        if terraform_path is not None:
            self.logger.info('terraform_path: %s', terraform_path)
            # Capture current working directory prior to changing to the
            # project root directory. So, we can change back.
            current_dir = os.getcwd()

            # Change to project root directory
            os.chdir(self.project_root)

            # Initialize Terraform configs
            self.init()
            # Validate Terraform configs
            self.validate()

            # Check for dot command path
            dot_path = shutil.which('dot')
            # Log dot path
            self.logger.info('dot_path: %s', dot_path)
            # If graphviz dot command found, generate graph
            if dot_path is not None:
                # Generate Terraform graph to display in project markdown
                self.graph()

            # Change to project root directory
            os.chdir(current_dir)

        # If Terraform command not found, log and exit
        else:
            self.logger.error('Terraform not found. Please install.')
            sys.exit(1)

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

        # Create Terraform configuration files for root module
        for file in ['project_main.tf', 'terraform.tfvars.json',
                     'variables.tf']:
            template = self.template(
                self.configs, secrets=self.secrets, module='root', file=file)
            file_path = os.path.join(self.project_root, f'{file}')
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

            for file in ['main.tf', 'resources.tf', 'variables.tf']:
                template = self.template(
                    self.configs, secrets=self.secrets, module=env, file=file)
                file_path = os.path.join(env_dir, f'{file}')
                with open(file_path, 'w') as config:
                    self.logger.info('Creating: %s', file_path)
                    config.write(template)

    def modules(self):
        """Configures modules."""

        modules = self.configs['modules']
        for module, _module_config in modules.items():
            if module.lower() == 'root':
                module_dir = os.path.join(self.project_root, module)
            else:
                module_dir = os.path.join(self.project_root, 'modules', module)
            if not os.path.isdir(module_dir):
                self.logger.info('Creating module: %s', module_dir)
                os.makedirs(module_dir)

            # Create Terraform configuration files for modules
            for file in ['main.tf', 'resources.tf', 'variables.tf']:
                template = self.template(
                    self.configs, secrets=self.secrets, module=module,
                    file=file)
                file_path = os.path.join(
                    module_dir, f'{file}')
                with open(file_path, 'w') as config:
                    self.logger.info('Creating: %s', file_path)
                    config.write(template)

    def init(self):
        """Initialize Terraform configs."""

        self.logger.info('Initializing config in: %s', self.project_root)
        initialize = subprocess.run(
            ['terraform', 'init'], check=False, capture_output=True)

        if initialize.returncode != 0:
            self.logger.error('terraform init: %s',
                              initialize.stdout.decode("utf-8"))
        else:
            self.logger.info('terraform init: %s',
                             initialize.stdout.decode("utf-8"))

        # Display output back to stdout for visibility
        print(initialize.stdout.decode("utf-8"))

    def validate(self):
        """Validate Terraform configs."""

        self.logger.info('Validating config in: %s', self.project_root)

        # Validate configuration
        validation = subprocess.run(
            ['terraform', 'validate'], check=False, capture_output=True)

        if validation.returncode != 0:
            self.logger.error('terraform validate: %s',
                              validation.stderr.decode("utf-8"))
        else:
            self.logger.info('terraform validate: %s',
                             validation.stdout.decode("utf-8"))

            # Display output back to stdout for visibility
            print(validation.stdout.decode("utf-8"))

    def graph(self):
        """Generate graph image from terraform graph - Graphviz."""

        # Defines output format for graph
        output_format = 'jpg'
        # Defines output file to save graph
        output_file = f'{self.project_name}'

        # Execute terraform graph to capture dot source
        terraform_graph = subprocess.run(
            ['terraform', 'graph'], check=False,
            stdout=subprocess.PIPE)

        # Extract terraform graph source
        source = Source(terraform_graph.stdout.decode('utf-8'))
        # Render terraform graph source and save
        source.render(filename=output_file, format=output_format, cleanup=True)
