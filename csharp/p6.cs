using System;

class P6{
  static void Main(string[] args){
    int limit = 100;
    if(args.Length >= 1){
      limit = int.Parse(args[0]);
    }
    int sum = limit * (limit + 1) / 2;
    int sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6;
    int diff = (int)Math.Pow(sum, 2) - sum_sq;
    Console.Write("{0}\n", diff);
  }
}
