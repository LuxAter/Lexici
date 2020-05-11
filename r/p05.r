#!/usr/bin/Rscript

printf <- function(...) invisible(print(sprintf(...)))

k  <-  20;
args  <- commandArgs(TRUE)
if(length(args) > 0){
  k  <-  as.integer(args[1])
}
multiple  <-  1
i  <-  1
check  <-  TRUE
limit  <-  sqrt(k)
p  <-  c(2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229)
while(p[i] <= k) {
  a  <- 1;
  if(check){
    if(p[i] <= limit){
      a  <-  floor(log(as.double(k)) / log(as.double(p[i])))
    }else{
      check <- FALSE
    }
  }
  multiple  <-  multiple * '^'(p[i], a)
  i  <-  i + 1
}
printf("%i", multiple)
