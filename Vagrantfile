# -*- mode: ruby -*-
# vi: set ft=ruby :

#
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.4"
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "512"
  end

  config.vm.define "automate" do |config|
    config.vm.box = "bento/centos-7.4"
    config.vm.box_check_update = false
    config.vm.network "private_network", ip: "10.10.10.10"

    config.vm.synced_folder "secrets", "/secrets"

    config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = "4"
    end

    config.vm.provision "shell", path: 'scripts/automate.sh'
  end

  config.vm.define "puppet" do |config|
    config.vm.hostname = "puppet.local"
    config.vm.network "private_network", ip: "10.10.10.11"

    config.vm.synced_folder "puppet", "/puppet"
    config.vm.synced_folder ".", "/chef"

    config.vm.provision "shell", path: "scripts/puppet.sh"
  end

  config.vm.define "ansible" do |config|
    config.vm.hostname = "ansible.local"
    config.vm.network "private_network", ip: "10.10.10.12"

    config.vm.synced_folder "ansible", "/ansible"
    config.vm.synced_folder ".", "/chef"

    config.vm.provision "shell", path: "scripts/ansible.sh"
  end
end
