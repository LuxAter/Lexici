#!/usr/bin/env node

let k = 20;
if (process.argv.length > 2) {
  k = process.argv[2];
}
let multiple = 1;
let i = 0;
let check = true;
let limit = Math.sqrt(k);
let p = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229];
while (p[i] <= k) {
  let a = 1
  if (check) {
    if (p[i] <= limit) {
      a = Math.floor(Math.log(k) / Math.log(p[i]));

    } else {
      check = false;
    }
  }
  multiple *= Math.pow(p[i], a);
  i += 1
}
console.log(multiple);
