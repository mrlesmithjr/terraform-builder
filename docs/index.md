# Terraform Builder

Welcome to Terraform Builder. Terraform builder is based on a similar concept
of [Packer Builder](https://github.com/mrlesmithjr/packer-builder).

> NOTE: This is highly under development and far from fully featured.

## About Terraform Builder

Terraform Builder is completely open-source, and we welcome feedback,
contributions, and recommendations. Start using Terraform Builder now, by
heading over to [https://github.com/mrlesmithjr/terraform-builder](https://github.com/mrlesmithjr/terraform-builder).

## Why Terraform Builder

But, Terraform is simple already right? Of course it is!

So, why do we need Terraform Builder?

Simple! To make generating configurations more consumable.

Terraform Builder also creates a majority of the documentation, etc. for your
project by creating `README.md` files where appropriate and other important
files such as `.gitignore` pre-populated for Terraform usage. Explore the
[example build](https://github.com/mrlesmithjr/terraform-builder/tree/master/examples/example_builds/example) to see the directory structure that is
stamped out for you.

## Problems That Terraform Builder Solves

Removing the complexities of Terraform HCL, etc. Moreover, standardizing
Terraform configurations. By using Terraform Builder, it is easy to add or
remove resources, etc. to ensure consistent functionality.

## Concepts

One of the major concepts of Terraform Builder is, to keep configurations as
agnostic as possible. For example, defining resources should be done in a way
that is not provider specific. By simply setting a variable to the desired
provider, the magic happens on the backend for the translation.

With Terraform Builder, everything is a module. Therefore, all configurations
are based off of this concept. This is not a new concept, as Terraform already
assumes that a single directory of configurations is a module. This module
is the `root` module. So, with the `root` module being the foundation to all
other modules. However, we hang the root module off of the parent root (project root). Therefore the parent root becomes the passthrough module.

The other concept enforced with Terraform Builder is environments. By default,
environments are implemented as modules as well. These environments are:
`development`, `staging`, and `production`. By automatically stitching these
environments together with all other modules, removes the complexity of trying
to do it manually. And at the same time ensuring that, by default we have our
different environments accounted for from the start.

Does any of this mean that Terraform Builder is the right tool for everyone? Absolutely not! However, it will hopefully enable those who may be starting out
new with Terraform to implement best practices as part of their learning. As
well as, their implementations.
