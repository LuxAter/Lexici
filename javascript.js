#!/usr/bin/env node

function IsPrime(p) {
  if (p == 1) {
    return false;
  } else if (p < 4) {
    return true;
  } else if (p % 2 == 0) {
    return false;
  } else if (p < 9) {
    return true;
  } else if (p % 3 == 0) {
    return false;
  } else {
    var r = Math.floor(Math.sqrt(p));
    var f = 5;
    while (f <= r) {
      if (p % f == 0 || p % (f + 2) == 0) {
        return false;
      }
      f += 6;
    }
  }
  return true;
}

var limit = 10001;
if (process.argv.length > 2) {
  limit = process.argv[2]
}
var count = 1,
  val = 1;
while (count < limit) {
  val += 2;
  if (IsPrime(val) == true) {
    count++;
  }
}
console.log("%d\'th Prime: %d", limit, val)
