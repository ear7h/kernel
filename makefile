all: os.iso
	@echo "built"

include standard_defs.mk

OBJECTS = kernel-asm.o kernel-c.o boot_header-asm.o long_mode_init-asm.o
LIBS = kernio

bin/kernel: bin kernel
	mv kernel bin/

os.iso: kernel iso/boot/grub/grub.cfg
	cp kernel iso/boot
	grub-mkrescue -o os.iso iso

kernel: $(OBJECTS) $(LIBS:%=build/lib%.a) link.ld
	$(LD) -n $(LDFLAGS) -T link.ld $(OBJECTS) -Lbuild $(LIBS:%=-l%) -o kernel

build/lib%.a: build
	@echo building libname $(@:build/lib%.a=%)
	$(eval LIB_NAME := $(@:build/lib%.a=%))
	$(MAKE) -C $(LIB_NAME) archive
	mv $(LIB_NAME)/lib$(LIB_NAME).a build/
	$(MAKE) -C $(LIB_NAME) clean

