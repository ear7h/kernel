include ../toolchain.mk

OBJECTS := boot_header.o \
	kernel_long.o \
	kernel.o

.PHONY: all
all: $(OBJECTS)



%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<