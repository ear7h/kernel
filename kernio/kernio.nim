const
  VID_BUF_ADDR* = 0xb8000
  COLS = 80
  ROWS = 25
  VID_BUF_LEN = 80 * 25



# TODO: this should be changed to
# high(uint) when supported
var vidbuf: ptr array[0..VID_BUF_LEN, char] = cast[ptr array[0..VID_BUF_LEN, char]](VID_BUF_ADDR)
var cursor: int = 0
var attr: char = char(0x07)

proc init*() = 
  vidbuf = cast[ptr array[0..VID_BUF_LEN, char]](VID_BUF_ADDR)
  cursor = 0
  attr = char(0x07)

proc addch*(ch: char) {.inline.} =
  vidbuf[cursor] = ch
  vidbuf[cursor+1] = attr
  cursor = (cursor + 2) %% VID_BUF_LEN

proc println*(str: string) =
  for i in 0..str.len:
    addch(str[i])

proc echo*(str: string) = println(str)



proc printch*(ch: char) =
  var x = cast[ptr array[0..VID_BUF_LEN, char]](VID_BUF_ADDR)
  x[0] = ch
  x[1] = char((VID_BUF_ADDR shl 3) and 0xff)
  #VID_BUF[1] = char(0x07)
# proc offset2xy(off: int): tuple[x, y: int] {.inline.} = 
#   return (off /% COLS, off %% COLS)

# proc xy2offset(x, y: int): int {.inline.} =
#   return y * COLS + x