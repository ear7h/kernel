PROJECT_DIR := $(shell git rev-parse --show-toplevel)
BIN_DIR := $(PROJECT_DIR)/bin
BUILD_DIR := $(PROJECT_DIR)/build
INCLUDE_DIR := $(PROJECT_DIR)/include
ISO_BOOT_DIR := $(PROJECT_DIR)/iso/boot

CC := gcc
CCFLAGS := -m64 -I$(INCLUDE_DIR)

ASM := nasm
ASMFLAGS := -f elf64

LD := ld
LDFLAGS := -m elf_x86_64

%-asm.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

%-c.o: %.c
	$(CC) $(CCFLAGS) -c -o $@ $<

%.o: %.c
	$(CC) $(CCFLAGS) -c -o $@ $<

bin:
	mkdir -p $(BIN_DIR)

build:
	mkdir -p $(BUILD_DIR)

.PHONY: clean
clean:
	-rm $(PROJECT_DIR)/os.iso
	-rm $(PROJECT_DIR)/kernel
	-rm $(ISO_BOOT_DIR)/kernel
	-rm -rf $(BUILD_DIR)
	-rm -rf $(BIN_DIR)
	-rm -rf *.o

.PHONY: clear
clear:
	clear

.PHONY: fresh
fresh:
	clean clear $(MAKE)
