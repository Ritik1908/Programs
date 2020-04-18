#include<stdio.h>
#include<graphics.h>

void main()
{
	int x1, x2, x3, y1, y2, y3;
	int gd = DETECT, gm;
	printf("Enter \'A\' coordinate value of triange : ");
	scanf("%d %d", &x1, &y1);
	printf("Enter \'B\' coordinate value of triange : ");
	scanf("%d %d", &x2, &y2);
	printf("Enter \'C\' coordinate value of triange : ");
	scanf("%d %d", &x3, &y3);
	initgraph(&gd, &gm, "");
	line(0, 250, 500, 250);
	line(250, 0, 250, 500);
	// Printing initial triangle before reflection
	line(x1+250, -y1+250, x2+250, -y2+250);
	line(x2+250, -y2+250, x3+250, -y3+250);
	line(x3+250, -y3+250, x1+250, -y1+250);
	//Triangle after reflection in y axis
	line(x1+250, y1+250, x2+250, y2+250);
	line(x2+250, y2+250, x3+250, y3+250);
	line(x3+250, y3+250, x1+250, y1+250);
	delay(2000);
	closegraph();
}