#include<graphics.h>
#include<stdio.h>

void main()
{
	int i, j , k, l, m=0;
	int start = 120;
	int dif = start-25;
	int gd = DETECT, gm;
	initgraph(&gd, &gm, "");

	setcolor(14);

	int xc = 250;
	int yc = 200;

	circle(xc, yc, 100);
	floodfill(xc, yc, 14);
	setcolor(0);
	circle(xc-50, yc-25, 10);
	floodfill(xc-50, yc-25, 0);
	circle(xc+50, yc-25, 10);
	floodfill(xc+50, yc-25, 0);
	arc(xc, yc+25, 0, 180 , 50);
	delay(1000);
	cleardevice();

	int check = 1;
	int check2 = 0;
	int mid;
	k=10;
	for(i = start, j = start; i > 24; i--, j++)
	{
		if(check%5 == 0)
		{
			k--;
			check++;
		}
		check++;
		for(l=i; l<=j; l++)
		{
			putpixel(l+xc, -k+yc, RED);
			putpixel(l+xc, -k+yc, RED);
			putpixel(-l+xc+50, -k+yc, RED);
			putpixel(-l+xc+50, -k+yc, RED);
		}
	}
	mid = k;
	for(j = start+dif; j > 24; j--)
	{
		if(check%4 == 0)
		{
			k--;
			check++;
		}
		check++;
		for(l=25; l<=j; l++)
		{
			putpixel(l+xc, -k+yc, RED);
			putpixel(l+xc, -k+yc, RED);
			putpixel(-l+xc+50, -k+yc, RED);
			putpixel(-l+xc+50, -k+yc, RED);
		}
	}
	delay(100);
	setcolor(0);

	for(m = 0; m < 5; m++)
	{
			line(start-dif+xc+m, -mid+yc, start-dif+xc+m+25, -mid+20+yc);
			line(start-dif+xc+m+25, -mid+20+yc, start-dif+xc+m-25, -mid+40+yc);
			line(start-dif+xc+m-25, -mid+40+yc, start-dif+xc+m, -k+yc);
			delay(500);
	}

	cleardevice();

	setcolor(14);
	circle(xc, yc, 100);
	floodfill(xc, yc, 14);
	setcolor(0);
	circle(xc-50, yc-25, 10);
	floodfill(xc-50, yc-25, 0);
	circle(xc+50, yc-25, 10);
	floodfill(xc+50, yc-25, 0);
	arc(xc, yc+50, 180, 360 , 50);
	for(int i = 0; i < 50 ; i++)
	{
		circle(xc-50, yc-25+i, 1);
		floodfill(xc-50, yc-25+i, 0);
		circle(xc+50, yc-25+i, 1);
		floodfill(xc+50, yc-25+i, 0);
		delay(50);
	}
	delay(10000);
	cleardevice();


	/*
	cleardevice();

	for(m=10; m > 0; m--)
	{
		if(check2%2 == 0)
		{
			start = 110;
		}
		else
		{
			start = 100;
		}
		check = 1;
		k=10;
		for(i = start, j = start; i > 24; i--, j++)
		{
			if(check%5 == 0)
			{
				k--;
				check++;
			}
			check++;
			for(l=i=; l<=j; l++)
			{
				putpixel(l+xc, -k+yc, RED);
				putpixel(l+xc, -k+yc, RED);
				putpixel(-l+xc+50, -k+yc, RED);
				putpixel(-l+xc+50, -k+yc, RED);
			}
		}
		if(check2%2 == 0)
		{
			k=-11;
			check2++;
		}
		else
		{
			k = -8;
			check2++;
		}
		for(j = start+75; j > 24; j--)
		{
			if(check%4 == 0)
			{
				k--;
				check++;
			}
			check++;
			for(l=25; l<=j; l++)
			{
				putpixel(l+xc, -k+yc, RED);
				putpixel(l+xc, -k+yc, RED);
				putpixel(-l+xc+50, -k+yc, RED);
				putpixel(-l+xc+50, -k+yc, RED);
			}	
		}
		cleardevice();
		delay(10);
	}
*/
	delay(3000);
	closegraph();
}