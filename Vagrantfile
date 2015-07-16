# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "centos64-x86_64-20140116.box"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.2/centos64-x86_64-20140116.box"
  config.vm.hostname = "kernel-4-build-system-for-centos6"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048", "--cpus", "2", "--ioapic", "on"]
  end
  # install plugin: `vagrant plugin install vagrant-persistent-storage`
  config.persistent_storage.enabled = true
  config.persistent_storage.location = "./build-space.vdi"
  config.persistent_storage.size = 40000
  config.persistent_storage.mountname = 'build-space'
  config.persistent_storage.filesystem = 'ext4'
  config.persistent_storage.mountpoint = '/home/vagrant/rpmbuild'
  config.persistent_storage.volgroupname = 'build-group'
end
