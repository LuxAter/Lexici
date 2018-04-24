#!/usr/bin/env node

let limit = 2000000;
if (process.argv.length > 2) {
  limit = process.argv[2];
}
let cross_limit = Math.floor(Math.sqrt(limit));
let sieve = new Array(2000000).fill(false);
for(n = 4; n < limit; n += 2){
  sieve[n] = true;
}
for (n = 3; n < cross_limit; n += 2) {
  if (!sieve[n]) {
    for (m = n * n; m < limit; m += (2 * n)) {
      sieve[m] = true;
    }
  }
}
let sum = 0;
for (n = 2; n < limit; n++) {
  if (!sieve[n]) {
    sum += n;
  }
}
console.log(sum);
