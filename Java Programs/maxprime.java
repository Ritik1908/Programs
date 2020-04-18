/*long startTime = System.nanoTime();
long endTime   = System.nanoTime();
long totalTime = endTime - startTime;
System.out.println(totalTime);*/

/*package whatever //do not write package name here */

import java.util.*;
import java.lang.*;
import java.io.*;

class maxprime 
{
	public static boolean prime(long num)
	{
        	for(long i = 2; i <= Math.sqrt(num); i++)
        	{
            		if(num%i == 0)
            		{
                		return false;
            		}
        	}
        	return true;
    	}
    	
    	// function to find largest prime factor 
    	static long maxPrimeFactors(long n) 
    	{ 
        	// Initialize the maximum prime 
        	// factor variable with the 
        	// lowest one 
        	long maxPrime = -1; 
  
        	// Print the number of 2s 
        	// that divide n 
        	while (n % 2 == 0) 
        	{ 
            		maxPrime = 2; 
  
            		// equivalent to n /= 2 
            		n >>= 1; 
        	} 
  
        	// n must be odd at this point, 
        	// thus skip the even numbers 
        	// and iterate only for odd 
        	// integers 
        	for (int i = 3; i <= Math.sqrt(n); i += 2) 
        	{ 
            		while (n % i == 0) 
            		{ 
                		maxPrime = i; 
                		n = n / i; 
            		} 
        	} 
  
        	// This condition is to handle 
        	// the case when n is a prime 
        	// number greater than 2 
        	if (n > 2) 
            		maxPrime = n; 
  
        	return maxPrime; 
    	} 
    	
	public static void main (String[] args)throws IOException 
	{
		//code
		long startTime = System.nanoTime();
		InputStreamReader read = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(read);
		int t = Integer.parseInt(br.readLine());
		long max = 0;
		for(int i = 0; i < t; i++)
		{
		    long n = Long.parseLong(br.readLine());
		    /*if(n == 2)
		    {
		        System.out.println("2");
		    }
		    else
		    {
		    	for(long j = 3; j < n; j=j+2)
		    	{
		        	if(prime(j) && n%j == 0)
		        	{
		            		max = j;
		        	}
		    	}
		    	System.out.println(max);
		     }*/
		     max = maxPrimeFactors(n);
		     System.out.println(max);
		}
		long endTime   = System.nanoTime();
		long totalTime = (endTime - startTime)/1000000000;
		System.out.println(totalTime);
	}
}

