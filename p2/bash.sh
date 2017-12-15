#!/bin/bash

let limit=4000000
let sum=0
let a=1
let b=1
let c=2
if [[ "$1" != "" ]]; then
  let limit=$1
fi

while [[ $c -lt $limit ]]; do
  sum=$(( sum + c ))
  a=$((b + c))
  b=$((c + a))
  c=$((a + b))
done

printf "Sum of event fibonacci numbers less than %i: %i\n" $limit $sum
