"""terraform_builder/build.py"""

import logging
import os
import shutil
import subprocess
import sys
import json
import jinja2
from graphviz import Source
from terraform_builder.specs.important.files import important_files
from terraform_builder.specs.filters.j2 import to_json
from terraform_builder.specs.parsers.backends import Backends
from terraform_builder.specs.parsers.providers import Providers
# from terraform_builder.specs.parsers.resources import Resources
from terraform_builder.specs.parsers.variables import Variables
from terraform_builder.specs.parsers.modules import Modules


class Build:
    """Main build class."""

    def __init__(self, args, configs, secrets):
        """Init a thing."""

        self.configs = configs
        self.secrets = secrets

        # Define Terraform output format - Native|JSON
        self.outputformat = args.outputformat

        # Setup logging
        self.logger = logging.getLogger(__name__)

        self.project_name = self.configs['project_name']

        # If JSON format is desired, append -JSON to project directory to keep
        # things separate. There may be a reason to have both native and JSON
        if self.outputformat == 'JSON':
            project_name = f"{self.configs['project_name']}-JSON"
        else:
            project_name = self.configs['project_name']

        # Define project root directory
        self.project_root = os.path.join(
            args.outputdir, project_name)

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

        # Log project root
        self.logger.info('project_root: %s', self.project_root)
        # Log Terraform output format
        self.logger.info('outputformat: %s', self.outputformat)

        # Build out project structure
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
        if self.outputformat == 'Native':
            for file in ['main.tf', 'resources.tf', 'terraform.tfvars.json',
                         'variables.tf']:
                template = self.template(
                    self.configs, secrets=self.secrets, module='root',
                    file=file)
                file_path = os.path.join(self.project_root, f'{file}')
                with open(file_path, 'w') as config:
                    self.logger.info('Creating: %s', file_path)
                    config.write(template)

        else:
            self.root_json()

    def root_json(self):
        """Output as JSON configurations."""

        # Define JSON output dictionary
        json_output = {}

        # Capture required Terraform version
        req_ver = self.configs['required_terraform_version']

        # Define main config for root module path
        json_output['main'] = {}
        json_output['main']['terraform'] = {
            'required_version': f">= {req_ver}"}

        # Define backends from configs
        backends = self.configs['backends']
        # Set backends class
        backend = Backends()
        json_output['main']['terraform']['backend'] = backend.parse(
            backends)

        # Define provider configs
        provider_configs = self.configs['providers']

        # Define provider
        providers = Providers()
        json_output['providers'] = providers.parse(
            provider_configs)

        # Set variables class
        variables = Variables()
        # Get dictionary list of variables
        json_output['variables'] = variables.parse(provider_configs)

        # Get environments to setup root modules
        environments = self.configs['environments']

        # Define data to pass to modules as kwargs
        data = {'environments': environments, 'module': 'root'}

        # Set modules class
        modules = Modules(data=data)
        # Get dictionary list of modules
        json_output['modules'] = modules.parse()

        # Iterate through JSON config files to create
        # Using JSON key to generate files
        for config_json in ['main', 'modules', 'providers', 'variables']:
            self.logger.info('config_json: %s', config_json)
            file_path = os.path.join(
                self.project_root, f'{config_json}.tf.json')
            with open(file_path, 'w') as config:
                self.logger.info('Creating: %s', file_path)
                json.dump(json_output[config_json], config, indent=2)

        # Save secrets as JSON
        secrets_json = os.path.join(
            self.project_root, 'terraform.tfvars.json')
        with open(secrets_json, 'w') as config:
            json.dump(self.secrets['secrets'], config, indent=2)

    def environments(self):
        """Configures environments."""

        environments = self.configs['environments']
        for env, _env_config in environments.items():
            env_dir = os.path.join(self.project_root, 'environments', env)
            if not os.path.isdir(env_dir):
                self.logger.info('Creating environment: %s', env_dir)
                os.makedirs(env_dir)

            if self.outputformat == 'Native':
                for file in ['main.tf', 'resources.tf', 'variables.tf']:
                    template = self.template(
                        self.configs, secrets=self.secrets, module=env,
                        file=file)
                    file_path = os.path.join(env_dir, f'{file}')
                    with open(file_path, 'w') as config:
                        self.logger.info('Creating: %s', file_path)
                        config.write(template)
            else:
                self.environments_json(env, env_dir)

    def environments_json(self, env, env_dir):
        """Output as JSON configurations."""

        # Define JSON output dictionary
        json_output = {}

        # Define provider configs
        provider_configs = self.configs['providers']

        # Set variables class
        variables = Variables()
        # Get dictionary list of variables
        json_output['variables'] = variables.parse(
            provider_configs)

        # Define module configs
        module_configs = self.configs['modules']

        # Define data to pass to modules as kwargs
        data = {'environment': env,
                'module': 'environments',
                'module_configs': module_configs}

        # Set modules class
        modules = Modules(data=data)
        # Get dictionary list of modules
        json_output['modules'] = modules.parse()

        # Iterate through JSON config files to create
        # Using JSON key to generate files
        for config_json in ['modules', 'variables']:
            self.logger.info('config_json: %s', config_json)
            file_path = os.path.join(env_dir, f'{config_json}.tf.json')
            with open(file_path, 'w') as config:
                self.logger.info('Creating: %s', file_path)
                json.dump(
                    json_output[config_json], config, indent=2)

    def modules(self):
        """Configures modules."""

        modules = self.configs['modules']
        for module, _module_config in modules.items():
            if module.lower() != 'root':
                module_dir = os.path.join(self.project_root, 'modules', module)
                if not os.path.isdir(module_dir):
                    self.logger.info('Creating module: %s', module_dir)
                    os.makedirs(module_dir)

                if self.outputformat == 'Native':
                    # Create Terraform configuration files for modules
                    for file in ['main.tf', 'resources.tf', 'variables.tf']:
                        template = self.template(
                            self.configs, secrets=self.secrets, module=module,
                            file=file)
                        file_path = os.path.join(
                            self.project_root, 'modules', module, f'{file}')
                        with open(file_path, 'w') as config:
                            self.logger.info('Creating: %s', file_path)
                            config.write(template)
                else:
                    self.modules_json(module)

    def modules_json(self, module):
        """Output as JSON configurations."""

        # Define JSON output dictionary
        json_output = {}

        # Define provider configs
        provider_configs = self.configs['providers']

        # Set variables class
        variables = Variables()
        # Get dictionary list of variables
        json_output['variables'] = variables.parse(
            provider_configs)

        # Iterate through JSON config files to create
        # Using JSON key to generate files
        for config_json in ['variables']:
            self.logger.info('config_json: %s', config_json)
            file_path = os.path.join(
                self.project_root, 'modules', module,
                f'{config_json}.tf.json')
            with open(file_path, 'w') as config:
                self.logger.info('Creating: %s', file_path)
                json.dump(
                    json_output[config_json], config, indent=2)

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
