import kernio/kernio

proc kmain() {.exportc.} =
  kernio.init()

  printch('a')
  echo "hello world" & $9
  var x: array[3, int] = [1, 2, 3]
  for i in 1..3:
     echo $x[i]