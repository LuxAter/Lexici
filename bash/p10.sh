#!/bin/bash

let limit=2000000
if [[ "$1" != "" ]]; then
  limit=$1
fi

let cross_limit=$(echo "sqrt($limit)" | bc)
sieve=( $(for i in $(seq 1 $limit); do echo 1; done) )
for n in $(seq 4 2 $limit); do
  sieve[$n]=0
done
for n in $(seq 3 2 $cross_limit); do
  if [[ ${sieve[$n]} == 1 ]]; then
    for j in $(seq $(($n * $n)) $((2 * $n)) $limit); do
      sieve[$j]=0
    done
  fi
done
let sum=0
for n in $(seq 2 $limit); do
  if [[ ${sieve[$n]} == 1 ]]; then
    sum=$((sum + $n))
  fi
done

printf "%d\n" $sum
