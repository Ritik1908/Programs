#include <stdio.h>
#include <stdlib.h>

void hanoi(int n, char b, char a, char e)
{
    if(n == 1)
    {
        printf("Move disk %d from %c to %c.\n",n, b, e);\
    }
    else
    {
        hanoi(n-1,b,e,a);
        printf("Move disk %d from %c to %c\n",n, b, e);
        hanoi(n-1,a,b,e);
    }
}

int main()
{
    int disk;
    printf("Enter Number of disk : ");
    scanf("%d", &disk);
    hanoi(disk,'B','A','E');
    return 0;
}
