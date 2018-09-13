PROJECT_DIR := $(shell git rev-parse --show-toplevel)

ASM := nasm
ASMFLAGS := -f elf64

CC := gcc
CCFLAGS := -m64 -I$(PROJECT_DIR)

AR := ar
ARFLAGS := rcs

LD := ld
LDFLAGS := -m elf_x86_64
