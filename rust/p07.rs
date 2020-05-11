use std::env;

fn is_prime(n: i64) -> bool {
    if n == 1 {
        return false;
    }else if n < 4 {
        return true;
    }else if n % 2 == 0 {
        return false;
    }else if n < 9 {
        return true;
    }else if n % 3 == 0 {
        return false;
    }else{
        let r: i64 = (n as f64).sqrt().floor() as i64 + 1;
        let mut f: i64 = 5;
        while f <= r {
            if n % f == 0{
                return false;
            }else if n % (f + 2) == 0 {
                return false;
            }
            f += 6;
        }
    }
    return true;
}

fn main(){
    let mut limit: i64 = 10001;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        limit = args[1].parse().unwrap();
    }
    let mut count: i64 = 1;
    let mut val: i64 = 1;
    while count < limit {
        val += 2;
        if is_prime(val) == true {
            count += 1;
        }
    }
    println!("{}", val);
}
