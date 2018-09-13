include ../toolchain.mk

SOURCES = kmain.c

.PHONY: all
all: $(SOURCES:.c=.o)
	$(AR) $(ARFLAGS) libinit.a $(filter %.o, $(SOURCES:.c=.o))

%.o: %.c
	$(CC) $(CCFLAGS) -c -Wall -Wextra -o $@ $<