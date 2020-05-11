#!/bin/bash

let k=20
if [[ "$1" != "" ]]; then
  let k=$1
fi
let multiple=1
let i=0
let check=true
let limit=$(echo "sqrt ($k)" | bc)
a=()
p=(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109 113 127 131 137 139 149 151 157 163 167 173 179 181 191 193 197 199 211 223 227 229)

while [[ ${p[i]} -le $k ]]; do
  a[$i]=1
  if [[ $check ]]; then
    if [[ ${p[i]} -le $limit ]]; then
      a[$i]=$(echo "$(echo "l($k)/l(${p[$i]})" | bc -l)/1" | bc)
    else
      check=false
    fi
  fi
  multiple=$((multiple * (p[i] ** a[i])))
  i=$((i+1))
done
printf "%i\n" $multiple
