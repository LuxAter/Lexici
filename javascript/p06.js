#!/usr/bin/env node

let limit = 100
if (process.argv.length > 2){
  limit = process.argv[2];
}
let sum = limit * (limit + 1) / 2;
let sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6;
let diff = Math.pow(sum, 2) - sum_sq;
console.log(diff);
