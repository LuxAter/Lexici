use std::env;

fn reverse_integer(n: i32) -> i32 {
    let mut val: i32 = n;
    let mut reversed: i32 = 0;
    while val > 0 {
        reversed = (10 * reversed) + (val % 10);
        val = val / 10;
    }
    return reversed;
} 

fn is_palindrome(n: i32) -> bool {
    return n == reverse_integer(n);
}

fn main() {
    let mut count: i32 = 3;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        count = args[1].parse().unwrap();
    }
    let mut tmp: i32 = count;
    let mut max: i32 = 0;
    while tmp > 0 {
        max = (max * 10) + 9;
        tmp -= 1;
    }
    let mut a: i32 = max;
    let mut largest: i32 = 0;
    while a >= (10 * count) {
        let mut b: i32;
        let db: i32;
        if (a % 11) == 0 {
            b = max;
            db = 1;
        }else {
            b = 11 * (max / 11);
            db = 11;
        }
        while b >= a {
            if (a * b) <= largest {
                break;
            }else if is_palindrome(a * b) {
                largest = a * b;
            }
            b -= db;
        }
        a -= 1;
    }
    println!("Largest palindrome multiples of {} digits: {}", count, largest);
}
