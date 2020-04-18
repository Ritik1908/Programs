import java.io.*;

class loop
{
	int value()
	{
		static int x = 7;
		return x--;
	}
	
	public static void main(String args[])
	{
		for(value(); value(); value())
		{
			System.out.println(value());
		}
	}
} 
