#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[])
{
  int limit = 4000000;
  int sum = 0;
  int a = 1;
  int b = 1;
  int c = 2;
  if (argc > 1) {
    limit = atoi(argv[1]);
  }
  while (c < limit) {
    sum += c;
    a = b + c;
    b = c + a;
    c = a + b;
  }
  printf("%d\n", sum);
}
