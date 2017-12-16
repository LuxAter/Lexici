object P2 {
  def main(args: Array[String]){
    var limit:Int = 4000000
    var sum:Int = 0
    var a:Int = 1
    var b:Int = 1
    var c:Int = 2
    if (args.length >= 1){
    }
    while(c < limit){
      sum += c
      a = b + c
      b = c + a
      c = a + b
    }
    printf("Sum of even fibonacci numbers less than %d: %d", limit, sum)
  }
}
