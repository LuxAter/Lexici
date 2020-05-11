package main

import "fmt"
import "math"
import "os"
import "strconv"

func main() {
	var n int64 = 600851475143
	if len(os.Args) > 1 {
		if s, err := strconv.Atoi(os.Args[1]); err == nil {
			n = int64(s)
		}
	}
	var last_factor int64 = 1
	if n%2 == 0 {
		last_factor = 2
		n /= 2
		for n%2 == 0 {
			n /= 2
		}
	}
	var factor int64 = 3
	var max_factor int64 = int64(math.Sqrt(float64(n)))
	for n > 1 && factor <= max_factor {
		if n%factor == 0 {
			n /= factor
			last_factor = factor
			for n%factor == 0 {
				n /= factor
			}
			max_factor = int64(math.Sqrt(float64(n)))
		}
		factor += 2
	}

	if n != 1 {
		last_factor = n
	}
	fmt.Printf("%v\n", last_factor)
}
