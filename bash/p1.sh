#!/bin/bash

SumDivisible() {
  let p=$(($2 / $1))
  echo $(( $(( $1 * $(( $p * $(( $p + 1 )))))) / 2 ))
}

let limit=999
if [[ "$1" != "" ]]; then
  let limit=$(($1 - 1))
fi

let val=$(( $(SumDivisible 3 $limit) + $(SumDivisible 5 $limit) - $(SumDivisible 15 $limit)))
printf "%d\n" $val
