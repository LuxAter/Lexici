#!/usr/bin/env node

function is_prime(n) {
  if (n == 1){
    return false;
  }else if(n < 4){
    return true;
  }else if(n % 2 == 0){
    return false;
  }else if(n < 9){
    return true;
  }else if(n % 3 == 0){
    return false;
  }else{
    let r = Math.floor(Math.sqrt(n));
    let f = 5;
    while (f <= r){
      if (n % f == 0){
        return false;
      }else if(n % (f + 2) == 0){
        return false;
      }
      f += 6;
    }
  }
  return true;
}

let limit = 10001;
if (process.argv.length > 2){
  limit = process.argv[2];
}
let count = 1;
let val = 1;
while (count < limit){
  val += 2;
  if(is_prime(val)){
    count += 1;
  }
}
console.log(val);
