#!/usr/bin/env node

let limit = 4000000;
let sum = 0;
let a = 1;
let b = 1;
let c = 2;
if(process.argv.length > 2){
  max = process.argv[2]
}
while(c < limit){
  sum += c;
  a = b + c;
  b = c + a;
  c = a + b;
}

console.log(sum);
