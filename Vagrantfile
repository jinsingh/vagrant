
# -*- mode: ruby -*-
# vi: set ft=ruby :

require_relative "vagrant_requires.rb"

Vagrant.configure("2") do |config|
  #Global config
  config.vm.box = "centos6.5"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-nocm.box"
  config.vm.synced_folder "..", "/devops"
  config.puppet_install.puppet_version = "3.6.2"

  #vagrant-cachier config
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.provider :virtualbox do |vb|
    vb.auto_nat_dns_proxy = false
    vb.customize ["modifyvm", :id, "--memory", 256, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", 1]
    vb.gui = true
  end

  #vagrant-vbguest config
  config.vbguest.auto_update = true

  #Management server
  config.vm.define "management" do |management|
    management.vm.host_name = 'management.test'
    management.vm.provision :shell, :path => "vagrant.sh"
    management.vm.network "private_network", ip: "172.16.10.2"
    management.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 512, "--ioapic", "on"]
    end
  end

  #Web server
  config.vm.define "web" do |web|
    web.vm.host_name = 'web.test'
    web.vm.provision :shell, :path => "vagrant_web.sh"
    web.vm.network "private_network", ip: "172.16.10.3"
     #vb.customize ["modifyvm", :id, "--memory", 512, "--ioapic", "on"]
    end
  end

