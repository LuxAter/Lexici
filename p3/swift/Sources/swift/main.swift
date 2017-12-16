var n:Int? = 600851475143
var max:Int = n!
if CommandLine.argc > 1 {
  n = Int(CommandLine.arguments[1])
  max = n!
}
var last_factor:Int = 1
if n! % 2 == 0 {
  last_factor = 2
  n = n! / 2
  while n! % 2 == 0 {
    n = n! / 2
  }
}
var factor:Int = 3
var max_factor:Int = Int(Double(n!).squareRoot())
while n! > 1 && factor <= max_factor {
  if n! % factor == 0 {
    last_factor = factor
    n = n! / factor
    while n! % factor == 0 {
      n = n! / factor
    }
    max_factor = Int(Double(n!).squareRoot())
  }
  factor = factor + 1
}

if n! != 1 {
  last_factor = n!
}

print("The greatest prime factor of ", max, ": ", last_factor, separator: "")
