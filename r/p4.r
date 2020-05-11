#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

ReverseInteger <- function(val){
    reversed <- 0
    while(val > 0){
        reversed <- (10 * reversed) + (val %% 10)
        val <- floor(val / 10)
    }
    return(reversed)
}

IsPalindrome <- function(n){
    return(n == ReverseInteger(n))
}

count <- 3
args <- commandArgs(TRUE)
if(length(args) > 0){
    count <- as.integer(args[1])
}
tmp = count
max = 0
while(tmp > 0){
    max = (max * 10) + 9
    tmp = tmp - 1
}
a = max
largest = 0
while(a >= (10 * count)){
    b = 0
    db = 0
    if(a %% 11 == 0){
        b = max
        db = 1
    }else{
        b = 11 * (max / 11)
        db = 11
    }
    while(b >= a){
        if(a * b <= largest){
            break
        }else if(IsPalindrome(a * b)){
            largest = a * b
        }
        b = b - db
    }
    a = a - 1
}
printf("%i", largest)
