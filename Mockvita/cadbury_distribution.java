import java.io.*;
import java.util.*;

public class cadbury_distribution {
	static int cadbury(int l, int w) {
		if(l == w) {
			return 1;
		}
		
		int xl = l;
		int xw = w;
		if(l > w) {
			xl = l-w;
		} else {
			xw = w-l;
		}
		return 1 + cadbury(xl, xw);
	}
	
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		int mn_l = sc.nextInt();
		int mx_l = sc.nextInt();
		int mn_w = sc.nextInt();
		int mx_w = sc.nextInt();
		int count = 0;
		for(int i = mn_l; i <= mx_l; i++) {
			for(int j = mn_w; j <= mx_w; j++) {
				count = count + cadbury(i, j);
			}
		}
		System.out.println(count);
	}
 }
