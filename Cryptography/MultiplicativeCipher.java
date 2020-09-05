import java.io.*;
import java.util.*;

public class MultiplicativeCipher {
	
	public static int getMultiplicativeInverse(int num) {
		num = num % 26;
		for(int i = 1; i < 26; i++) {
			if((num*i)%26 == 1) {
				return i;
			}
		}
		return 1;
	}
	
	public static String encrypt(String plainText, int key) {
		String encryptedText = "";
		for(int i = 0; i < plainText.length(); i++) {
			char c = plainText.charAt(i);
			int swapBy = (((int)c-65) * key) % 26;
			char shiftedCharacter = (char)(swapBy+65);
			encryptedText = encryptedText + shiftedCharacter;
		} 
		return encryptedText;
	}
	
	public static String decrypt(String encryptedText, int key) {
		String decryptedText = "";
		int getInverse = getMultiplicativeInverse(key);
		
		for(int i = 0; i < encryptedText.length(); i++) {
			int charPosition = (int)encryptedText.charAt(i) - 65;
			
			int swapBy = (getInverse * charPosition) % 26;
			
			decryptedText = decryptedText + (char)(swapBy + 65);
		}
		return decryptedText;
	}
	
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("Enter 1 to encrypt or 2 to decrypt text: ");
		int choice = Integer.parseInt(sc.nextLine());
		if(choice == 1) {
			System.out.print("Enter input string: ");
			String input = sc.nextLine();
			System.out.print("Enter key value: ");
			int key = sc.nextInt();
			System.out.println(encrypt(input, key));
		} else if (choice == 2) {
			System.out.print("Enter input string: ");
			String input = sc.nextLine();
			System.out.print("Enter key value: ");
			int key = sc.nextInt();
			System.out.println(decrypt(input, key));
		} else {
			System.out.println("Wrong choice.");
		}
	}
}
