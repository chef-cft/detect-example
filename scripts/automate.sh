#!/bin/bash

if [[ ! -f /secrets/automate.license ]]; then
  echo "You must provide an Automate license file in secrets/automate.license"
  exit 1
fi

if [[ ! -f /secrets/automate.pem ]]; then 
  ssh-keygen -t rsa -f /secrets/automate.pem -b 2048 -P ""
fi 

if [[ ! -f /tmp/automate.rpm ]]; then 
  wget -q "https://packages.chef.io/files/stable/automate/1.8.3/el/7/automate-1.8.3-1.el7.x86_64.rpm"  -O /tmp/automate.rpm
  rpm -U /tmp/automate.rpm
  automate-ctl setup \
    --license /secrets/automate.license \
    --fqdn automate.local \
    --server-url https://chef.local/organizations/example  \
    --key /secrets/automate.pem  \
    --enterprise example \
    --no-build-node \
    --configure > /root/automate_login
fi 

[[ -f /secrets/automate_login ]] && tail -n4 /secrets/automate_login
