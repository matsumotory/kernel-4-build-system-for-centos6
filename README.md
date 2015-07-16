# Kernel {4,3}.x.y build system for CentOS 6

kernel {4,3}.x.y build system for centos 6 created by Vagrant and Itamae

## dependency

- vagrant
- vagrant-persistent-storage
- itamae

## create build server

- kernel-4.1.1

```
make
```

- kernel-4.1.2 or other kernel version

```
make KERNEL_VER=4.1.2
```
```
make KERNEL_VER=3.18.18
```

create rpm into `./build/kernel-{4,3}.x.y`

## License
under the MIT License:
- see LICENSE file

