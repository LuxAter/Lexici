use std::env;

fn main() {
    let mut limit: i64 = 2000000;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        limit = args[1].parse().unwrap();
    }
    let cross_limit = (limit as f64).sqrt().floor() as i64;
    let mut sieve: [bool; 2000000] = [false; 2000000];
    let mut n: usize = 4;
    while n < limit as usize {
        sieve[n] = true;
        n += 2;
    }
    n = 3;
    while n < cross_limit as usize {
        if !sieve[n] {
            let mut m: usize = n * n;
            while m < limit as usize {
                sieve[m] = true;
                m += 2 * n;
            }
        }
        n += 2
    }
    let mut sum: i64 = 0;
    for k in 2..limit {
        if !sieve[k as usize] {
            sum += k;
        }
    }
    println!("{}", sum);
}
