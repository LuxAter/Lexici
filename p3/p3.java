public class p3{
  public static void main(String[] args){
    long n = 600851475143L;
    long max = n;
    if(args.length >= 1){
      n = Long.parseLong(args[0]);
      max = n;
    }
    long last_factor = 1;
    if(n % 2L == 0){
      last_factor = 2;
      n /= 2;
      while(n % 2L == 0){
        n /= 2;
      }
    }
    long factor = 3;
    long max_factor = (long)Math.sqrt((double)n);
    while( n > 1 && factor <= max_factor ){
      if (n % factor == 0){
        n /= factor;
        last_factor = factor;
        while ( n % factor == 0 ){
          n /= factor;
        }
        max_factor = (long)Math.sqrt((double)n);
      }
      factor += 2;
    }
    if (n != 1){
      last_factor = n;
    }
    System.out.printf("The greatest prime factor of %d: %d\n", max, last_factor);
  }
}
