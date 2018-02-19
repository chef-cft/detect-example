#!/bin/bash

rpm -U --quiet https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm >/dev/null
yum install -y -q puppet-agent

/opt/puppetlabs/bin/puppet apply /puppet/chef-compliance.pp