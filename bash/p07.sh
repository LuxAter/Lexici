#!/bin/bash

IsPrime(){
  if (( $1 == 1 )); then
    return 1
  elif (( $1 < 4 )); then
    return 0
  elif [[ $(($1 % 2)) == 0 ]]; then
    return 1
  elif (( $1 < 9 )); then
    return 0
  elif [[ $(($1 % 3)) == 0 ]]; then
    return 1
  else
    let r=$(echo "sqrt($1)" | bc)
    let f=5
    while (( $f <= $r )); do
      if [[ $(($1 % $f)) == 0 ]]; then
        return 1
      elif [[ $(($1 % ($f + 2))) == 0 ]]; then
        return 1
      fi
      f=$(($f + 6))
    done
  fi
  return 0
}

let limit=10001
if [[ "$1" != "" ]]; then
  limit=$1
fi
let count=1
let val=1
while (( $count < $limit )); do
  val=$((val+2))
  if IsPrime $val; then
    count=$((count+1))
  fi
done
printf "%d\n" $val
