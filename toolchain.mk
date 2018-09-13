ASM := nasm
ASMFLAGS := -f elf64

CC := gcc
CCFLAGS := -m64 -I$(INCLUDE_DIR)

LD := ld
LDFLAGS := -m elf_x86_64

# flags are in kernel.nim.cfg
NIM := nim c