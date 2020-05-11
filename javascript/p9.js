#!/usr/bin/env node

let sum = 1000;
if (process.argv.length > 2) {
  sum = process.argv[2];
}
let prod = 0
for (a = 3; a < (sum - 3) / 3 && prod == 0; ++a) {
  for (b = (a + 1); b < (sum - 1 - a) / 2 && prod == 0; ++b) {
    let c = sum - a - b;
    if (c * c == a * a + b * b) {
      prod = a * b * c;
    }
  }
}
console.log(prod);
