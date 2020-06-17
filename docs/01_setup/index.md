# Setup Guide

## Requirements

There are very few requirements required for Terraform Builder. But to get the
most out of it, follow along.

### Clone Project

First thing to do is, obtain the source for Terraform Builder.

```bash
git clone https://github.com/mrlesmithjr/terraform-builder
```

### Python Packages

> NOTE: We highly recommend that you use a Python virtual environment for this!

There are only a few required Python packages to install. And for that, we have
included a `requirements.txt` in the project in which you just cloned above.
And we can install them by executing:

```bash
pip3 install -r requirements.txt
```

### Terraform Version Manager

Terraform version manager is a tool that I use personally. It assists in easily
managing different Terraform versions for you to use. Rather than installing a
version, and then having to do some random things to switch between versions.
Definitely check it out [here](https://github.com/tfutils/tfenv).

#### Installing Terraform Version Manager

To install Terraform Version Manager execute:

```bash
TFENV_DIR="$HOME/.tfenv"
git clone https://github.com/tfutils/tfenv.git $TFENV_DIR
export PATH="$TFENV_DIR/bin:$PATH"
```

#### Installing Terraform

Now that Terraform Version Manager is installed, we can install Terraform by
executing:

```bash
TERRAFORM_VERSION="0.12.26"
echo $TERRAFORM_VERSION > $HOME/.terraform-version
tfenv install
tfenv list
```

### TFLint

When using Terraform Builder and [TFLint](https://github.com/terraform-linters/tflint)
is installed, we also ensure that the configurations pass Terraform linting.

> NOTE: TFLint is a Terraform linter focused on possible errors, best practices, etc.

To install TFLint head over [here](https://github.com/terraform-linters/tflint#installation)
for the instructions to do so.

### Graphviz

Terraform Builder will generate a Terraform Graph and embed it into your project
`README.md` if Graphviz is installed. So, it is recommended that you install [Graphviz](https://graphviz.gitlab.io/download/) to get a visible graph in your project README.
