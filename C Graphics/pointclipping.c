#include <graphics.h>
#include <stdio.h>

void main()
{
	int gd = DETECT, gm;
	int xmin, ymin, xmax, ymax, x, y, ch = 0;
	printf("Enter (xmin, ymin) for clipping boundary : ");
	scanf("%d %d", &xmin, &ymin);
	printf("Enter (xmax, ymax) for clipping boundary : ");
	scanf("%d %d", &xmax, &ymax);
	initgraph(&gd, &gm, "");
	line(xmin, ymin, xmax, ymin);
	line(xmax, ymin, xmax, ymax);
	line(xmax, ymax, xmin, ymax);
	line(xmin, ymax, xmin, ymin);
	while(ch != 1000)
	{
		printf("Enter (x, y) to plot : ");
		scanf("%d %d", &x, &y);
		if(x>=xmin && y>=ymin && x<=xmax &&y<=ymax)
		{
			putpixel(x, y, RED);
		}
		printf("Enter 1000 to exit : ");
		scanf("%d", &ch);
	}
	delay(1000);
	closegraph();
}
