#!/bin/bash

let n=600851475143
let max=$n
if [[ "$1" != "" ]]; then
  let n=$1
  let max=$1
fi
let last_factor=1
if [[ $(( n % 2 )) == 0 ]]; then
  last_factor=2
  n=$((n/2))
  while [[ $(( n % 2 )) == 0 ]]; do
    n=$((n/2))
  done
fi
let factor=3
let max_factor=$(echo "sqrt ($n)" | bc)
while [[ $n -gt 1 ]] && [[ $factor -le $max_factor ]]; do
  if [[ $(( n % factor )) == 0 ]]; then
    n=$(( n / factor ))
    last_factor=$factor
    while [[ $(( n % factor )) == 0 ]]; do
      n=$(( n / factor ))
    done
    max_factor=$(echo "sqrt ($n)" | bc)
  fi
  factor=$((factor+2))
done

if [[ $n != 1 ]]; then
  last_factor=$n
fi

printf "%i\n" $last_factor
