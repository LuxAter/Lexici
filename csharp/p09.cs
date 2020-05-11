using System;

class P9{
  static void Main(string[] args){
    uint sum = 1000;
    if(args.Length >= 1){
      sum = uint.Parse(args[0]);
    }
    uint prod = 0;
    for(uint a = 3; a < (sum-3)/3 && prod==0; ++a){
      for(uint b = (a+1); b<(sum-1-a)/2 && prod == 0; ++b){
        uint c = sum-a-b;
        if(c*c == a*a+b*b){
          prod = a*b*c;
        }
      }
    }
    Console.Write("{0}\n", prod);
  }
}
