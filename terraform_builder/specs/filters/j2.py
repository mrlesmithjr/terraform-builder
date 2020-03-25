"""terraform_builder/specs/filters/j2.py"""

# Jinja2 filters

import json
import yaml


def to_json(value):
    """Creates a to_json filter for Jinja2"""

    data = json.dumps(value)
    return data


def to_yaml(value):
    """Creates a to_yaml filter for Jinja2"""

    data = yaml.dump(value)
    return data
