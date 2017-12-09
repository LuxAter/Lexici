use std::env;

fn sum_divisible(n: i32, max: i32) -> i32 {
    let p = max / n;
    n * (p * (p + 1)) / 2
}

fn main() {
    let mut max: i32 = 999;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        max = args[1].parse().unwrap();
        max = max - 1;
    }
    let sum = sum_divisible(3, max) + sum_divisible(5, max) - sum_divisible(15, max);
    println!("Sum of the multiples of 3 & 5 less than {}: {}", max + 1, sum);
}
