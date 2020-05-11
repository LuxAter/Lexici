package main

import "fmt"
import "os"
import "strconv"

func SumDivisible(n, max int) int {
	var p int = max / n
	return n * (p * (p + 1)) / 2
}

func main() {
	var max int = 999
	if len(os.Args) > 1 {
		if s, err := strconv.Atoi(os.Args[1]); err == nil {
			max = s - 1
		}
	}
	var sum int = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max)
	fmt.Printf("%v\n", sum)
}
