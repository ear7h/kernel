include toolchain.mk

LIBS := init kio

all: os.iso
	@echo "built"

# common dirs
build:
	mkdir -p build

os.iso: kernel iso/boot/grub/grub.cfg
	cp kernel iso/boot
	grub-mkrescue -o os.iso iso

kernel: $(LIBS:%=build/lib%.a) boot_routines link.ld
	$(LD) -n $(LDFLAGS) -T link.ld ./build/*.o -Lbuild $(LIBS:%=-l%) -o kernel 

.PHONY: boot_routines
boot_routines: build
	$(MAKE) -C ./boot all
	mv ./boot/*.o build

build/lib%.a: build
	$(eval libdir := $(@:build/lib%.a=%))
	@echo building $(libdir)
	$(MAKE) -C $(libdir) all
	mv $(libdir)/*.a build

clean:
	find . -type f -name '*.o' -exec rm {} +
	find . -type f -name '*.a' -exec rm {} +
	rm -f kernel
