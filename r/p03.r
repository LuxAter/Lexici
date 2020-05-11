#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

n <- 600851475143
max <- n
args <- commandArgs(TRUE)
if(length(args) > 0){
    n <- as.integer(args[1])
    max <- n
}
last_factor <- 1
if(n %% 2 == 0){
    n <- n / 2
    last_factor <- 2
    while (n %% 2 == 0){
        n <- n / 2
    }
}
factor <- 3
max_factor <- sqrt(n)
while( n > 1 && factor <= max_factor ){
    if(n %% factor == 0){
        n <- n / factor
        last_factor <- factor
        while (n %% factor == 0){
            n <- n / factor
        }
        max_factor <- sqrt(n)
    }
    factor <- factor + 2
}
if (n != 1){
    last_factor <- n
}
printf("%i", last_factor)

