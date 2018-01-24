public class p4{
  public static int ReverseInteger(int val){
    int reversed = 0;
    while (val > 0){
      reversed = (10 * reversed) + (val % 10);
      val = val / 10;
    }
    return reversed;
  }
  public static boolean IsPalindrome(int n){
    return n == ReverseInteger(n);
  }
  public static void main(String[] args){
    int count = 3;
    if(args.length >= 1){
      count = Integer.parseInt(args[0]);
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
        db=11;
      }else{
        b=11*(max/11);
        db=11;
      }
      while(b>=1){
        if(a*b <= largest){
          break;
        }else if(IsPalindrome(a*b)){
          largest = a*b;
        }
        b-=db;
      }
      a--;
    }
    System.out.printf("Largest palindrome multiples of %d digits: %d\n", count, largest);
  }
}
