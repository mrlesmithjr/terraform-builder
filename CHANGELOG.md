commit f165fce874604dcc4dda1b36f53f8305c335fe5a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon May 4 21:33:06 2020 -0400

    Added initial datastore selection for vSphere
    
    This functionality will definitely expand in the future. For now, it is
    very simplistic and works.
    
    Resolves #69

commit f5b8c8f01f3a28320665b44acb013532f95ae466
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon May 4 10:16:30 2020 -0400

    Fixed typo in VirtualMachine association

commit 9768a47ecd20e6d556f11e56e0d0d783d8559eea
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun May 3 09:04:08 2020 -0400

    Testing vSphere tagging enhancements
    
    - Multiple tag categories
    - Adding environment tags automatically

commit 43986aab3bdbe782b5b4ef8eb4f6ff759db1cdfb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat May 2 10:39:48 2020 -0400

    Added add'l DigitalOcean variable constructs

commit ef1a9fe5a5623d3cab195d04644cd913f42762a8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri May 1 11:07:59 2020 -0400

    Resolved issues with vSphere tags, etc.
    
    After testing a bit more with vSphere and multiple environments, I've
    ran into a few snags. These changes resolve these issues.
    
    Resolves #66

commit 54dd3bf18e64cd8d27568655edcf3f293455da92
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 7 14:22:32 2020 -0400

    Resolved issue with vars as integers
    
    Resolves #63

commit 4b158b87b23e768ec952aeec7783b99b3593c358
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 7 13:06:28 2020 -0400

    Added lingering changes from docs, etc.

commit 334bb70883b6ef724c7419eb92b70d84baa8b7c0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 7 12:56:42 2020 -0400

    Updated/Added vSphere example along with docs

commit 16dbed9bb29e067af450036442d2bbaedc70874a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Apr 7 12:32:56 2020 -0400

    Added initial vSphere example

commit a8dd3f410b39a9ec26b9d124879fd7f9cb435451
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Apr 5 14:57:26 2020 -0400

    Final additions for this issue - ready for PR
    
    Closes #56

commit 88778735b5c941d5a774d77743cbc2c7b8732489
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Apr 5 13:48:57 2020 -0400

    Added azurerm linux vm resource, ssh keys, public ip
    
    These changes have converted from azurerm_virtual_machine to
    azurerm_linux_virtual_machine. Added SSH key and public IPs. Will need
    to address Windows virtual machines later.

commit 3d14bb46cc29547df9dd1608f4f0beb131afa330
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Apr 5 00:18:37 2020 -0400

    Added Public IP functionality
    
    Need to test

commit 567b7186aee4ae28bb5b2739caac48d4538639b6
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 18:30:02 2020 -0400

    Tweaked AzureRM VM sizing
    
    May need to look at alternatives

commit 97b34a5d73576b29ea3765c9062bf53c1c6deef3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 10:34:39 2020 -0400

    Now able to pass variables between modules/environments
    
    For the first time we are able to pass variables between
    modules/environments correctly. This also includes variables defined as
    secrets!
    
    Resolves #54

commit 9fee9e15fb31ef13ce228f10bdac8abe01113377
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:29:17 2020 -0400

    Updated example build based on changes made
    
    The example build has been updated to reflect the changes made in this
    PR.
    
    Resolves #52

commit f1c6393e92931689e3873996b51a2f001d6f053b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:25:39 2020 -0400

    Variables for environments have been removed
    
    This reflects that change for the example

commit 8f175d564f7182d8a2a62fca99e3c6855c322cde
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:24:29 2020 -0400

    Added specific variables just for root module
    
    Root module is different then other variables. So, it made sense to split this out

commit b9e25d18e9f226afe82d6fa119b1875adaba312f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:23:39 2020 -0400

    Removed environment vars template
    
    - We do not need to defined variables in variables.tf for environments
    - They are defined in the module config now

commit 2e423a4800cc192f0f16ab969437a773bb199ccd
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:19:38 2020 -0400

    Changed environment vars format to look for default
    
    Becase we now define the environment vars as dictionaries, this needed changed.

commit f99728b42bb5464bbe609bb84f0751373ee5733c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:18:13 2020 -0400

    Changed images to be defined outside of variables
    
    This didn't make sense in the format we are going towards now.

commit ac05f22b5a34a975bea4abef436bf82782b10b48
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:17:09 2020 -0400

    Changed way to define module vars
    
    Because we are not adding just a var with a single value now.
    We need to capture the values as a dictionary

commit bf3de7cde4942d8ac3e199882668813f85009ac5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Apr 4 01:14:47 2020 -0400

    Removed environment as it isn't needed here

commit 16bb31f10edf969862a2465e9352d86deb6e70ed
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 3 14:18:22 2020 -0400

    Resolved issue with incrementing static IP assignments
    
    This resolves the vSphere VM incrementing static IP assignments issue
    when defining multiple VM sets. This method will eventually make its way
    into the other providers as needed. So, this will likely be tweaked
    again at that time.
    
    Resolves #50

commit 698eef45cdd23f3e598517535759cb00243c72ff
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 3 11:52:06 2020 -0400

    Fixed vSphere template OS parameter
    
    This resolves the issue where a VM from template obtains it's
    appropriate template options for Linux and Windows.
    
    Resolves #48

commit fd398664fd4ec98e4ee33f83e0ee8333f689a122
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 3 11:08:42 2020 -0400

    Updated example after environment indexing issues
    
    These are the example configurations after making changes to address
    environment index for vSphere.

commit 6fb0da48ba4b6c5182002e8c42de6cd59f34e807
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 3 11:06:38 2020 -0400

    These changes are the start of fixing environment index
    
    This is the initial fix to ensure vSphere static IP addressing is
    correct between environments, etc.

commit 86a981ca2b19a3fd7c929c8d344eb771060d9ec0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Apr 3 08:56:21 2020 -0400

    Added environment index variable
    
    This variable will be added automatically on the backend configurations.
    This will be something that we can tap into using between each
    environment: development, production, and staging. For example, static
    IP addresses could be defined by cidrhost("10.0.0.0/16", count.index +
    var.environment_index). This might need to be tweaked a bit as more
    testing occurs.

commit dc4ed34e4554ac600a238502787f621d1802c194
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Apr 2 12:30:10 2020 -0400

    First commit of more useful docs
    
    Closes #38

commit dbcaf3888256313ed8bc6dd0744b5d22e6ae6be6
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 1 17:25:28 2020 -0400

    Updated examples to show var usage for vSphere in environments
    
    Example updated to demonstrate how to define vSphere vars differently
    between environments.

commit 393a2abc2ab5f2a11d22b6c881b3bfbf39d7dfa9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 1 15:42:03 2020 -0400

    First commit to address vSphere issues
    
    This is to address #41

commit fbbbd1acff91563da05be2dbb4139a6bdf09908a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 1 09:25:09 2020 -0400

    Urgent fix for project .gitignore
    
    Just ran into an issue where existing Terraform state for a project caused dup environment

commit 5660382119a735a1f1aacd51aa5b2efd0cc78e46
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 1 09:01:07 2020 -0400

    Implemented fix for Python 3.6 subprocess.run
    
    capture_ouput was introduced in Python 3.7. So, versions prior to this are broke.
    
    Resolves #39

commit 380e63e5c6db809475d486a6cbdc1d046dbfec46
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 1 09:01:07 2020 -0400

    Implemented fix for Python 3.6 subprocess.run
    
    capture_ouput was introduced in Python 3.7. So, versions prior to this are broke.
    
    Resolves #39

commit 6992729ba243e86457f11437bbf5e5fcb0cd461d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Apr 1 01:04:29 2020 -0400

    Added functionality to add DigitalOcean domains, records to parent root
    
    These changes allow DigitalOcean resources to be create in the project
    root and outside of the environments modules.
    
    Closes #36

commit b3406671ab709116c33d0b65de5dad4ab89ff4c5
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 30 22:59:07 2020 -0400

    A lot of DigitalOcean enhancements here
    
    This PR will:
    - Closes #32
    - Closes #33
    - Closes #34
    
    There are a lot of DigitalOcean enhancements here. Including:
    - Domains managed when defining in modules[module]['do_domain']
    - Internal domain "internal.modules[module]['do_domain'] added for
      internal communications
    - Internal DNS A record for VMs when private_networking: true
    - Firewall rules now named with module name appended to get around
      duplicated rule names when multiple modules consume the firewall
    - Droplet names now have environment and domain appended to create a
      FQDN name for VM
    - Tag added to droplets for environment by default

commit 098f646c787e448ba7258d0b778ab06a5bc1c754
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 29 23:57:15 2020 -0400

    Fixed DigitalOcean tags
    
    DigitalOcean tags are now appropriately added across modules. For every
    tag defined, a respective tag will be created for each environment. And
    then for each droplet, etc. which can have tags applied will also have a
    tag added for the environment as well. This will allow tagging to not
    only work for just the defined tag, but also for the tag-environment as
    well.
    
    Closes #30

commit 675de588c46261c623e7076f4bda5404838e6ac1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 29 22:29:58 2020 -0400

    Moved VMs from underneath projects
    
    Because DigitalOcean does not require anything to be in place to start
    creating VMs, we have moved VMs out to their own structure under
    resources. This also affected how firewalls, etc. are applied to VMs.
    So, some additional tweaks were required to accomplish this.
    
    There is still an issue with tags between modules if a VM moves. Will
    address this in another issue.
    
    Closes #27

commit 0e0a0878064ff61418bec20208c57eef8b91b22e
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 29 13:25:58 2020 -0400

    Added initial DigitalOcean firewall support
    
    This is just the beginning portion. Will add more functionality later
    Closes #26

commit 50ce6acab86154d5a530afa6dfc97bcbdc208cc9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 28 23:13:43 2020 -0400

    Tweaked vSphere networks, etc.
    
    vSphere networking was only working if a vSwitch and portgroup were
    created. Consuming existing networks did not work. This has been added
    and needs a bit more testing to ensure most scenarios are validated
    based on current functionality.
    
    Closes #24

commit 8878330fb5beca01be2b9ea009d13c78edefb6cc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 28 17:42:33 2020 -0400

    Changed modules to include environment as part of their name
    
    This will ensure that there is not any confusion over which environment.
    We also still include the environment var as part of the module.
    But this will ensure we follow best practices.

commit 15fe83284dcef730ea01caddef2f26c9985ea386
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 28 17:42:33 2020 -0400

    Changed modules to include environment as part of their name
    
    This will ensure that there is not any confusion over which environment.
    We also still include the environment var as part of the module.
    But this will ensure we follow best practices.

commit d0e7d90e457b3094e3ec5f19376247ed7922c4fc
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 28 16:31:22 2020 -0400

    Changed variables format, function
    
    Now able to pull vars in from evironments, modules, providers, etc.

commit 9b8cb448f65124f375289f23e9f4ca1687497d55
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 17:43:52 2020 -0400

    Forgot to update mapping, etc. to include root

commit 349ca21a55b118d65720068f46cbd60b17af3a3f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 17:34:54 2020 -0400

    This is the final commit to address restructuring root
    
    The root module has been restructured in a way that it can now be
    consumed from environments properly.
    
    Closes #20

commit 8ba405cf526db9f82e6130a1a3cc832177fc8586
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 17:30:16 2020 -0400

    New example build added with new structure
    
    The new structure has been implemented. Therefore, the example build
    needs to reflect this new structure.

commit 4e84bfcd776615dd9901d2bac68cf228187aba67
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 17:27:59 2020 -0400

    Deleted previous example build
    
    The structure has changed. Therefore, we must ensure consistency going
    forward.

commit b518b9b233e1feed731afc1219ad113483d4875d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 17:26:34 2020 -0400

    Moved resources into modules
    
    Resources will likely always exist in a module. Whether that is root or
    other modules defined.

commit 7c96961f2a21bf4aa59accc06eb0092837e4a6e0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 16:51:09 2020 -0400

    Reorganized environments templates
    
    This should minimize and bring clarity to the logic in the Jinja2
    template structure.
    
    Next up is modules

commit ecf2f7e2001ec084678e9482f3219b48f14efa21
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 16:26:44 2020 -0400

    Changed parent root structure
    
    Next will be environments

commit 76e4167eeca6c387ba7cd7f76be00c68cccf8971
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 15:25:45 2020 -0400

    First phase of moving root module
    
    This semi works, but the template structure needs to be changed to be more clear

commit 7f391edde85dcb024461594d3e0271f811a805de
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 27 00:11:46 2020 -0400

    Added initial Consul remote support
    
    The support for Consul is limited at this time. I've personally only
    tested this locally. Therefore, full functionality is not enabled.
    
    Closes #18

commit 73ca2a4d4dad9ba0d23b6d136dfbf0b06d759648
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 26 21:58:55 2020 -0400

    Cleaned up required ver, etc.
    
    Added local backed config to define tfstate file

commit bfdbfbbb621afcb1ef1c99700d89bc7dba752e87
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 26 21:07:05 2020 -0400

    Moved provider templates into resources
    
    Trying to get the structure sorted out a bit more.

commit 8463a51acf21e78dbebbeefa7aced05508f60a29
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 26 20:02:01 2020 -0400

    Split out Jinja2 templates into modules
    
    By doing this will make it easier to add additional modules going
    forward. This will also allow troubleshooting, etc. going forward to be
    a bit more clear.

commit f439e3eaa42f1348990c0c69c3cddd03a8275d0f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 25 14:24:01 2020 -0400

    Forgot AzureRM demo

commit 15837b26375ab7aebdd23c2003df22a8f9639b8b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 25 14:18:14 2020 -0400

    Initial commit for bringing DigitalOcean up to other providers
    
    This commit brings DigitalOCean provider up to the other providers
    format. Such as: AzureRM and vSphere. There will likely be more
    functionality coming soon, but for now....
    
    Closes #9

commit e1d7338223364fcaf90279f9404f429f1e49f3ab
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 25 01:24:07 2020 -0400

    Forgot to add these for issue #12

commit b2038778502c39e3f7196c02745ff4ec92cabbe9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 25 01:16:11 2020 -0400

    These changes address add'l required vars for AzureRM
    
    Running through tests uncovered these missing
    
    Resolves #12

commit dd496a442b0feabd802a5a5daf029df7ad418da0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 25 01:14:20 2020 -0400

    These changes address secrets not in proper JSON format
    
    Created a Jinja2 file to_json to properly format to JSON the secrets

commit 22aa07a64c6688410b315b41a62a43d950ec2c54
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 25 01:12:47 2020 -0400

    Various vars missing for AzureRM and environment
    
    These changes resolve the initial vars missing to provision into environments using modules

commit a224eb5a3e7ffadb1686fd5aafc3f6e9362f1428
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Mar 24 19:45:00 2020 -0400

    Added log rotating

commit 6de71303bda15a51d1de8fe518aac164e5e753ab
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Mar 24 19:29:15 2020 -0400

    Added vSphere template support
    
    Can now define a VM with template to clone from
    Closes #10

commit 827f9af8dc250085648ccc3e705f4ffdc6b1c029
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Mar 24 17:33:51 2020 -0400

    Updated AzureRM resources format
    
    These changes align AzureRM current state to vSphere resources
    structure. Add'l functionality will come over time.
    
    Closes #6

commit b26e9d3875c9dce27084727cd7a5402ea609d409
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Mar 24 11:48:44 2020 -0400

    Changed vsphere_host username/password to vars
    
    This ensures that we do not contain username/password in configs.yml.
    
    Closes #4

commit 7d65d405afa801b36aa6e1114ab9ea4b89c093f7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Mar 24 11:34:57 2020 -0400

    Updated vSphere constructs
    
    Now that things are becoming more defined in configs.yml. We can now
    define things underneath the vSphere provider. Such as: dcs, clusters,
    hosts, host virtual switches/pgs, vms, tags, etc. We are moving away
    from using Terraform vars where needed because we want Terraform Builder
    to handle the configuration lifecycle.
    
    The changes here address the initial stages of vSphere.
    
    Closes #2

commit 305ad529e747cac9b51f7f06b003641cf483b0d1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Tue Mar 24 00:24:11 2020 -0400

    Final AzureRM virtual machine functionality
    
    All initial requirements to provision an AzureRM virtual machine are
    completed for now. Will need some additional testing as I am sure there
    are some things that need to be addressed. Various things are bubbling
    up from provider vars to resources, etc. This will allow for easier
    configurations to be built without relying so much on provider vars.
    This will likely change quite a bit over time.

commit cb1baf99ce4ff83bd9daf02ea8aaa2cab1d3c0f3
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 23 17:18:29 2020 -0400

    Initial support of creating/consuming AzureRM resource groups

commit 9fb9754a6705c4f7e94ed9d14435925f3c18635c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 23 16:12:58 2020 -0400

    Initial AzureRM virtual machine resources
    
    Because of the many additional resources required to properly configure
    a vm. We will need to evaluate these constructs to abstract them the
    most effective way across providers.
    
    The following are required for an AzureRM virtual machine:
    - azurerm_resource_group
    - azurerm_virtual_network
    - azurerm_subnet
    - azurerm_network_interface
    
    vSphere will also require more abstraction based on what we find with
    AzureRM resources.

commit 51ac7e3d913567a129fdd20ccd75a8884b0f18e6
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Mon Mar 23 10:29:09 2020 -0400

    Reorganized resources
    
    Resources are now defined within a provider. If resources need to be
    changed to a different provider, simply move those resources under the
    new provider. Everything will update appropriately to the new provider.
    This change SHOULD make things easier to move around, including the
    logic to do so.

commit 64ba65d34f7d8dc2c5a062e66b3e5b5a93cb2196
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 21:56:43 2020 -0400

    Added initial domain resources
    
    - Will be pausing here for a bit until some additional parsers are built

commit 9ece73223b98abb924fdf8ec0bd2cd77adaf121b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 20:56:56 2020 -0400

    Added initial default config for local backend

commit 0e556ec54a34be29ede91800cd727320fe0e0e29
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 18:06:19 2020 -0400

    Added doc info on requirements

commit 0fcb1b9cb7e2ca9039eb8252e232e5a3b7da2e0c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 18:05:36 2020 -0400

    Added check for graphviz dot command

commit 36625604ef912244f94136405bb3aac055cb5e6c
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 17:45:02 2020 -0400

    Fixed link to graph

commit c6d74d529b4a1e2c21c27770d7c77bb8830ed104
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 17:42:10 2020 -0400

    Added graphviz to consume terraform graph
    
    Using terraform graph, we can capture the output
    Using the output, pipe it through graphviz to save image to project README

commit 0e841d6753a49b10b17148a2320e6942aebea52f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 21 01:33:34 2020 -0400

    Updated: changelog

commit 8e65d955d6972e0ba8a2a04fe62f197471e9ad6d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 21 01:33:15 2020 -0400

    Added mkdocs to dev requirements
    
    Using mkdocs to generate docs

commit b07cffb927c281cccbe44f3f1523d75e6dee601f
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 21 01:32:05 2020 -0400

    Added environment var to append first 4 chars to VM names

commit b1eb3a0b12f1233eafcfb3ca07fff2e3e9bacbc2
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 21 01:30:41 2020 -0400

    Added var for environment to use for resources, etc.

commit 1512f919d4054b5cd0bc6a30db59344564f82cb7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 21 00:04:35 2020 -0400

    Added info on using secrets.yml

commit 95d1aedd97bbaba6cbf55317fc8a20b74df364f0
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sat Mar 21 00:00:43 2020 -0400

    Added examples to secrets.yml

commit 92c602562fc5627eb8746f5f2801bed506c1abb8
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 23:51:39 2020 -0400

    Added initial secrets functionality

commit 6507cef8aa49fdbc4e961974d1c2428867670146
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 23:50:18 2020 -0400

    Added check to ensure provider is defined
    
    If resources were configured to use a provider that was not defined caused a failure

commit 00d3d9698c66ade24c421956cc5ab7839c7b07ff
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 22:26:30 2020 -0400

    Added info on doc generation

commit 94f7bf38a6ae530d675d188e0ceb476e9053f946
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 22:20:19 2020 -0400

    Reorganizing documentation and more content

commit 750f7e8348e4bb5737e9e8600e0046887c689fbe
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 21:27:55 2020 -0400

    Updated docs with some usage info

commit e209bea9b0e35e244afc321a453d7c404322f7ce
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 20:14:34 2020 -0400

    Updated docs, etc.
    
    Added info to read documentation

commit 3b5abe4bae64352a21c6c0a15b119f3691e5f024
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 19:09:27 2020 -0400

    Added missing resources from root README

commit c3638a956a6857deba8b4232276f4a8262802995
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 19:01:08 2020 -0400

    Testing with vms in different modules and configs

commit 6b67cf1ba31ddacfaa14854f326aaa439f9dfd62
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 18:56:39 2020 -0400

    Added initial logic to support modules other than root

commit 292438916ed4630a48b44c2a7d632731e417b8a7
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 17:04:12 2020 -0400

    Added missing tags for vms

commit aa2d86a2142bd4c094aa2437b8fe7d0b27f22fed
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 16:37:38 2020 -0400

    Updated changelog

commit 8240c6c4024544069ec641a65660ba854b782104
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 16:37:28 2020 -0400

    environments were in wrong place for project structure

commit 260e5ad5745e417620277be734deea22757806fa
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 16:36:58 2020 -0400

    Examples cleaned up after using var.var_name

commit fcdd1dab21b2a8e4ce3105162428c7c11bd22977
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 16:36:09 2020 -0400

    Cleaned up to use more var.variable_name for flexibility

commit de8531b817c7df78a5ecdaee68bf77492d4b2676
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 16:35:20 2020 -0400

    Should have been stderr vs. stdout

commit 38474602822872ec9e782171b2f27cfd0eba9c9d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 13:06:57 2020 -0400

    Fixed representation of project structure

commit b7062355e56fcb4b087d87c0fb935499d177ffbf
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 12:59:12 2020 -0400

    Updated project structure representation

commit a785f023adb4145ea60e5615ae0ac3d9351e4375
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 12:43:49 2020 -0400

    Added initial default configs for modules, etc.

commit aec9a11812455cdab057730372376583972bca05
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 12:29:08 2020 -0400

    Added comment|note about using this builder

commit 318ce201e831662ff37c5e52cd71757e4b221f1b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 12:09:27 2020 -0400

    Init and validate now part of package

commit 117104fe868d91f12d0f37d3fd62e393343f4586
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 12:05:32 2020 -0400

    Fixed linting issues

commit f1e22d8b02d8108f825045c2f4d963b7b682775b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 11:56:51 2020 -0400

    Added Terraform init and validation
    
    Logs output and displays to screen

commit bfeea7b216757dcc9a44b4503d1edee908cceafe
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 10:23:50 2020 -0400

    Added modules to environments

commit 4b43b93bea96210295a357622630492425ccc191
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 09:49:18 2020 -0400

    Changed testing to not use default values w/out args

commit ea1c1b1ed3b056670786711dbe8eebaea9871131
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 09:13:47 2020 -0400

    Renamed AzureRM variables, etc.

commit 44b4a38877e3d030f265e73f281212c1ac790345
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 01:42:21 2020 -0400

    Added Terraform init and validate to CI tests

commit 8771e777d9dcaaeb33ee2df9a13e81ea9445034d
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 01:29:26 2020 -0400

    Added initial vSphere provider and reorganized example config

commit 33e2857957f9f3781f8d09841be8c171c855be25
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 00:42:29 2020 -0400

    Added Initial AzureRM provider

commit 82ca0934cc2c8278f21078d1fd5c511dc0f67172
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 00:16:37 2020 -0400

    Fixed comment for variables not properly on it's own line

commit 6d6255307edcd2f9ab4d32e4dbd6facaa8641df4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 00:14:58 2020 -0400

    Added check to ensure that variable type is not quoted

commit bcdc0c92566ba25eef226e2aedd3b6adc1cf9ed4
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Fri Mar 20 00:08:44 2020 -0400

    Added important files for environments

commit 5863b1bc2aa170b8e3664e53c41d0d2d29f46873
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 23:41:28 2020 -0400

    Added comments to main and variables templates

commit d063d190763b53fe9bdeaa13228c402db635abaa
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 23:30:39 2020 -0400

    Fixing linting issues

commit b2c12f1205ddb61dbe46b9449786eb7621550201
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 23:22:50 2020 -0400

    Initial start of root module configuration

commit 628ab8e3381b12627c59652efdd87e6e376e02da
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 21:25:20 2020 -0400

    Added initial module important files

commit 25cc35d3934b98eb8e518ef376b964c1498841e1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 17:31:07 2020 -0400

    Added cat log for test run and fixed Travis Env

commit 3bbb97638fb10c7ab75167b742739691ff5edeeb
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 17:23:21 2020 -0400

    Trying to fix TFENV install
    
    Access denied trying to create symlink to /usr/local/bin

commit 12a419465f481be3f0c4d67433e37f5b0355a839
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 17:14:31 2020 -0400

    Added tfenv install, etc. for pipelines in prep of testing

commit 1e6b110e6770274b21ea890e98b9285ad856d7e1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 16:54:30 2020 -0400

    Added Python requirements to important files

commit 6903ad5b211cc5bc0db6efd14e959d782074e326
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 16:54:04 2020 -0400

    Added info on using tfenv

commit 9955471331ef83e0afdb7d54d008c02ef21f6307
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 16:44:58 2020 -0400

    Changed link to example project

commit 642c45fc2e0fc5d8388c3a650ea2c6c92b47a8ad
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Thu Mar 19 16:40:37 2020 -0400

    Added initial folder structure and critical files
    
    This is just the beginning of building out an example Terraform project.

commit 8a732d3bb4adf44f2a0680da35341776566989fa
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 23:54:35 2020 -0400

    Fixed linting issues

commit 6de7239ee5919c9f777d4b95dc02c628e5a3f43a
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 23:52:55 2020 -0400

    Added initial secrets loading

commit 07dc1efd13778c323d8ddcd57dd560e0c5586531
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 23:52:25 2020 -0400

    Added initial build functionality
    
    Builds the project directory structure, environments, and modules

commit 72ee794ee4ef108c8652c36aa269206307ffedc1
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 22:23:06 2020 -0400

    Added initial loading and parsing of configs

commit 1f4e8c0f980bfe424b3a94f47e7947c7a5e0c5e9
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 22:21:35 2020 -0400

    Disabled Python 3.5 and 3.6 testing

commit c0d6cfdd8f1584391c023048c05406eef5507e37
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 22:21:06 2020 -0400

    Removed unused module

commit d63b03cdda22bc595f8423626800b5cf8a6d038b
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 17:26:16 2020 -0400

    Added missing return args

commit faf6f34f880e6bb447a15ecd7afc2b6f56e64901
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 17:23:48 2020 -0400

    Updated after tweaking cookiecutter template

commit 3bacc896e18f032c7ffa30c222622c9895a38f58
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 16:52:02 2020 -0400

    Updated after tweaking cookiecutter template

commit f4eb0da58d247789fe40d136d12ac7331589f3ed
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Wed Mar 18 15:43:41 2020 -0400

    first commit
