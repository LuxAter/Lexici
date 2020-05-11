use std::env;

fn main() {
    let mut limit: i64 = 100;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        limit =args[1].parse().unwrap();
    }
    let sum: i64 = limit * (limit + 1) / 2;
    let sum_sq: i64 = (2 * limit + 1) * (limit + 1) * limit / 6;
    let diff: i64 = (sum as f64).powi(2) as i64 - sum_sq;
    println!("{}", diff);
}
