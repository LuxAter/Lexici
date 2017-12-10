#!/home/arden/Applications/swift/usr/bin/swift

func SumDivisible(n: Int, max: Int) -> Int {
  let p = max / n
  return n * (p * (p + 1)) / 2
}

var max:Int? = 999
if CommandLine.argc > 1 {
  max = Int(CommandLine.arguments[1])
  max = max! - 1
}
var sum = SumDivisible(n: 3, max: max!) + SumDivisible(n: 5, max: max!) - SumDivisible(n: 15, max: max!)
print("Sum of the multiples of 3 & 5 less than ", max! + 1, ": ", sum, separator: "")

