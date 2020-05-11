use std::env;

fn main() {
    let mut n: i64 = 600851475143;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1{
        n = args[1].parse().unwrap();
    }
    let mut last_factor: i64 = 1;
    if n % 2 == 0 {
        n /= 2;
        last_factor = 2;
        while n % 2 == 0 {
            n /= 2;
        }
    }
    let mut factor: i64 = 3;
    let mut max_factor: i64 = (n as f64).sqrt() as i64 + 1;
    while n > 1 && factor < max_factor {
        if n % factor == 0 {
            n /= factor;
            last_factor = factor;
            while n % factor == 0 {
                n /= factor
            }
            max_factor = (n as f64).sqrt() as i64 + 1;
        }
        factor += 2;
    }
    if n != 1 {
        last_factor = n;
    }
    println!("{}", last_factor);
}
