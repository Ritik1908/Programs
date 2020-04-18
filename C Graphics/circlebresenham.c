#include <stdio.h>
#include <graphics.h>

void main()
{
	int xc, yc;
	float r, d, x, y;
	int gd = DETECT, gm;
	printf("Enter Coordinates of center(x,y) of circle in 1st quadrant : ");
	scanf("%d %d", &xc, &yc);
	printf("Enter Radius of circle : ");
	scanf("%f", &r);
	x = 0;
	y = r;
	d = 3-(2*r);
	initgraph(&gd, &gm, "");
	putpixel((xc+(int)x),(yc+(int)y), WHITE);
	while(x < y)
	{
		if(d < 0)
		{
			x = x+1;
			d = d + (4*x) + 6;
		}
		else
		{
			y = y-1;
			x = x+1;
			d = d + (4*(x-y)) + 10;
		}
		putpixel((xc+(int)x),(yc+(int)y), WHITE);
		putpixel((yc+(int)y), (xc+(int)x), WHITE);
		putpixel((xc-(int)x),(yc+(int)y), WHITE);
		putpixel((yc-(int)y), (xc+(int)x), WHITE);
		putpixel((xc-(int)x),(yc-(int)y), WHITE);
		putpixel((yc-(int)y), (xc-(int)x), WHITE);
		putpixel((xc+(int)x),(yc-(int)y), WHITE);
		putpixel((yc+(int)y), (xc-(int)x), WHITE);
	}
	delay(10000);
	closegraph();
}
