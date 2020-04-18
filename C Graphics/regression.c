#include <graphics.h>
#include <stdio.h>

void main()
{
	int n, i;
	int xy = 0;
	int sumx = 0;
	int x2 = 0;
	int sumy = 0;
	int y2 = 0;
	float bxy, byx, meanx, meany, yincyx, xincyx, xincxy, yincxy;
	int *x;
	int *y;
	int gd = DETECT, gm;
	printf("***********************************************************************\n");
	printf("Enter Number of Observations : ");
	scanf("%d", &n);
	x = (int*)malloc(n*sizeof(int));
	y = (int*)malloc(n*sizeof(int));
	printf("Enter observations of x column :\n");
	for(i = 0; i < n; i++)
	{
		scanf("%d", (x+i));
	}
	printf("Enter observations of y column :\n");
	for(i = 0; i < n; i++)
	{
		scanf("%d", (y+i));
	}
	printf("***********************************************************************\n");
	printf("-----------------------------------------\n");
	printf("|X\t|Y\t|XY\t|X2\t|X2\t|\n");
	printf("-----------------------------------------\n");
	for(i = 0; i < n; i++)
	{
		xy = xy + ((*(x+i))*(*(y+i)));
		sumx = sumx + (*(x+i));
		sumy = sumy + (*(y+i));
		x2 = x2 + ((*(x+i))*(*(x+i)));
		y2 = y2 + ((*(y+i))*(*(y+i)));
		printf("|%d\t|%d\t|%d\t|%d\t|%d\t|\n", *(x+i), *(y+i), ((*(x+i))*(*(y+i))), ((*(x+i))*(*(x+i))), ((*(y+i))*(*(y+i))));
	}
	printf("-----------------------------------------\n");
	printf("Sum of X column = %d\n", sumx);
	printf("Sum of Y column = %d\n", sumy);
	printf("Sum of XY column = %d\n", xy);
	printf("Sum of X2 column = %d\n", x2);
	printf("Sum of Y2 column = %d\n", y2);
	meanx = (float)sumx/n;
	meany = (float)sumy/n;
	printf("Mean of X = %.2f\n", meanx);
	printf("Mean of Y = %.2f\n\n", meany);
	printf("***********************************************************************\n");
	printf("Regression equation of y on x\n");
	byx = (float)((n*xy)-(sumx*sumy))/((n*x2)-(sumx*sumx));
	printf("byx = %.2f\n", byx);
	yincyx = -(byx*meanx)+meany;
	xincyx = -(yincyx/byx);
	printf("RED colour line on graph displays regression equation of y on x\n");
	printf("Regression equation of y on x is : \"y = %.2fx + %.2f\"\n", byx, yincyx);
	printf("***********************************************************************\n");
	printf("Regression equation of x on y\n");
	bxy = (float)((n*xy)-(sumx*sumy))/((n*y2)-(sumy*sumy));
	printf("byx = %.2f\n", bxy);
	xincxy = -(bxy*meany)+meanx;
	yincxy = -(xincxy/bxy);
	printf("BLUE colour line on graph displays regression equation of y on x\n");
	printf("Regression equation of x on x is : \"y = %.2fx + %.2f\"\n", bxy, xincxy);
	printf("***********************************************************************\n");
	yincyx = abs(yincyx);
	yincxy = abs(yincxy);
	xincxy = abs(xincxy);
	xincyx = abs(xincyx);
	initgraph(&gd, &gm, "");
	for(i = 0; i < n; i++)
	{
		putpixel(*(x+i),*(y+i), WHITE);
	}
	setcolor(RED);
	line((int)xincyx, 0, 0, (int)yincyx);
	setcolor(BLUE);
	line((int)xincxy, 0 , 0, (int)yincxy);
	delay(10000);
	closegraph();
	/*for(i = 0; i < n; i++)
	{
		printf("%d ", *(x+i));
	}
	printf("\n");
	for(i = 0; i < n; i++)
	{
		printf("%d ", *(y+i));
	}
	printf("\n");*/
}
