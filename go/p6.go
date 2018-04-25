package main

import "fmt"
import "math"
import "os"
import "strconv"

func main() {
  var limit int = 100
  if len(os.Args) > 1 {
    if s, err := strconv.Atoi(os.Args[1]); err == nil {
      limit = int(s)
    }
  }
  var sum int = limit * (limit + 1) / 2
  var sum_sq int = (2 * limit + 1) * (limit + 1) * limit / 6
  var diff int = int(math.Pow(float64(sum), 2.0)) - sum_sq
  fmt.Printf("%v\n", diff)
}
