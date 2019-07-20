#include <cmath>
#include <cstdlib>
#include <iostream>

int main(int argc, char *argv[]) {
  int limit = 100;
  if (argc > 1) {
    limit = atoi(argv[1]);
  }
  int sum = limit * (limit + 1) / 2;
  int sum_sq = (2 * limit + 1) * (limit + 1) * limit / 6;
  int diff = pow(sum, 2) - sum_sq;
  std::cout << diff << std::endl;
}
