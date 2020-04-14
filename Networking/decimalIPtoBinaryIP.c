#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int validator (int num1)
{
  if (num1 >= 0 && num1 <= 255)
    {
      return 1;
    }
  return 0;
}

const char* convert(int n) {
    int bin = 0;
    int rem, i = 1, step = 1;
    while (n != 0) {
        rem = n % 2;
        n /= 2;
        bin += rem * i;
        i *= 10;
    }
    char *bins = malloc(8);
    char *binsCpy = malloc(8);
    sprintf(bins, "%d", bin);
    if(strlen(bins) != 8) {
    	for(int i = 0; i < 9-strlen(bins); i++) {
    		binsCpy = strcat(binsCpy, "0");
    	}
    }
    bins = strcat(binsCpy, bins);
    return bins;
} 

int main ()
{
  int n1, n2, n3, n4;
  printf("Enter your IP address: ");
  scanf("%d %d %d %d", &n1, &n2, &n3, &n4);
  if (validator (n1) && validator (n2) && validator(n3) && validator(n4)) {
      printf("IP address in dotted decimal form: %d.%d.%d.%d\n", n1, n2, n3, n4);
      printf("Decimal Form: %s.%s.%s.%s\n", convert(n1), convert(n2), convert(n3),convert(n4));
      
  }

    return 0;
}
