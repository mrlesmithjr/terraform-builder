"""terraform_builder/build.py"""

import logging
import os
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

    def configurations(self):
        """Generate Terraform configurations."""

        self.structure()

    def structure(self):
        """Terraform directory structure."""

        self.root()
        self.environments()
        self.modules()
        important_files(self.project_root, self.configs)

    def root(self):
        """Configured root environment - Parent directory."""

        # If project root does not exist, create it
        if not os.path.isdir(self.project_root):
            self.logger.info('Creating project_root: %s', self.project_root)
            os.makedirs(self.project_root)

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
            module_dir = os.path.join(self.project_root, 'modules', module)
            if not os.path.isdir(module_dir):
                self.logger.info('Creating module: %s', module_dir)
                os.makedirs(module_dir)
