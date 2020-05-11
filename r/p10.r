#!/usr/bin/Rscript

limit <- 2000000
args <- commandArgs(TRUE)
if(length(args)>0){
  limit <- as.integer(args[1])
}
crosslimit <- floor(sqrt(limit))
sieve <- rep(F,2000000)
for(n in seq(4, limit, 2)){
  sieve[n] <- T
}
for (n in seq(3, crosslimit, 2)){
  if (! sieve[n]){
    for (m in seq(n*n, limit, 2*n)){
      sieve[m] <-  T
    }
  }
}
sum <- 0
for (n in 2:limit){
  if(! sieve[n]){
    sum <- sum + n
  }
}
print(sum)
