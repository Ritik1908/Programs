/*
	Basic Euclidean Algorithm is implemented overhere. It is used to find Greatest Common Divisor (GCD) of two numbers.
*/

import java.io.*;
import java.util.*;

public class Euclidean {
	public static int gcd(int num1, int num2) {
		if(num1 == 0) {
			return num2;
		}
		return gcd(num2%num1, num1);
	}

	public static void main(String args[]) {
		int num1, num2;
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter num 1: ");
		num1 = sc.nextInt();
		System.out.print("Enter num 2: ");
		num2 = sc.nextInt();

		System.out.println("GCD = "+gcd(num1, num2));
	} 
}