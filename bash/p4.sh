#!/bin/bash

ReverseInteger() {
  let reversed=0
  let val=$1
  while [[ $val -gt 0 ]]; do
    let reversed=$(((10*reversed) + (val % 10)))
    let val=$((val/10))
  done
  echo $reversed
}

IsPalindrome() {
  if [[ $(ReverseInteger $1) == $1 ]]; then
    return 0
  else
    return 1
  fi
}

let count=3
if [[ "$1" != "" ]]; then
  let count=$1
fi
let tmp=$count
let max=0
while [[ $tmp -gt 0 ]]; do
  let max=$(((max * 10) + 9))
  let tmp=$((tmp - 1))
done
let a=$max
let largest=0
while [[ $a -ge $((10 * $count)) ]]; do
  if [[ $(($a % 11)) == 0 ]]; then
    let b=$max
    let db=1
  else
    let b=$((11 * ($max / 11)))
    let db=11
  fi
  while [[ $b -ge $a ]]; do
    if [[ $(($a * $b)) -le $largest ]]; then
      break
    elif IsPalindrome $((a * b)); then
      let largest=$((a * b))
    fi
    let b=$((b - db))
  done
  let a=$((a - 1))
done

printf "%i\n" $largest
