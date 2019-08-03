#include <cmath>
#include <iostream>

int main(int argc, char *argv[]) {

  unsigned long long size = 20;
  if (argc > 1) {
    size = atoi(argv[1]);
  }

  double result = 1;
  for (double i = size * 2; i > size; --i) {
    result *= (i / (i - size));
  }
  std::cout << static_cast<unsigned long>(result) << std::endl;
  return 0;
}
