#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DELIM "."

/* return 1 if string contain only digits, else return 0 */
int valid_digit(char *ip_str)
{
  while (*ip_str) {
    if (*ip_str >= '0' && *ip_str <= '9')
      ++ip_str;
    else
      return 0;
  }
  return 1;
}

/* return 1 if IP string is valid, else return 0 */
int is_valid_ip(char *ip_str)
{
  int i, num, dots = 0;
  char *ptr;

  if (ip_str == NULL)
    return 0;

  ptr = strtok(ip_str, DELIM);

  if (ptr == NULL)
    return 0;

  while (ptr) {

    /* after parsing string, it must contain only
    digits */
    if (!valid_digit(ptr))
      return 0;

    num = atoi(ptr);

    /* check for valid IP */
    if (num >= 0 && num <= 255) {
      /* parse remaining string */
      ptr = strtok(NULL, DELIM);
      if (ptr != NULL)
        ++dots;
      } else
        return 0;
  }

  /* valid IP string must contain 3 dots */
  if (dots != 3)
    return 0;
  return 1;
}
// Function to find out the Class
char findClass(char str[])
{
  // storing first octet in arr[] variable
  char arr[4];
  int i = 0;
  while (str[i] != '.')
  {
    arr[i] = str[i];
    i++;
  }
  i--;

  // converting str[] variable into number for
  // comparison
  int ip = 0, j = 1;
  while (i >= 0)
  {
    ip = ip + (str[i] - '0') * j;
    j = j * 10;
    i--;
  }

  // Class A
  if (ip >=1 && ip <= 126)
    return 'A';

  // Class B
  else if (ip >= 128 && ip <= 191)
    return 'B';

  // Class C
  else if (ip >= 192 && ip <= 223)
    return 'C';

  // Class D
  else if (ip >= 224 && ip <= 239)
    return 'D';

  // Class E
  else
    return 'E';
}
int main()
{
  char str[15];
  printf("Enter IP address: ");
  scanf("%s",str);
  char s[15];
  strcpy(s,str);
  if(is_valid_ip(s))
  {
    char ipClass = findClass(str);
    printf("Given IP address belongs to Class %c.\n", ipClass);
  }
  else
    printf("Invalid IP address.\n");
  return 0;
}
