include toolchain.mk

NIM_SOURCES := $(shell find *.nim)

# common dirs
build:
	mkdir -p build

all: os.iso
	@echo "built"

bin/kernel: bin kernel
	mv kernel bin/

os.iso: kernel iso/boot/grub/grub.cfg
	cp kernel iso/boot
	grub-mkrescue -o os.iso iso

kernel: libkernel boot_routines link.ld
	$(LD) -n $(LDFLAGS) -T link.ld ./build/*.o -Lbuild -lkernel -o kernel 

.PHONY: boot_routines
boot_routines: build
	$(MAKE) -C ./boot all
	mv ./boot/*.o build

.PHONY: libkernel
libkernel: libkernel.a
	mv libkernel.a build

libkernel.a: $(NIM_SOURCES)
	$(NIM) --app:staticlib kernel.nim