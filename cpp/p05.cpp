#include <cmath>
#include <cstdlib>
#include <iostream>

int main(int argc, char *argv[]) {
  int k = 20;
  if (argc > 1) {
    k = atoi(argv[1]);
  }
  int multiple = 1;
  int i = 0;
  bool check = true;
  int limit = sqrt(k);
  int a[50];
  int p[50] = {2,   3,   5,   7,   11,  13,  17,  19,  23,  29,  31,  37,  41,
               43,  47,  53,  59,  61,  67,  71,  73,  79,  83,  89,  97,  101,
               103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167,
               173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229};
  while (p[i] <= k) {
    a[i] = 1;
    if (check) {
      if (p[i] <= limit) {
        a[i] = floor(log(k) / log(p[i]));
      } else {
        check = false;
      }
    }
    multiple *= pow(p[i], a[i]);
    i++;
  }
  std::cout << multiple << std::endl;
}
