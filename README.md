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

## confirm the kernel version build completely
- 4.2-rc2
- 4.1.2
- 4.1.1
- 3.18.18
- 3.14.48

## License
under the MIT License:
- see LICENSE file

