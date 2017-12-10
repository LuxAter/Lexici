var limit:Int? = 4000000
var sum:Int? = 0
var a:Int? = 1
var b:Int? = 1
var c:Int? = 0
if CommandLine.argc > 1 {
  limit = Int(CommandLine.arguments[1])
}
while c! < limit! {
  sum = sum! + c!
  a = b! + c!
  b = c! + a!
  c = a! + b!
}
print("Sum of even fibonacci nubers less than ", limit!, ": ", sum!, separator: "")
