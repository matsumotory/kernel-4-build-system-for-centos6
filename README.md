# Kernel 4.x.y build system for CentOS6 on Vagrant

kernel 4.x.y build server for centos6 created by Vagrant and Itamae

## create build server
```
cd build-itamae
vagrant up
itamae ssh --vagrant roles/build-kernel-for-cent64.rb
vagrant ssh
ls -l ~/linux-4.1.1
```
