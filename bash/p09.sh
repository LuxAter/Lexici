#!/bin/bash

let sum=1000
if [[ "$1" != "" ]]; then
  sum=$1
fi

let prod=0

for a in $(seq 3 $((($sum - 3) / 3))); do
  for b in $(seq $(($a + 1)) $((($sum - 1 - $a) / 2))); do
    let c=$(($sum - $a - $b))
    if (( $(($c * $c)) == $(($a * $a + $b * $b)) )); then
      prod=$(($a * $b * $c))
      break
    fi
  done
  if [[ $prod != 0 ]]; then
    break
  fi
done

printf "%d\n" $prod
