# kernel

an attempt at making a kernel

## architecture

* `/boot` : routines to enter long mode
* `/init` : initialization calls
* `/kio` : kernel-level logging
* `/mem` : memory map and management
* `/build` : build artifacts

## development
The kernel can only easily be built on linux (tested on `debian stretch`)

1) need grub
	* booting straight to a 64 bit binary (with 32 bit scafolding, see `kernel.asm`) **requires multiboot2**
		* otherwise, a small 32 bit kernel must be used to load the real 64 bit one
	* multiboot2 not supported by qemu with `-kernel` option -> must use and iso built by **grub-mkrescue**
		* might change in the future
	* grub-mkrescue requires the grub bootloader be installed

2) compiling
	* I could not (in reasonable time to start the project) properly cross compile `elf`s on `macos`

## references
* https://os.phil-opp.com/multiboot-kernel/
* https://arjunsreedharan.org/post/82710718100/kernel-101-lets-write-a-kernel

## todo
~* docker image of build envirionment~ (not necessarily useful, see [above](#development))