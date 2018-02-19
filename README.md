# Overview

Some shops may have existing CM tools in place, but still want to take advantage of Compliance without having to rewrite the world first.  These examples show how you might accomplish that by utilizing exising CM tools to deploy the chef-client and run it in solo-mode.

The existing CM tools will need to provide a few things in order for the chef solo run to work
* client.rb
* cookbooks
  * audit
  * compat_resource
* roles
  * audit.json

The cookbooks can be distributed as a tarball to be downloaded and extracted by existing CM tools

`client.rb` contains the data_collector information in order for the Audit Cookbook to fetch profiles and report. This should be rendered from a template by their CM tooling. 

`roles/audit.json` should also be rendered by their CM tooling.  The file will be largely static, with profiles section being dynamic. 

These three components should be placed in the same directory as Chef solo expects a specific directory structure. 

The CM tooling can now execute chef-client from that directory during its run.

ex: `cd <path-to-repo>;  chef-client -z -o 'role[audit]' -c client.rb` 

## Running the examples

You will need to provide an existing Chef Automate server, or an automate license to use the Automate server in the Vagrant file.

### Set up Automate

#### Existing Automate

* Edit client.rb to change the data_collector.server_url and data_collector.token to reference the existing Automate server.

#### Vagrant Automate

* Place an automate license file in `secrets/automate.license`
* Run `vagrant up automate` 

This will start an Automate and print out the admin login information. If you lose this information, it is saved in `secrets/automate_login`. 

#### Install Profiles

Log in to the automate server, visit the Profile Store under the Compliance tab and install the cis-centos7-level1 profile.

### Puppet

* Run `vagrant up puppet`
* Run `vagrant provision puppet` to gather additional reports

### Ansible

* Run `vagrant up ansible`
* Run `vagrant provision ansible` to gather additional reports
