/*
In this program, monoalphabetic substitution cipher i.e the affine cipher is implemented.
For Affine Cipher the keys a and b are used, a and 26 must be co-prime.

Encryption Formula used: (ax + b) mod 26
Decruption Formula Used: (invere(a)*(x-b)) mod 26
Here x is given character in a string.

NOTE: Given implementation supports only characters in uppercase. Whitespace support is also implemented.
Author: Ritik Verma
*/
import java.io.*;
import java.util.*;

public class AffineCipher {
	
	private int a = 7;
	private int b = 2;
	
	// function to update a, b from default values
	void update(int newA, int newB) {
		a = newA;
		b = newB;
	}

	// Function to find GCD of two numbers
	static int gcd(int num1, int num2) 
    { 
        // Everything divides 0  
        if (num1 == 0 || num2 == 0) {
            return 0; 
        }
          
        // base case 
        if (num1 == num2) {
            return num1; 
        }
          
        // a is greater 
        if (num1 > num2) {
            return gcd(num1-num2, num2); 
        }
                  
        return gcd(num1, num2-num1); 
    } 
      
    // Function to check if two numbers are co-prime or not
    static boolean coprime(int a, int b) { 
        if (gcd(a, b) == 1) {
        	return true;
        } 
        return false;
    }
	
	// Function to get multiplicative inverse of a given number
	public static int getMultiplicativeInverse(int num) {
		num = num % 26;
		for(int i = 0; i < 26; i++) {
			if((num * i) % 26 == 1) {
				return i;
			} 
		}
		return 1;
	}
	
	// Function to encrypt given input string using affine cipher
	String encrypt(String inputText) {
		char c, shiftedChar;
		int i;
		int length = inputText.length();
		String encryptedText = "";
		for(i = 0; i < length; i++) {
			c = inputText.charAt(i);
			if(c != ' ') {
				shiftedChar = (char)((((a * ((int)c - 65)) + b) % 26) + 65);
				encryptedText = encryptedText + shiftedChar;
			} else {
				encryptedText = encryptedText + " ";
			}
		}
		return encryptedText;
	}
	
	// Function to decrypt given input string using affine cipher
	String decrypt(String inputText) {
		char c, shiftedChar;
		int i;
		String decryptedText = "";
		int length = inputText.length();
		int getAInverse = getMultiplicativeInverse(a);
		
		for(i = 0; i < length; i++) {
			c = inputText.charAt(i);
			if(c != ' ') {
				shiftedChar = (char)(((getAInverse * (((int)c + 65) - b)) % 26) + 65);
				decryptedText = decryptedText + shiftedChar;
			} else {
				decryptedText = decryptedText + " ";
			}
		}
		return decryptedText;
	}
	
	// Driver program
	public static void main(String args[]) {
		int choice;
		String inputText;

		AffineCipher cipher = new AffineCipher();
		Scanner sc = new Scanner(System.in);

		boolean run = true;
		do {
			System.out.println("\nYou have to enter number to perform the action:\n1 to update key value\n2 to encrypt\n3 to decrypt\n4 to terminate");
			System.out.print("Enter Your Choice: ");
			choice = Integer.parseInt(sc.nextLine());
			switch (choice) {
				case 1:
					System.out.print("Enter 'a' value: ");
					int a = Integer.parseInt(sc.nextLine());
					if(coprime(a, 26)) {
						System.out.print("Enter 'b' value: ");
						int b = Integer.parseInt(sc.nextLine());
						cipher.update(a, b);
					} else {
						System.out.println("Unsupported value for 'a'");
					}
					break;
				case 2:
					System.out.print("Enter text to encrypt: ");
					inputText = sc.nextLine();
					System.out.println("Encrypted Text: " + cipher.encrypt(inputText));
					break;
				case 3:
					System.out.print("Enter text to decrypt: ");
					inputText = sc.nextLine();
					System.out.println("Decrypted Text: " + cipher.decrypt(inputText));
					break;
				case 4:
					System.out.println("Terminating the program .....");
					run = false;
					break;
				default:
					System.out.println("Wrong choice, re-enter correct value");
			}
		} while(run);
	}
}
