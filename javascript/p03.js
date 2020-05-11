#!/usr/bin/env node

let n = 600851475143;
let max = n;
if (process.argv.length > 2) {
  n = process.argv[2];
  max = n;
}
let last_factor = 1
if (n % 2 == 0) {
  last_factor = 2;
  n /= 2;
  while (n % 2 == 0) {
    n /= 2;
  }
}
let factor = 3
let max_factor = Math.sqrt(n)
while (n > 1 && factor <= max_factor) {
  if (n % factor == 0) {
    n /= factor;
    last_factor = factor;
    while (n % factor == 0) {
      n /= factor;
    }
    max_factor = Math.sqrt(n);
  }
  factor += 2;
}
if (n != 1) {
  last_factor = n;
}
console.log(last_factor);
