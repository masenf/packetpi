# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.ssh.insert_key = false
  config.ssh.private_key_path = '~/.vagrant.d/insecure_private_key'

  config.vm.define 'cimon-ansible' do |machine|
    # debian 11 doesn't have ax25-node package =[
    machine.vm.box = "generic/debian11"
    #machine.vm.box = "generic/debian8"

    machine.vm.network :private_network, ip: '192.168.56.11'
    machine.vm.hostname = 'cimon-ansible.local'
    machine.vm.synced_folder ".", "/ansible"
    machine.vm.synced_folder "/Users/masen/code/python-aprs", "/python-aprs"

    machine.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.extra_vars = 'tests/station.yml'
      ansible.become = true
      ansible.inventory_path = 'tests/inventory'
      ansible.host_key_checking = false
    end
  end
end
