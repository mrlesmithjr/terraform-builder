# Command Line Usage

The following will provide some of the command line options available with
Terraform Builder.

## Help

You can get Terraform Builder help:

```bash
python -m terraform_builder -h
...
usage: __main__.py [-h] [--config CONFIG] [--outputdir OUTPUTDIR]
                   [--secrets SECRETS] [--version]

optional arguments:
  -h, --help            show this help message and exit
  --config CONFIG       Configuration (YAML) to load
  --outputdir OUTPUTDIR
                        Define path to save configs.
  --secrets SECRETS     Path to secrets
  --version             show program's version number and exit
```

## Showing Version

```bash
python -m terraform_builder --version
...
terraform_builder 0.1.0
```

## Execution

To execute Terraform Builder simply provide the `--config`, `--secrets`, and
`--outputdir` arguments.

```bash
python -m terraform_builder --config examples/configs.yml --outputdir examples/example_builds
...
Initializing modules...

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.azurerm: version = "~> 2.2"
* provider.digitalocean: version = "~> 1.15"
* provider.vsphere: version = "~> 1.17"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

Success! The configuration is valid.
```
