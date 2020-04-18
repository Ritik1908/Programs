#include <stdio.h>

int main(){
	int size;
	int a[size];
	int b[size];
	for(int i=0;i<size;i++)
	{
	    scanf("%d", &a[i]);
	}
	for(int i=0;i<size;i++)
	{
	    scanf("%d", &b[i]);
	}
	for(int i=0;i<size;i++)
	{
	    printf("%d", (a[i]+b[i]));
	}
}
