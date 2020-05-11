#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

IsPrime <- function(n){
  if(n == 1){
    return(F)
  }else if(n < 4){
    return(T)
  }else if(n %% 2 == 0){
    return(F)
  }else if(n < 9){
    return(T)
  }else if(n %% 3 == 0){
    return(F)
  }else{
    r  <- floor(sqrt(n))
    f  <- 5
    while (f <= r){
      if (n %% f == 0){
        return(F)
      }else if(n %% (f  +  2) == 0){
        return(F)
      }
      f  <- f + 6
    }
  }
  return(T)
}

limit  <- 10001
args  <- commandArgs(TRUE)
if(length(args) > 0){
  limit  <- as.integer(args[1])
}
count  <-  1
val  <-  1
while(count < limit){
  val  <- val + 2
  if (IsPrime(val)){
    count  <- count + 1
  }
}

printf("%i", val)
