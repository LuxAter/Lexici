use std::env;

fn main() {
    let mut limit: i32 = 4000000;
    let mut sum: i32 = 0;
    let mut a: i32;
    let mut b: i32 = 1;
    let mut c: i32 = 2;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        limit = args[1].parse().unwrap();
    }
    while c < limit {
        sum += c;
        a = b + c;
        b = c + a;
        c = a + b;
    }
    println!("{}", sum);
}
