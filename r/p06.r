#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

limit  <- 100
args  <- commandArgs(TRUE)
if(length(args) > 0){
  limit  <- as.integer(args[1])
}
sum  <- limit * (limit + 1) / 2
sumsq <- (2 * limit + 1) * (limit + 1) * limit / 6
diff  <- '^'(sum, 2) - sumsq

printf("%i", diff)
