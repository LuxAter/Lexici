use std::env;

pub fn main() {
    let req_count = 500;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        req_count = args[1].parse().unwrap();
    }
}
