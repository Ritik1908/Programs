import java.io.*;
import java.util.*;

public class bisection
{
	double func(double x)
	{
		return(Math.pow(x,3)-x-1);
	
	}
	
	void root()
	{
		double a = 1;
		double b = 2;
		double xn = 0;
		double xn2 = 0;
		do
		{
			 xn = xn2;
			 xn2 = (a+b)/2;
			 System.out.println(xn2);
			 xn2 = Math.round(xn2*1000000.0)/1000000.0;
			 if(func(xn2)<0)
			 {
			 	a = xn2;
			 }
			 else
			 {
			 	b = xn2;
			 }
			 System.out.println(xn2);
		}while(xn != xn2);
		System.out.println(xn2);
	}
	
	public static void main(String args[])
	{
		bisection ob = new bisection();
		ob.root();
	}
}
