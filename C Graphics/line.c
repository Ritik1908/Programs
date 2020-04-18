#include <graphics.h>
#include <stdio.h>

void main()
{
	int gd = DETECT, gm;
	initgraph(&gd, &gm, "");
	line(100,100,300,300);
	delay(1000);
	closegraph();
}
