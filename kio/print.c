#define _vidbuf_addr 0xb8000
#define _cols 80
#define _rows 25
#define _vidbuf_len (_cols * _rows * 2)

char * const _vidbuf = (char *) _vidbuf_addr;
unsigned short _cursor = 0;
unsigned char _attr = (char) 0x07;

void addch(char ch) {
	// log every new char to this location
	_vidbuf[_vidbuf_len - 2] = ch;
	
	switch(ch) {
		case '\n':
			_cursor += 2*_cols - (_cursor % (2 *_cols));
			break;
		default:
			_vidbuf[_cursor++] = ch;
			_vidbuf[_cursor++] = _attr;
	}

	//_cursor = _cursor % _vidbuf_len;
}

void _putchar(char ch) { addch(ch); }

void println(const char * str) {
	for (int i = 0; str[i] != '\0'; i++) {
		addch(str[i]);
	}
	addch('\n');
}

void clear() {
	for(int i = 0; i < _vidbuf_len; i+=2) {
		_vidbuf[i] = (char) 0;
		_vidbuf[i+1] = (char) 0;
	}

	_cursor = 0;
}