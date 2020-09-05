import java.io.*;
import java.util.*; 

public class caesar_cipher {

	public static String encrypt(String text, int key) {
		String encrypted_text = "";
		for(int i = 0; i < text.length(); i++) {
			int shift = ((int)text.charAt(i) - 65 + key) % 26;
			encrypted_text  = encrypted_text + (char)(shift+65);
		}
		return encrypted_text;
	}
	
	public static String decrypt(String text, int key) {
		String decrypted_text = "";
		for(int i = 0; i < text.length(); i++) {
			int shift = ((int)text.charAt(i) - 65 + 26 - key) % 26;
			decrypted_text  = decrypted_text + (char)(shift+65);
		}
		return decrypted_text;
	}
	
	
	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);
		System.out.print("Enter 1  for encryption and 2 for decryption: ");
		int choice = Integer.parseInt(sc.nextLine());
		System.out.print("Enter plain text: ");
		String text = sc.nextLine();
		System.out.print("Enter Key Value: ");
		int key = sc.nextInt();
		
		switch (choice) {
			case 1: 
				System.out.println("Encrypted Text: "+encrypt(text, key));
				break;
			case 2:
				System.out.println("Decrypted Text: "+decrypt(text, key));
				break;
			default:
				System.out.println("Wrong input");
		}
		
	
	}
}
