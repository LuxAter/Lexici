#!/bin/bash

let limit=100
if [[ "$1" != "" ]]; then
  let limit=$1
fi
let sum=$((limit*(limit+1)/2))
let sum_sq=$(((2*limit+1)*(limit+1)*limit/6))
let diff=$(((sum**2)-sum_sq))
printf "%d\n" $diff
