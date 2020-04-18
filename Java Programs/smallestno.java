import java.io.*;

public class smallestno
{
	public static void main(String args[])
	{
		long startTime = System.nanoTime();
		for(int i=1; i>0; i++)
		{
			System.out.println(i);
			if(i%1==0 && i%2==0 && i%3==0 && i%4==0 && i%5==0 && i%6==0 && i%7==0 && i%8==0 && i%9==0 && i%10==0 && i%11==0 && i%12==0 && i%13==0 && i%14==0 && i%15==0 && i%16==0 && i%17==0 && i%18==0 && i%19==0 && i%20==0 && i%21==0 && i%22==0 && i%23==0 && i%24==0 && i%25==0 && i%26==0 && i%27==0 && i%28==0 && i%29==0 && i%30==0)
			{
				System.out.println(i);
				break;
			}
		}
		long endTime   = System.nanoTime();
		long totalTime = endTime - startTime;
		System.out.println(totalTime);
	}
}
