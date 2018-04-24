use std::env;

fn main() {
    let mut sum: i64 = 1000;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        sum = args[1].parse().unwrap();
    }
    let mut prod: i64 = 0;
    for a in 3..(sum-3)/3 {
        for b in (a+1)..(sum-1-a)/2 {
            let c: i64 = sum-a-b;
            if c * c == a * a + b * b {
                prod = a * b * c;
            }
        }
    }
    println!("{}", prod);
}
