using System;

class P7{
  static bool IsPrime(int n){
    if (n == 1){
      return false;
    }else if(n < 4){
      return true;
    }else if(n % 2 == 0){
      return false;
    }else if(n < 9){
      return true;
    }else if(n % 3 == 0){
      return false;
    }else{
      int r = (int)Math.Floor(Math.Sqrt(n));
      int f = 5;
      while (f <= r){
        if (n % f == 0){
          return false;
        }else if(n % (f + 2) == 0){
          return false;
        }
        f += 6;
      }
    }
    return true;
  }

  static void Main(string[] args){
    int limit = 10001;
    if(args.Length >= 1){
      limit = int.Parse(args[0]);
    }
    int count = 1;
    int val = 1;
    while(count < limit){
      val += 2;
      if (IsPrime(val)) {
        count++;
      }
    }
    Console.Write("{0}\n", val);
  }
}
