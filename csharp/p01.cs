class P1{
  static int SumDivisible(int n, int max){
    int p = max / n;
    return n * (p * (p+1)) / 2;
  }
  static void Main(string[] args){
    int max = 999;
    if (args.Length >= 1){
      max = int.Parse(args[0]) - 1;
    }
    int sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max);
    System.Console.Write("{0}\n", sum);
  }
}
