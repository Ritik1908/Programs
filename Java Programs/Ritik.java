import java.util.*;

class Threadx extends Thread
{
	Thread t;
	Threadx(String val)
	{
		t=new Thread(this, val);
		t.start();
	}
	
	public void run()
	{
		synchronized(t)
		{
			try
			{
				for(int i = 0; i < 3; i++)
				{
					System.out.println(t.getName());
					Thread.sleep(100);
				}
			}
			catch(InterruptedException e)
			{
				System.out.println("Error");
			}
		}
	}
}

class Ritik
{
	public static void main(String args[])
	{
		new Threadx("0");
		new Threadx("1");
	}
}
