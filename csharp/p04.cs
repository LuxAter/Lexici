class P4{
  static int ReverseInteger(int val){
    int reversed = 0;
    while (val > 0){
      reversed = (10 * reversed) + (val % 10);
      val = val / 10;
    }
    return reversed;
  }
  static bool IsPalindrome(int n){
    return n == ReverseInteger(n);
  }
  static void Main(string[] args){
    int count = 3;
    if (args.Length >= 1){
      count = int.Parse(args[0]);
    }
    int tmp = count;
    int max = 0;
    while (tmp > 0){
      max = (max * 10) + 9;
      tmp--;
    }
    int a = max;
    int largest = 0;
    while (a >= (10 * count)){
      int b = 0;
      int db = 0;
      if (a % 11 == 0){
        b = max;
        db = 1;
      }else{
        b = 11 * (int)(max / 11);
        db = 11;
      }
      while(b >= a){
        if (a * b <= largest){
          break;
        }else if(IsPalindrome(a * b)){
          largest = a * b;
        }
        b -= db;
      }
      a--;
    }
    System.Console.Write("{0}\n", largest);
  }
}
