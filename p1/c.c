#include <stdio.h>
#include <stdlib.h>

int SumDivisible(int n, int max){
  int p = max / n;
  printf("%i<<\n", p);
  return n * (p * (p + 1)) / 2;
}

int main(int argc, char* argv[]){
  int max = 999;
  if (argc > 1){
    max = atoi(argv[1]) - 1;
  }
  int sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max);
  printf(">>%i\n", SumDivisible(3, max));
  printf("Sum of the multiples of 3 & 5 less than %i: %i\n", max + 1, sum);
}
