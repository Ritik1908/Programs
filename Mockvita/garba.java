import java.util.*;
import java.io.*;

public class garba {
	
	static int[] switch_arr(int ar[], int arr[], int n) {
		int c[] = new int[n];
		for(int i = 0; i < n; i++) {
			int pos = arr[i]-1;
			c[pos] = ar[i];
		}
		return c;
	}
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		int test = sc.nextInt();
		for(int t = 0; t < test; t++) {
			int n = sc.nextInt();
			int arr[] = new int[n];
			for(int i = 0; i < n; i++) {
				arr[i] = sc.nextInt();
			}
			int cpyArray[] = arr.clone();
			// cpyArray = arr;
			
		
			int count = 0;
			do {
				count++;
				cpyArray = switch_arr(cpyArray, arr, n);
			
				System.out.println();
			} while(!Arrays.equals(arr, cpyArray));
			System.out.println(count);
		}
	}
}
