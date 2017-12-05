class Sharp
{
    static bool IsPrime(int p){
        if (p == 1){
            return false;
        }else if (p < 4){
            return true;
        }else if (p % 2 == 0){
            return false;
        }else if(p < 9){
            return true;
        }else if(p % 3 == 0){
            return false;
        }else{
            int r = (int)System.Math.Floor(System.Math.Sqrt(p));
            int f = 5;
            while(f <= r){
                if(p % f == 0 || p % (f + 2) == 0){
                    return false;

                }
                f += 6;
            }
        }
        return true;
    }

    static void Main(string[] args)
    {
        int limit = 10001;
        if (args.Length >= 1){
            limit = int.Parse(args[0]);
        }
        int count = 1;
        int val = 1;
        while(count < limit){
            val += 2;
            if(IsPrime(val) == true){
                count++;
            }
        }
        System.Console.Write("{0}\'th Prime: {1}\n", limit, val);
    }
}
