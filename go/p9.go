package main

import "fmt"
import "os"
import "strconv"

func main()  {
  var sum int = 1000
  if len(os.Args) > 1 {
    if s, err := strconv.Atoi(os.Args[1]); err == nil {
      sum = int(s)
    }
  }
  var prod uint = 0
  for a := 3; a < (sum-3)/3 && prod == 0; a++{
    for b:=(a+1);b < (sum-1-a)/2 && prod==0; b++{
      var c int = sum-a-b
      if c*c == a*a+b*b{
        prod = uint(a*b*c)
      }
    }
  }
  fmt.Printf("%v\n", prod)
}
