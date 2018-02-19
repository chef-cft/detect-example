package { 'chef-client':
  ensure => installed,
  source => "https://packages.chef.io/files/stable/chef/13.7.16/el/7/chef-13.7.16-1.el7.x86_64.rpm"
}


exec  { 'chef-client': 
  command => '/opt/chef/bin/chef-client -z -c client.rb -o "role[audit]"',
  cwd => '/chef'
}


