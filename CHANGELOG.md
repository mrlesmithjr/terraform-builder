commit 01bb9197cac1de18e92ca2b12e8cea530de38532
Author: Larry Smith Jr <mrlesmithjr@gmail.com>
Date:   Sun Mar 22 23:50:20 2020 -0400

    This seems like too much work

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
