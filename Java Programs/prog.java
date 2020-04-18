import java.math.*;
class prog
{
	static int a[]=new int[30];
	public static void main(String args[])
	{
		
		BigInteger val=new BigInteger("1");
		for(int i=0;i<30;i++)//assigns all elements=1(true)
			a[i]=1;
		for(int i=30;i>0;i--)
		{
			if(a[i-1] != 0)//if array element not 0
			{
				//System.out.println(i);
				BigInteger t=new BigInteger(Integer.toString(i));
				val=val.multiply(t);//multiply
				System.out.println(val);
				change(i);
			}

		}
		/*boolean f=true;
		for(int i=1;i<=30;i++)
		{
			BigInteger t=new BigInteger(Integer.toString(i));
			if(!((val.mod(t)).equals(0)))
				f=false;
		}
		if(f)
			System.out.println(val);
		if(!f)
			System.out.println("Not divisible");*/
		System.out.println(val);
	}
	static void change(int n)//method to change existing factors into false values
	{
		for(int i=2;i<n;i++)
		{
			if(n%i==0)
			{
				a[i-1]=0;
			}
		}
	}
}
