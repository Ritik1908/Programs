import java.io.*;
import java.util.*;

public class swayamvar {
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		int n = Integer.parseInt(sc.nextLine());
		String brides = new String(sc.nextLine());
		StringBuilder grooms = new StringBuilder(sc.nextLine());
		
		int matched = 0;
		for(int i = 0; i < n; i++) {
			char b = brides.charAt(i);
			int m_g = grooms.indexOf(Character.toString(b));
			if(m_g == -1) {
				break;
			} else {
				grooms.setCharAt(m_g, ' ');
				matched++;
			}
		}
		
		System.out.print(n-matched);
	}
}
