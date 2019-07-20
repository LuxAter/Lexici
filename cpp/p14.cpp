#include <cmath>
#include <iostream>
#include <map>

std::map<unsigned long, unsigned> values = {{1, 1}};

unsigned count_chain(unsigned long n) {
  if (values.find(n) != values.end()) {
    return values[n];
  }
  if (n % 2 == 0) {
    values[n] = 1 + count_chain(n / 2);
  } else {
    values[n] = 2 + count_chain((3 * n + 1) / 2);
  }
  return values[n];
}

int main(int argc, char *argv[]) {
  unsigned long maximum = 1000000;
  unsigned long longest = 0;
  unsigned long num = 0;

  if (argc > 1) {
    maximum = atoi(argv[1]);
  }

  for (unsigned long i = 2; i < maximum; ++i) {
    unsigned long chain_length = count_chain(i);
    if (chain_length > longest) {
      longest = chain_length;
      num = i;
    }
  }
  std::cout << num << std::endl;
}
