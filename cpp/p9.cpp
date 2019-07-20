#include <cstdlib>
#include <iostream>

int main(int argc, char *argv[]) {
  int sum = 1000;
  if (argc > 1) {
    sum = atoi(argv[1]);
  }

  unsigned prod = 0;

  for (unsigned a = 3; a < (sum - 3) / 3 && prod == 0; ++a) {
    for (unsigned b = (a + 1); b < (sum - 1 - a) / 2 && prod == 0; ++b) {
      unsigned c = sum - a - b;
      if (c * c == a * a + b * b) {
        prod = a * b * c;
      }
    }
  }
  std::cout << prod << std::endl;
}
