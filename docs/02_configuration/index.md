# Configuration Constructs

## Configs

Configurations are defined in YAML, and must follow a specific format. By doing
this, we can ensure that we have consistency in our Terraform configurations. We
use `configs.yml` but the filename can be anything you wish. However, the
content must be consistent.

## Secrets

Secrets are also defined in YAML, but are meant to be completely separate from
configs to ensure they are indeed kept secret. We use `secrets.yml`, but once
again, this can be anything you wish. Anything placed in `secrets.yml` will be
created in the parent root folder as `terraform.tfvars.json`.

## Backends

We can configure different Terraform backends to use for our Terraform state.
Initially this functionality is limited to the default `local` and `Consul`.
`Consul` support is limited and under development now. But you can use it for
testing purposes until fully implemented.

## Environments

Environments ensure that we account for each of: `development`, `production`,
and `staging`. One major premise behind Terraform Builder is that environments
are not an afterthought. Therefore, they are accounted for from the very beginning.
Variable definitions can be specified differently for each environment
as applicable as well.

## Modules

Another major premise behind Terraform Builder is leveraging modules from the
very beginning as well. We define our modules as desired, and they are
automatically stitched together with our environments. As in environments,
variable definitions can be specified differently between modules. The only
required module is root. The root module is where all resources will be added
if no other modules are defined. As mentioned before, in Terraform Builder, the
root module hangs off of our parent root (project root).

## Providers

Providers is where all of our Terrarom provider constructs are defined. The
data model used for providers follows as closely to the native way of constructing
objects as possible. This means that for example, you need to spin up a VM
using the vSphere provider. The data model to get to the VM defintion, follows
the order of parent objects required to do so.

## Resources

Resources are where we can defined things such as VMs, resource groups, etc. For
example, VMs are defined in an agnostic way in which you can cut/paste VM resources
between providers. When doing this, the backend configurations are handled for
us to translate to the specific provider. Therefore, minimizing the level of
effort to port a VM. This is extremely poweful, and will likely transpire into
other resource portability such as firewalls, load balancers, etc.
