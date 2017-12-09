public class p1{
  public static int SumDivisible(int n, int max){
    int p = max / n;
    return n * (p * (p + 1)) / 2;
  }
  public static void main(String[] args){
    int max = 999;
    if (args.length >= 1){
      max = Integer.parseInt(args[0]) - 1;
    }
    int sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max);
    System.out.printf("Sum of the multiples of 3 & 5 less than %d: %d\n", max + 1, sum);
  }
}
