package main

import "fmt"
import "math"
import "os"
import "strconv"

func main() {
	var k int = 20
	if len(os.Args) > 1 {
		if s, err := strconv.Atoi(os.Args[1]); err == nil {
			k = int(s)
		}
	}
	var multiple int = 1
	var i int = 0
	var check bool = true
	var limit int = int(math.Sqrt(float64(k)))
	var p [50]int = [50]int{2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229}
	for p[i] <= k {
		var a int = 1
		if check {
			if p[i] <= limit {
				a = int(math.Floor(math.Log(float64(k)) / math.Log(float64(p[i]))))
			} else {
				check = false
			}
		}
		multiple *= int(math.Pow(float64(p[i]), float64(a)))
		i += 1
	}
	fmt.Printf("%v\n", multiple)

}
