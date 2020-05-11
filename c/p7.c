#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

bool IsPrime(unsigned n)
{
  if (n == 1) {
    return false;
  } else if (n < 4) {
    return true;
  } else if (n % 2 == 0) {
    return false;
  } else if (n < 9) {
    return true;
  } else if (n % 3 == 0) {
    return false;
  } else {
    int r = floor(sqrt(n));
    int f = 5;
    while (f <= r) {
      if (n % f == 0) {
        return false;
      } else if (n % (f + 2) == 0) {
        return false;
      }
      f += 6;
    }
  }
  return true;
}

int main(int argc, char* argv[])
{
  int limit = 10001;
  if (argc > 1) {
    limit = atoi(argv[1]);
  }
  int count = 1;
  unsigned val = 1;
  while (count < limit) {
    val += 2;
    if (IsPrime(val)) {
      count++;
    }
  }
  printf("%u\n", val);
}
