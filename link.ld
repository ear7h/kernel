ENTRY(start)
SECTIONS {
		. = 1M;
		
		.boot :
		{
			*(.multiboot2_header)
		}

		.text : { *(.text) }
		.data : { *(.data) }
		.bss : { *(.bss) }
}
