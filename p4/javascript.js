#!/usr/bin/env node

function ReverseInteger(n) {
  let reversed = 0
  while (n > 0) {
    reversed = (10 * reversed) + (n % 10);
    n = Math.floor(n / 10);
  }
  return reversed;
}

function IsPalindrome(n) {
  return n == ReverseInteger(n);
}


let count = 3;
if (process.argv.length > 2) {
  count = process.argv[2];
}
let tmp = count;
let max = 0;
while (tmp > 0) {
  max = (max * 10) + 9;
  tmp--;
}

let a = max;
let largest = 0;
while (a >= (10 * count)) {
  let b = 0;
  let db = 0;
  if (a % 11 == 0) {
    b = max;
    db = 1;
  } else {
    b = 11 * (max / 11);
    db = 11;
  }
  while (b >= a) {
    if ((a * b) <= largest) {
      break;
    } else if (IsPalindrome(a * b)) {
      largest = a * b;
    }
    b -= db;
  }
  a--;
}
console.log("Largest palindrome multiples of %d digits: %d", count, largest);
