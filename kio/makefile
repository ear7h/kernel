include ../toolchain.mk

SOURCES = printf.c printf.c print.h print.c

.PHONY: all
all: $(SOURCES:.c=.o)
	$(AR) $(ARFLAGS) libkio.a $(filter %.o, $(SOURCES:.c=.o))

%.o: %.c
	$(CC) $(CCFLAGS) -c -Wall -Wextra -o $@ $<