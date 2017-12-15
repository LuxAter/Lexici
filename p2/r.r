#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

limit <- 4000000
sum <- 0
a <- 1
b <- 1
c <- 2
args <- commandArgs(TRUE)
if(length(args) > 0){
    limit <- as.integer(args[1])
}
while(c < limit){
    sum <- sum + c
    a <- b + c
    b <- c + a
    c <- a + b
}
printf("Sum of even fibonacci numbers less than %i: %i", limit, sum)
