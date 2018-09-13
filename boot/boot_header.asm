; multiboot 1  header
; reference:
; https://www.gnu.org/software/grub/manual/multiboot/multiboot.html#Header-layout
section .multiboot2_header
header_start:
	dd 0xe85250d6			; magic number for mb1
	dd 0				; arch 0 protected mode
	dd header_end - header_start	; header lenth
	; checksum
	dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

	; optional tags here

	; end tags
	dw 0	; type
	dw 0	; flags
	dw 8	; size 
header_end:
