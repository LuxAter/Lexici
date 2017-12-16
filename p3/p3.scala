object P3{
  def main(args: Array[String]){
    var n:Long = 600851475143L;
    var max:Long = n;
    if(args.length >= 1){
      // n = Long.parseLong(args[0]);
      // max = n;
    }
    var last_factor:Long = 1;
    if(n % 2L == 0){
      last_factor = 2;
      n /= 2;
      while(n % 2L == 0){
        n /= 2;
      }
    }
    var factor:Long = 3;
    var max_factor:Long = (Long)sqrt((Double)n);
    while( n > 1 && factor <= max_factor ){
      if (n % factor == 0){
        n /= factor;
        last_factor = factor;
        while ( n % factor == 0 ){
          n /= factor;
        }
        max_factor = (long)sqrt((double)n);
      }
      factor += 2;
    }
    if (n != 1){
      last_factor = n;
    }
    System.out.printf("The greatest prime factor of %d: %d\n", max, last_factor);
  }
}
