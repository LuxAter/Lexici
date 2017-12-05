#!/bin/bash

is_prime() {
    if [[ $1 == 1 ]]; then
        return 0
    elif [[ $1 -lt 4 ]]; then
        return 1
    elif [[ $(( $1 % 2 )) == 0 ]]; then
        return 0
    elif [[ $1 -lt 9 ]]; then
        return 1
    elif [[ $(( $1 % 3 )) == 0 ]]; then
        return 0
    else
        let r=$(echo "sqrt ($1)" | bc)
        let f=5
        while [[ $f -le $r ]]; do
            if [[ $(($1 % $f)) == 0 ]] || [[ $(($1 % ($f+2))) == 0 ]]; then
                return 0
            fi
            let f=$f+6
        done
    fi
    return 1
}

let limit=10001
if [[ "$1" != "" ]]; then
    let limit=$1
fi
let count=1
let val=1
while [[ $count -lt $limit ]]; do
    let val=$val+2
    is_prime $val
    if [[ $? == 1 ]]; then
        let count++
    fi
done
printf "%d\'th Prime: %d\n" $limit $val
