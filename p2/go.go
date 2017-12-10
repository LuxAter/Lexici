package main

import "fmt"
import "os"
import "strconv"

func main(){
  var limit int = 4000000
  var sum int = 0
  var a int = 1
  var b int = 1
  var c int = 2
  if len(os.Args) > 1{
    if s, err := strconv.Atoi(os.Args[1]); err == nil {
      limit = s
    }
  }
  for c < limit {
    sum += c
    a = b + c
    b = c + a
    c = a + b
  }
  fmt.Printf("Sum of even fibonacci nubers less than %v: %v\n", limit, sum);
}
