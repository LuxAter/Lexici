#!/usr/bin/env node

function SumDivisible(n, max){
  let p = Math.floor(max / n);
  return Math.floor(n * (p * ( p + 1 )) / 2);
}
let max = 999;
if (process.argv.length > 2){
  max = process.argv[2]
}
let sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max);
console.log(sum);
