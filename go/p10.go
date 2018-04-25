package main

import "fmt"
import "math"
import "os"
import "strconv"

func main()  {
  var limit uint = 2000000
  if len(os.Args) > 1 {
    if s, err := strconv.Atoi(os.Args[1]); err == nil {
      limit = uint(s)
    }
  }
  var cross_limit uint = uint(math.Floor(math.Sqrt(float64(limit))))
  var sieve [2000000]bool
  for n := uint(4); n < limit; n += 2 {
    sieve[n] = true
  }
  for n := uint(3); n <= cross_limit; n += 2 {
    if !sieve[n] {
      for m := uint(n*n); m < limit; m += (2 *n){
        sieve[m] = true
      }
    }
  }
  var sum uint = 0
  for n := uint(2); n < limit; n++ {
    if !sieve[n] {
      sum += n
    }
  }
  fmt.Printf("%v\n", sum)
}
