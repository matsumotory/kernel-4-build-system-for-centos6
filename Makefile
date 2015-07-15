#
# build kernerl 4.x using vagrant and itamae
#
PWD=$(shell pwd)

KERNEL_VER=4.1.1
BUILD_DIR=$(PWD)/build/linux-$(KERNEL_VER)

all: itamae

itamae: vagrant
	itamae ssh -l debug --vagrant roles/build-kernel-$(KERNEL_VER)-for-centos6.rb 

vagrant:
	vagrant up

clean:
	-rm -rf $(BUILD_DIR)
