func ReverseInteger(val: Int) -> Int {
  var reversed:Int = 0
  var n:Int = val
  while n > 0 {
    reversed = (10 * reversed) + ( n % 10 )
    n = n / 10
  }
  return reversed
}

func IsPalindrome(n: Int) -> Bool {
  return n == ReverseInteger(val: n)
}

var count:Int = 3
if CommandLine.argc > 1 {
  count = Int(CommandLine.arguments[1])!
}
var tmp:Int = count
var max:Int = 0
while tmp > 0 {
  max = (max * 10) + 9
  tmp -= 1
}
var a:Int = max
var largest:Int = 0
while a >= (10 * count) {
  var b:Int = 0
  var db:Int = 0
  if a % 11 == 0 {
    b = max
    db = 1
  }else{
    b = 11 * (max / 11)
    db = 11
  }
  while b >= a {
    if (a * b) <= largest {
      break
    }else if IsPalindrome(n: a * b) {
      largest = a * b
    }
    b -= db
  }
  a -= 1
}
print("Largest palindrome multiples of ", count, " digits: ", largest, separator: "")
/* var n:Int? = 600851475143 */
/* var max:Int = n! */
/* if CommandLine.argc > 1 { */
/* n = Int(CommandLine.arguments[1]) */
/* max = n! */
/* } */
/* var last_factor:Int = 1 */
/* if n! % 2 == 0 { */
/* last_factor = 2 */
/* n = n! / 2 */
/* while n! % 2 == 0 { */
/* n = n! / 2 */
/* } */
/* } */
/* var factor:Int = 3 */
/* var max_factor:Int = Int(Double(n!).squareRoot()) */
/* while n! > 1 && factor <= max_factor { */
/* if n! % factor == 0 { */
/* last_factor = factor */
/* n = n! / factor */
/* while n! % factor == 0 { */
/* n = n! / factor */
/* } */
/* max_factor = Int(Double(n!).squareRoot()) */
/* } */
/* factor = factor + 1 */
/* } */

/* if n! != 1 { */
/* last_factor = n! */
/* } */

/* print("The greatest prime factor of ", max, ": ", last_factor, separator: "") */
