proc p(str: string) = 
  let dst = cast[ptr array[high(int), char]](0xb8000)
  for i, ch in str.pairs:
    dst[i] = ch

proc kmain() {.exportc.} =
  p("h\x07e\x07l\x07l\x07o\x07 \x07w\x07o\x07r\x07l\x07d\x07")