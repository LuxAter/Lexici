#include <algorithm>
#include <cmath>
#include <cstdio>
#include <vector>

int main(int argc, char *argv[]) {
  int req_count = 500;
  if (argc > 1) {
    req_count = atoi(argv[1]) - 1;
  }
  std::vector<unsigned> primes;
  for (unsigned i = 2; i < req_count * 2; ++i) {
    if (!std::any_of(primes.begin(), primes.end(),
                     [i](unsigned prime) { return i % prime == 0; }))
      primes.push_back(i);
  }

  unsigned n = 3;
  unsigned dn = 2;
  unsigned i, exponent;
  unsigned cnt = 0;
  while (cnt <= req_count) {
    n += 1;
    unsigned n1 = n;
    if (n1 % 2 == 0)
      n1 /= 2;
    unsigned dn1 = 1;
    for (i = 0; i < primes.size(); ++i) {
      if (primes[i] * primes[i] > n1) {
        dn1 *= 2;
        break;
      }
      exponent = 1;
      while (n1 % primes[i] == 0) {
        exponent++;
        n1 /= primes[i];
      }
      if (exponent > 1)
        dn1 *= exponent;
      if (n1 == 1)
        break;
    }
    cnt = dn * dn1;
    dn = dn1;
  }
  printf("%u\n", n * (n - 1) / 2);
}
