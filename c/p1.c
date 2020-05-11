#include <stdio.h>
#include <stdlib.h>

int SumDivisible(int n, int max)
{
  int p = max / n;
  return n * (p * (p + 1)) / 2;
}

int main(int argc, char* argv[])
{
  int max = 999;
  if (argc > 1) {
    max = atoi(argv[1]) - 1;
  }
  int sum = SumDivisible(3, max) + SumDivisible(5, max) - SumDivisible(15, max);
  printf("%d\n", sum);
}
