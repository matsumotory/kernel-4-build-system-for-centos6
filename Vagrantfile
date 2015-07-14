# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos64-x86_64-20140116.box"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
  config.vm.synced_folder ".", "/vagrant"
  #config.vm.provider :virtualbox do |vbox|
  #  vbox.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
  #  vbox.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
  #end
end
