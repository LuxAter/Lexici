object P1 {
  def SumDivisible(n: Int, max:Int) : Int = {
    var p:Int = max / n
    return n * (p * (p +1))/2
  }
  def main(args: Array[String]){
    var max:Int = 999
    var sum:Int = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max)
    printf("Sum of the multiples of 3 & 5 less than %d: %d\n", max + 1, sum)
  }
}
