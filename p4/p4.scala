import scala.util.control.Breaks._

object P4{
  def ReverseInteger(n: Int) : Int = {
    var v:Int = n
    var reversed:Int = 0
    while (v > 0){
      reversed = (10 * reversed) + (v % 10)
      v = v / 10
    }
    return reversed
  }

  def IsPalindrome(n: Int) : Boolean = {
    return n == ReverseInteger(n)
  }

  def main(args: Array[String]){
    var count:Int = 3
    if(args.length >= 1){
    }
    var tmp:Int = count
    var max:Int = 0
    while(tmp > 0){
      max = (max * 10) + 9
      tmp -= 1;
    }
    var a:Int = max;
    var largest:Int = 0
    while(a >= (10 * count)){
      var b:Int = 0
      var db:Int = 0
      if(a % 11 == 0){
        b = max;
        db = 1;
      }else{
        b = 11 * (max / 11);
        db = 11;
      }
      breakable {while(b >= a){
        if(a * b <= largest){
          break;
        }else if(IsPalindrome(a * b)){
          largest = a * b;
        }
        b -= db;
      }
      }
      a -= 1;
    }
    printf("Largest palindrome multiples of %d digits: %d\n", count, largest);
  }
}
