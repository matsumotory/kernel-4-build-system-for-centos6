# Kernel 4.x.y build system for CentOS6

kernel 4.x.y build system for centos6 created by Vagrant and Itamae

## dependency

- vagrant
- vagrant-persistent-storage
- itamae

## create build server

- kernel-4.1.1

```
make
```

- kernel-4.1.2

```
make KERNEL_VER=4.1.2
```

build into ./build/kernel-4.x.y
