#include <stdio.h>

int value()
{
	static int i = 6;
	return i--;
}

void main()
{
	for(value();value();value())
	{
		printf("%d\n", value());
	}	
}	
