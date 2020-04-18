import java.io.*;
import java.util.Scanner;

class CentralTendency
{
	/*
	x (float) :- array of data elements of x column
	f (int) :- array of data elements of f column
	xl (float) :- array of lower limit of each row in class interval column
	xh (float) :- array of upper limit of each row in class interval column
	void table(); //To make borders for table
	void design(); //To make seperation between two segments of code
	void nextLine(); //To transfer control to next line
	int numberOfObservations(); //Ask user for total number of observation
	void inputIndividual(float x[], int n); //To take user input for individual data format
	void inputDiscrete(float x[], int f[], int n); //To take user input for discrete data format
	void inputContinuous(float xl[], float xh[], int f[], int n); //To take user input for continuous data format
	float sumIndividual(float x[], int n); //To calculate total sum of an given array
	float meanIndividual(float x[], int n); //To calculate mean of an given array 
	void displayMeanIndividual(); //To calculate and display mean for individual case in table format
	void displayMeanDiscrete(); //To calculate and display mean for discrete case in table format
	*/
	
	Scanner sc = new Scanner(System.in);

	//To make data look like in table form
	void table()
	{
		System.out.println("----------------------------------------------------------------------------------------------------");
	}
	
	//Seperation between two calculations
	void design()
	{
		System.out.println("\n***********************************************************************************************\n");
	}
	
	//To shift to next line
	void nextLine()
	{
		System.out.println("");
	}
	
	//To Ask User for Total Number Of Observation
	int numberOfObservations()
	{
		System.out.print("Enter Number of Elements : ");
		int n = sc.nextInt();
		return n;
	}
	
	//To take input in individual data format
	void inputIndividual(float x[], int n)
	{
		System.out.println("Enter data : ");
		for(int i = 0; i < n; i++)
		{
			x[i] = sc.nextFloat();
		}
		nextLine();
	}
	
	//To take input in discrete data format
	void inputDiscrete(float x[], int f[], int n)
	{
		System.out.println("Enter all Values of 'X' Column");
		for(int i = 0; i < n; i++)
		{
			x[i] = sc.nextFloat();
		}
		System.out.println("Enter all Values of 'f' Column");
		for(int i = 0; i < n; i++)
		{
			f[i] = sc.nextInt();
		}
		nextLine();
	}
	
	//To take input for continuous data format
	void inputContinuous(float xl[], float xh[], int f[], int n)
	{
		System.out.println("Enter all Lower Limit of CI");
		for(int i = 0; i < n; i++)
		{
			xl[i] = sc.nextFloat();
		}
		System.out.println("Enter all Higher Limit of X");
		for(int i = 0; i < n; i++)
		{
			xh[i] = sc.nextFloat();
		}
		System.out.println("Enter all Values of 'f' Column");
		for(int i = 0; i < n; i++)
		{
			f[i] = sc.nextInt();
		}
		nextLine();
	}
	
	//To calculate the sum of individual column
	float sumIndividual(float x[], int n)
	{
		float sum = 0;
		for(int i = 0; i < n; i++)
		{
			sum = sum + x[i];
		}
		return sum;
	}
	
	//To calculate mean of individual column
	float meanIndividual(float x[], int n)
	{
		
		return (sumIndividual(x,n)/n);
	}
	
	//To display mean for inidividual data format
	void displayMeanIndividual()
	{
		design();
		System.out.println("\t\tMEAN FOR INDIVIDUAL CASE.\n");
		int n = numberOfObservations();
		float x[] = new float[n];
		inputIndividual(x, n);
		float sum = 0;
		table();
		System.out.println("|X\t|");
		table();
		for(int i = 0; i < n; i++)
		{
			System.out.println("|"+x[i]+"\t|");
			sum = sum + x[i];
		}
		table();
		System.out.println("Sum = "+sum);
		System.out.println("Mean for Individual Case = "+(sum/n));
		design();
	}	
	
	//To display mean for discrete data format
	void displayMeanDiscrete()
	{
		design();
		System.out.println("\t\tMEAN FOR DISCRETE CASE.\n");
		int n = numberOfObservations();
		float x[] = new float[n];
		int f[] = new int[n];
		float Xf[] = new float[n];
		inputDiscrete(x, f, n);
		float sumXf = 0;
		int N = 0;
		table();
		System.out.println("|X\t|f\t|Xf\t|");
		table();
		for(int i = 0; i < n; i++)
		{
			Xf[i] = (x[i]*f[i]);
			sumXf = sumXf + Xf[i];
			N = N + f[i];
			System.out.println("|"+x[i]+"\t|"+f[i]+"\t|"+Xf[i]+"\t|");
		}
		//To display the mean discrete format
		table();
		System.out.println("Sum f = "+N);
		System.out.println("Sum Xf = "+sumXf);
		System.out.println("Mean for discrete case = "+(sumXf/N));
		design();
	}
	
	//To display mean for continuous data format
	void displayMeanContinuous()
	{
		design();
		System.out.println("\t\tMEAN FOR CONTINUOUS CASE.\n");
		int n = numberOfObservations();
		float xl[] = new float[n];
		float xh[] = new float[n];
		int f[] = new int[n];
		float x[] = new float[n];
		int Xf[] = new int[n];
		inputContinuous(xl, xh, f, n);
		float sumXf = 0;
		int N = 0;
		table();
		System.out.println("|C.I\t\t|x\t|f\t|Xf\t|");
		table();
		for(int i = 0; i < n; i++)
		{
			x[i] = (xl[i]+xh[i])/2;
			Xf[i] = (((float)f[i])*x[i]);
			sumXf = sumXf + Xf[i];
			N = N + f[i];
			System.out.println("|"+xl[i]+"-"+xh[i]+"\t|"+x[i]+"\t|"+f[i]+"\t|"+Xf[i]+"\t|");
		}
		table();
		System.out.println("Sum f = "+N);
		System.out.println("Sum Xf = "+sumXf);
		System.out.println("Mean for continuous case = "+(sumXf/N));
		design();
	}
	
	/*
	//To sort the array in ascending format
	void sort(float x[], int n)
	{
		float temp;
		for (int i = 0; i < n; i++) 
        	{
            		for (int j = i + 1; j < n; j++) 
            		{
                		if (x[i] > x[j]) 
                		{
                    			temp = x[i];
                    			x[i] = x[j];
                    			x[j] = temp;
                		}
            		}
        	}
        }
        
        //To find index of cumulative frequency
	int cfSearch(float cf[], int n, float key)
	{
		for(int i = 0; i < n; i++)
		{
			if(cf[i] > key)
			{
				return i;
			}
		}
		return -1;
	}
	
	//To display a array in single line
	void displayArray(float x[], int n)
	{
		for(int i = 0; i < n; i++)
		{
			if(i == n-1)
			{
				System.out.print(x[i]+".");
			}
			else
			{
				System.out.print(x[i]+", ");
			}
		}
		nextLine();
	}
	
	//To calculate and show median for Individual Case
	void displayMedianIndividual()
	{
		int n = numberOfObservations();
		float x[] = new float[n];
		inputIndividual(x, n);
		float median;
		design1();
		System.out.println("\t\tMEDIAN FOR INDIVIDUAL CASE.\n");
		System.out.print("Data :- ");
		displayArray(x, n);
		sort(x, n);
		System.out.print("Sorted Data :- ");
		displayArray(x, n);
		if(n%2 == 0)
		{
			System.out.println("Since, Number Of Observation is even.");
			median = (x[(n/2)-1]+x[((n/2)+1)-1])/2;
		}
		else
		{
			System.out.println("Since, Number Of Observation is odd.");
			median = x[((n+1)/2)-1];
		}
		System.out.println("Median = "+median);
		design1();
	}
	
	//To display median for discrete data format
	void displayMedianDiscrete()
	{
		design1();
		System.out.println("\t\tMEDIAN FOR DISCRETE CASE.\n");
		int n = numberOfObservations();
		float x[] = new float[n];
		float f[] = new float[n];
		float cf[] = new float[n];
		inputDiscrete(x, f, n);
		float N = 0;
		for(int i = 0; i < n; i++)
		{
			if(i == 0)
			{
				cf[i] = f[i];
			}
			else
			{
				cf[i] = cf[i-1]+f[i];
			}
			N = N + f[i];
		}
		//To display the median discrete format
		design();
		System.out.println("|X\t|f\t|cf\t|");
		for(int i = 0; i < n; i++)
		{
			System.out.println("|"+x[i]+"\t|"+f[i]+"\t|"+cf[i]+"\t|");
		}
		design();
		System.out.println("Sum f = "+N);
		int pos = cfSearch(cf, n, (N/2));
		System.out.println("Meadian for discrete case = "+x[pos]);
		design1();
	}
	
	//To display mean for continuous data format
	void displayMedianContinuous()
	{
		design1();
		System.out.println("\t\tMEDIAN FOR CONTINUOUS CASE.\n");
		int n = numberOfObservations();
		float xl[] = new float[n];
		float xh[] = new float[n];
		float f[] = new float[n];
		float cf[] = new float[n];
		inputContinuous(xl, xh, f, n);
		float N = 0;
		for(int i = 0; i < n; i++)
		{
			if(i == 0)
			{
				cf[i] = f[i];
			}
			else
			{
				cf[i] = cf[i-1]+f[i];
			}
			N = N + f[i];
		}
		//To display the median continuous format
		design();
		System.out.println("|CI\t\t|f\t|cf\t|");
		for(int i = 0; i < n; i++)
		{
			System.out.println("|"+xl[i]+"-"+xh[i]+"\t|"+f[i]+"\t|"+cf[i]+"\t|");
		}
		design();
		System.out.println("Sum f = "+N);
		int pos = cfSearch(cf, n, (N/2));
		float median;
		System.out.println("h = "+(xh[pos]-xl[pos]));
		System.out.println("l = "+xl[pos]);
		System.out.println("N/2 = "+(N/2));
		System.out.println("c = " + cf[pos-1]);
		if(pos == 0)
		{
			median=xl[pos]+(((xh[pos]-xl[pos])/f[pos])*(N/2));
		}
		else
		{
			median=xl[pos]+(((xh[pos]-xl[pos])/f[pos])*((N/2)-cf[pos-1]));
		}
		System.out.println("Median for continuous case = "+median);
		design1();
	}
	
	// To calculate frequency of each element in array
	void frequency(float x[], int freq[], int n)
	{ 
        	int visited = -1;
        	for(int i = 0; i < n; i++)
        	{  
            		int count = 1;  
            		for(int j = i+1; j < n; j++)
            		{  
                		if(x[i] == x[j])
                		{  
                    			count++;
                    			//To avoid counting same element again  
                    			freq[j] = visited;  
                		}
            		}  
            		if(freq[i] != visited)
            		{
                		freq[i] = count;
                	}
                }  
        }
        
        //To find index of maximum frequency
        int maxFrequency(float f[], int n)
        {
        	float max = 0;
        	for(int i = 0; i < n; i++)
        	{
        		int check = 0;
        		for(int j = i+1; j < n; j++)
        		{
        			if(f[j] > f[i])
        			{
        				check = 1;
        			}
        		}
        		if(check == 0)
        		{
        			return i;
        		}
        	}
        	return -1;
        }
        //To calculate and show mode for Individual Case
	void displayModeIndividual()
	{
		int n = numberOfObservations();
		float x[] = new float[n];
		inputIndividual(x, n);
		design1();
		System.out.print("Data : ");
		displayArray(x, n);
		float mode = 0;
		int maxCount = 0;
		for (int i = 0; i < n; ++i)
		{
			int count = 0;
			for (int j = 0; j < n; ++j) 
            		{
                		if (x[j] == x[i])
                    		++count;
            		}
            		if (count > maxCount) 
            		{
                		maxCount = count;
                		mode = x[i];
            		}
        	}
        	System.out.println("Mode = "+mode);
		design1();
	}
	
	//To display mode for discrete data format
	void displayModeDiscrete()
	{
		design1();
		System.out.println("\t\tMODE FOR DISCRETE CASE.\n");
		int n = numberOfObservations();
		float x[] = new float[n];
		float f[] = new float[n];
		inputDiscrete(x, f, n);
		//To display the mode discrete format
		design();
		System.out.println("|X\t|f\t|");
		for(int i = 0; i < n; i++)
		{
			System.out.println("|"+x[i]+"\t|"+f[i]+"\t|");
		}
		design();
		int pos = maxFrequency(f, n);
		System.out.println("Mode for discrete case = "+x[pos]);
		design1();
	}
	
	//To display mode for continuous data format
	void displayModeContinuous()
	{
		design1();
		System.out.println("\t\tMODE FOR CONTINUOUS CASE.\n");
		int n = numberOfObservations();
		float xl[] = new float[n];
		float xh[] = new float[n];
		float f[] = new float[n];
		inputContinuous(xl, xh, f, n);
		//To display the mode continuous format
		design();
		System.out.println("|CI\t\t|f\t|");
		for(int i = 0; i < n; i++)
		{
			System.out.println("|"+xl[i]+"-"+xh[i]+"\t|"+f[i]+"\t|");
		}
		design();
		int pos = maxFrequency(f, n);
		if(pos == 0 || pos == n-1)
		{
			System.out.println("Mode ill-defined");
		}
		else
		{
			float mode = xl[pos]+(((f[pos]-f[pos-1])/((2*f[pos])-f[pos-1]-f[pos+1]))*(xh[pos]-xl[pos]));
			System.out.println("Mode for discrete case = "+mode);
		}
		design1();
	}
	*/
	
	public static void main(String[] args)
	{
		int n;
		Scanner ms = new Scanner(System.in);
		CentralTendency ob = new CentralTendency();
		ob.design();
		System.out.println("1) Press '1' to calculate Mean for Individual Case.");
		System.out.println("2) Press '2' to calculate Mean for Discrete Case.");
		System.out.println("3) Press '3' to calculate Mean for Continuous Case.");
		System.out.println("4) Press '4' to calculate Median for Individual Case.");
		System.out.println("5) Press '5' to calculate Median for Discrete Case.");
		System.out.println("6) Press '6' to calculate Median for Continuous Case.");
		System.out.println("7) Press '7' to calculate Mode for Individual Case.");
		System.out.println("2) Press '8' to calculate Mode for Discrete Case.");
		System.out.println("3) Press '9' to calculate Mode for Continuous Case.");
		System.out.print("Enter Choice : ");
		int ch = ms.nextInt();
		ob.design();
		switch (ch)
		{
			case 1 :
			{
				ob.displayMeanIndividual();
				break;
			}
			case 2 :
			{
				ob.displayMeanDiscrete();
				break;
			}
			/*case 3 :
			{
				ob.displayMeanContinuous();
				break;
			}
			case 4 :
			{
				ob.displayMedianIndividual();
				break;
			}
			case 5 :
			{
				ob.displayMedianDiscrete();
				break;
			}
			case 6 :
			{
				ob.displayMedianContinuous();
				break;
			}
			case 7 :
			{
				ob.displayModeIndividual();
				break;
			}
			case 8 :
			{
				ob.displayModeDiscrete();
				break;
			}
			case 9 :
			{
				ob.displayModeContinuous();
				break;
			}*/
			default:
			{
				System.out.println("Wrong Choice!!");
			}
		}
	}
}
