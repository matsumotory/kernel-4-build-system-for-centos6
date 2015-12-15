# Kernel {4,3}.x.y build system for CentOS 6

kernel {4,3}.x.y build system for centos 6 created by Vagrant and Itamae

## dependency

- vagrant
- vagrant-persistent-storage
- itamae

You can run setup task below(Vagrant and Ruby/Bundler should be pre-installed, so ask google how):

```
make setup
```

## create build server

- build stable kernel

```
make
```

or 

```
make stable
```

- kernel-4.1.2 or other kernel version

```
make KERNEL_VER=4.1.2
```
```
make KERNEL_VER=3.18.18
```

create rpm into `./build/kernel-{4,3}.x.y`

## confirm the kernel version build completely(2015-07-20)
- 4.2-rc3
- 4.2-rc2
- 4.1.2
- 4.1.1
- 3.18.18
- 3.14.48
- 3.12.44
- 3.10.84

## License
under the MIT License:
- see LICENSE file

