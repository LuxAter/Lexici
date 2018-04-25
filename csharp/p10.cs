using System;

class P10{
  static void Main(string[] args){
    ulong limit = 2000000;
    if (args.Length >= 1){
      limit = ulong.Parse(args[0]);
    }
    ulong cross_limit = (ulong)Math.Floor(Math.Sqrt(limit));
    bool[] sieve = new bool [2000000];
    for(ulong n = 4; n < limit; n += 2){
      sieve[n] = true;
    }
    for (ulong n = 3; n <= cross_limit; n += 2){
      if (!sieve[n]){
        for(ulong m = n*n; m < limit; m+=(2*n)){
          sieve[m] = true;
        }
      }
    }
    ulong sum = 0;
    for(ulong n = 2;n < limit; n++){
      if(!sieve[n]){
        sum += n;
      }
    }
    Console.Write("{0}\n", sum);
  }
}
