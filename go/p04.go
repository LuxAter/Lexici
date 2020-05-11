package main

import "fmt"

import "os"
import "strconv"

func ReverseInteger(n int) int {
	var reversed int = 0
	var val int = n
	for val > 0 {
		reversed = (10 * reversed) + (val % 10)
		val = val / 10
	}
	return reversed
}

func IsPalindrome(n int) bool {
	return n == ReverseInteger(n)
}

func main() {
	var count int = 3
	if len(os.Args) > 1 {
		if s, err := strconv.Atoi(os.Args[1]); err == nil {
			count = s
		}
	}
	var tmp int = count
	var max int = 0
	for tmp > 0 {
		max = (max * 10) + 9
		tmp--
	}
	var a int = max
	var largest int = 0
	for a >= (10 * count) {
		var b int
		var db int
		if a%11 == 0 {
			b = max
			db = 1
		} else {
			b = 11 * (max / 11)
			db = 11
		}
		for b >= a {
			if (a * b) <= largest {
				break
			} else if IsPalindrome(a * b) {
				largest = a * b
			}
			b -= db
		}
		a--

	}
	fmt.Printf("%v\n", largest)
}
