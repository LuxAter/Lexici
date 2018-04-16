#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main(int argc, char* argv[])
{
  unsigned long long limit = 2000000;
  if (argc > 1) {
    limit = atoi(argv[1]);
  }
  unsigned long long cross_limit = floor(sqrt(limit));
  bool sieve[2000000] = { false };
  for (unsigned long long n = 4; n < limit; n += 2) {
    sieve[n] = true;
  }
  for (unsigned long long n = 3; n <= cross_limit; n += 2) {
    if (!sieve[n]) {
      for (unsigned long long m = n * n; m < limit; m += (2 * n)) {
        sieve[m] = true;
      }
    }
  }
  unsigned long long sum = 0;
  for (unsigned long long n = 2; n < limit; n++) {
    if (!sieve[n]) {
      sum += n;
    }
  }
  printf("%llu\n", sum);
}
