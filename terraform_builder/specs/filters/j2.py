"""terraform_builder/specs/filters/j2.py"""

# Jinja2 filters

import yaml


def to_yaml(value):
    """Creates a to_yaml filter for Jinja2"""

    data = yaml.dump(value)
    return data
