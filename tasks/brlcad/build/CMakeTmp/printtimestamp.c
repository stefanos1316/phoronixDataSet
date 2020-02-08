
#define _CRT_SECURE_NO_WARNINGS 1

#include <time.h>
#include <stdio.h>

int main(int argc, const char **argv)
{
  time_t t = time(NULL);
  struct tm *currenttime = localtime(&t);
  if (argc < 2) return 1;
  printf("\n%s%s\n", argv[1], asctime(currenttime));
  return 0;
}
