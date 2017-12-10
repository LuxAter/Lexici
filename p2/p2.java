public class p2{
  public static void main(String[] args){
    int limit = 4000000;
    int sum = 0, a = 1, b = 1, c = 2;
    if(args.length >= 1){
      limit = Integer.parseInt(args[0]);
    }
    while(c < limit){
      sum += c;
      a = b + c;
      b = c + a;
      c = a + b;
    }
    System.out.printf("Sum of even fibonacci nubers less than %d: %d\n", limit, sum);
  }
}
