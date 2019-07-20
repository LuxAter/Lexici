#include <cmath>
#include <cstdlib>
#include <iostream>

int main(int argc, char *argv[]) {
  unsigned long int n = 600851475143;
  if (argc > 1) {
    n = atoi(argv[1]);
  }
  unsigned long int last_factor = 1;
  if (n % 2 == 0) {
    last_factor = 2;
    n /= 2;
    while (n % 2 == 0) {
      n /= 2;
    }
  }
  unsigned long int factor = 3;
  unsigned long int max_factor = sqrt(n);
  while (n > 1 && factor <= max_factor) {
    if (n % factor == 0) {
      n /= factor;
      last_factor = factor;
      while (n % factor == 0) {
        n /= factor;
      }
      max_factor = sqrt(n);
    }
    factor += 2;
  }
  if (n != 1) {
    last_factor = n;
  }
  std::cout << last_factor << std::endl;
}
