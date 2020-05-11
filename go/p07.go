package main

import "fmt"
import "math"
import "os"
import "strconv"

func IsPrime(n int) bool {
  if n == 1{
    return false
  }else if n < 4 {
    return true
  } else if n % 2 == 0 {
    return false
  } else if n < 9 {
    return true
  } else if n % 3 == 0 {
    return false
  } else{
    var r int = int(math.Floor(math.Sqrt(float64(n))))
    var f int = 5
    for f <= r {
      if n% f == 0{
        return false
      } else if n % (f +2) == 0 {
        return false
      }
      f += 6
    }
  }
  return true
}

func main() {
  var limit int = 10001
  if len(os.Args) > 1 {
    if s, err := strconv.Atoi(os.Args[1]); err == nil {
      limit = int(s)
    }
  }
  var count int = 1
  var val int = 1
  for count < limit {
    val += 2
    if IsPrime(val){
      count += 1
    }
  }
  fmt.Printf("%v\n", val)
}
