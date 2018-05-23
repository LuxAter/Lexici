#!/usr/bin/Rscript

sum <- 1000
args <- commandArgs(TRUE)
if(length(args)>0){
  sum <- as.integer(args[1])
}
prod <- 0
for(a in 3:(sum-3)/3){
  for(b in (a+2):(sum-1-a)/2){
    c <- sum-a-b
    if(c*c == a*a+b*b){
      prod <- a*b*c
    }
  }
}
print(prod)
