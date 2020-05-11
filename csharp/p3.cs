class P3{
  static void Main(string[] args){
    long n = 600851475143;
    if (args.Length >= 1){
      n = int.Parse(args[0]);
    }
    long last_factor = 1;
    if (n % 2 == 0){
      last_factor = 2;
      n /= 2;
      while(n%2==0){
        n/=2;
      }
    }
    long factor = 3;
    long max_factor = (long)System.Math.Sqrt(n);
    while (n > 1 && factor <= max_factor){
      if (n % factor == 0){
        n /= factor;
        last_factor = factor;
        while(n%factor == 0){
          n /= factor;
        }
        max_factor = (long)System.Math.Sqrt(n);
      }
      factor += 2;
    }
    if(n!=1){
      last_factor = n;
    }
    System.Console.Write("{0}\n", last_factor);
  }
}
