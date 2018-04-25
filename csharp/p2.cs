class P2{
  static void Main(string[] args){
    int limit = 4000000;
    int sum = 0, a = 1, b = 1, c = 2;
    if (args.Length >= 1){
      limit = int.Parse(args[0]);
    }
    while (c < limit){
      sum += c;
      a = b + c;
      b = c + a;
      c = a + b;
    }
    System.Console.Write("{0}\n", sum);
  }
}
