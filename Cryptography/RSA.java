import java.io.*;
import java.util.*;
import java.math.BigDecimal; 

public class RSA {

	static BigDecimal gcd(BigDecimal a, BigDecimal b) {
		if (b.equals(new BigDecimal("0")))
			return a;
	     	return gcd(b, a.remainder(b));
	}
	
	static String convertToNumber(String str) {
		String number = "";
		for(int i = 0; i < str.length(); i++) {
			int num = (int)str.charAt(i) - 65;
			number = number + num;
		}
		return number;
	}
	
	
	static void encrypt(BigDecimal e, BigDecimal n) {
		System.out.print("Enter message text: ");
		String msgInput = convertToNumber(sc.nextLine());
		BigDecimal msg = new BigDecimal(msgInput);
		
		BigDecimal encrypted = msg.pow(e.intValue());
		encrypted = encrypted.remainder(n);
		System.out.println("Encrypted Text: "+encrypted);
	}
	
	static void decrypt(BigDecimal d, BigDecimal n) {
		System.out.print("Enter Encrypted Number: ");
		String msgText = sc.nextLine();
		
		BigDecimal encrypted = new BigDecimal(msgText);
		BigDecimal decrypted = encrypted.pow(d.intValue());
		decrypted = decrypted.remainder(n);
		System.out.println("Decrypted Text: "+decrypted);
	}
    	
    	static Scanner sc = new Scanner(System.in);
    	
	public static void main(String args[]) {
		
		System.out.print("Enter P: ");
		BigDecimal p = new BigDecimal(sc.nextLine());
		System.out.print("Enter Q: ");
		BigDecimal q = new BigDecimal(sc.nextLine());
		
		BigDecimal n = p.multiply(q);
		
		BigDecimal e = new BigDecimal("343");
		BigDecimal phi = p.subtract(BigDecimal.ONE).multiply(q.subtract(BigDecimal.ONE));
		
		BigDecimal cpy_e = e;
		BigDecimal cpy_phi = phi;
		
		while(cpy_e.compareTo(cpy_phi) < 0) {
			if(gcd(cpy_e, cpy_phi).equals(BigDecimal.ONE)) {
				break;
			} else {
				cpy_e = cpy_e.add(BigDecimal.ONE);
			}
		}
		
		e = cpy_e;
		
		BigDecimal k = new BigDecimal("2");
		BigDecimal d = BigDecimal.ONE.add(k.multiply(phi)).divide(e, 2);
		System.out.print("Enter 1 to Encrypt, Enter 2 to Decrypt.\nEnter Choice: ");
		int choice = Integer.parseInt(sc.nextLine());
		if(choice == 1) 
			encrypt(e, n);
		else
			decrypt(d, n);
	}
}
