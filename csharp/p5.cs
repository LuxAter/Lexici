using System;

class P5{
  static void Main(string[] args){
    int k = 20;
    if(args.Length >= 1){
      k = int.Parse(args[0]);
    }
    int multiple = 1;
    int i = 0;
    bool check = true;
    int limit = (int)Math.Sqrt(k);
    int[] a = new int[50];
    int[] p = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 };
    while (p[i] <= k){
      a[i] = 1;
      if(check) {
        if(p[i] <= limit){
          a[i] = (int)Math.Floor(Math.Log(k) / Math.Log(p[i]));
        }else{
          check = false;
        }
      }
      multiple *= (int)Math.Pow(p[i], a[i]);
      i++;
    }
    Console.Write("{0}\n", multiple);
  }
}
