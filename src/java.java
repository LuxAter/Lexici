
public class java {
    public static boolean IsPrimt(int p){
        if (p == 1){
            return false;
        }else if(p < 4){
            return true;
        }else if(p % 2 == 0){
            return false;
        } else if(p < 9){
            return true;
        }else if(p % 3 == 0){
            return false;
        } else{
            int r = (int)Math.floor(Math.sqrt(p));
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
    public static void main(String[] args){
        int limit = 10001;
        if (args.length >= 1){
            limit = Integer.parseInt(args[0]);
        }
        int count = 1;
        int val = 1;
        while (count < limit){
            val += 2;
            if (IsPrimt(val) == true){
                count++;
            }
        }
        System.out.printf("%d\'th Prime: %d\n", limit, val);
    }
}
