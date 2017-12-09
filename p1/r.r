#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

SumDivisible <- function(n, max){
  p <- floor(max / n)
  floor(n * (p * (p + 1)) / 2)
}

max <- 999
args <- commandArgs(TRUE)
if (length(args) > 0){
  max <- as.integer(args[1])- 1
}
sum <- SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max)

printf("Sum of the multiples of 3 & 5 less than %i: %i", max + 1, sum)
