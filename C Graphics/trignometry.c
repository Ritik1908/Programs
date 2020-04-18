#include <stdio.h>
#include <graphics.h>

float power(float rad, int n)
{
	int i;
	float val = 1;
	for(i = 0; i < n; i++)
	{
		val = val*rad;
	}
	return val;
}

float fact(float n)
{
	if(n == 0 || n == 1)
	{
		return 1;
	}
	else
	{
		return n * fact(n-1);
	}
}
		
float sinval(float rad)
{
	float val = 0;
	int i;
	if(rad < 3.14)
	{
		for(i = 0; i <= 10; i++)
		{
			if(i%2 == 0)
			{
				val = val + (power(rad, ((2*i)+1))/fact(((2*i)+1)));
			}
			else
			{
				val = val - (power(rad, ((2*i)+1))/fact(((2*i)+1)));
			}
		}
	}
	else
	{
		for(i = 0; i <= 20; i++)
		{
			if(i%2 == 0)
			{
				val = val + (power(rad, ((2*i)+1))/fact(((2*i)+1)));
			}
			else
			{
				val = val - (power(rad, ((2*i)+1))/fact(((2*i)+1)));
			}
		}
	}
	return val;
}

void main()
{
	float degree;
	float rad;
	int i;
	int gd = DETECT, gm;
	printf("|deg\t|rad\t|sin\t|");
	for(i = 0; i <= 360; i++)
	{
		rad = (3.14/180)*i;
		printf("|%d\t|%.4f\t|%.4f|\n", i, rad, sinval(rad));
	}
	initgraph(&gd, &gm, "");
	line(50,200,450,200);
	line(50,50,50,350);
	line(45, 55, 50, 50);
	line(50, 50, 55,  55);
	line(45, 345, 50, 350);
	line(50, 350, 55,  345);
	line(445, 195, 450, 200);
	line(445, 205, 450, 200);
	for(i = 0; i <= 360; i++)
	{
		rad = (3.14/180)*i;
		putpixel((i+50), (200-(100*sinval(rad))), WHITE);
	}
	delay(100000);
	closegraph();
}



