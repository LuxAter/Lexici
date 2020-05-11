use std::env;

fn main() {
    let mut k: i32 = 20;
    let args: Vec<_> = env::args().collect();
    if args.len() > 1 {
        k = args[1].parse().unwrap();
    }
    let mut multiple: i64 = 1;
    let mut i: usize = 0;
    let mut check: bool = true;
    let limit = (k as f64).sqrt() as i32 + 1;
    let mut a: [i32; 50] = [0; 50];
    let p: [i32; 50] = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229 ];
    while p[i] <= k {
        a[i] = 1;
        if check {
            if p[i] <= limit {
                a[i] = ((k as f64).ln() / (p[i] as f64).ln()).floor() as i32;
            }else{
                check = false;
            }
        }
        multiple *= (p[i] as f64).powi(a[i]) as i64;
        i += 1;
    }
    println!("{}", multiple);
}
