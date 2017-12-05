#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

bool IsPrime(int p)
{
  if (p == 1) {
    return false;
  } else if (p < 4) {
    return true;
  } else if (p % 2 == 0) {
    return false;
  } else if (p < 9) {
    return true;
  } else if (p % 3 == 0) {
    return false;
  } else {
    int r = floor(sqrt(p));
    int f = 5;
    while (f <= r) {
      if (p % f == 0 || p % (f + 2) == 0) {
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
  int val = 1;
  while (count < limit) {
    val += 2;
    if (IsPrime(val) == true) {
      count++;
    }
  }
  printf("%d\'th Prime: %d\n", limit, val);
  return 0;
}
