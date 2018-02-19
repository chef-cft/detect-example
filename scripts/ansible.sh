#!/bin/bash

yum install -y -q ansible

cat <<EOF > /etc/ansible/hosts 
[local]
localhost ansible_connection=local
EOF


ansible-playbook /ansible/chef-compliance.yml