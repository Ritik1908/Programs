import java.io.*;
import java.util.*;

public class ColumnarTranspositionCipher {

	public static String encrypt(String input, String key) {
		String encryptedText = "";
		int keyLen = key.length();
		int inputLen = input.length();


		int noOfRows = (int)Math.floor(inputLen / keyLen);
		noOfRows = noOfRows + 1;

		char matrix[][] = new char[noOfRows][keyLen];
		int getCharIndex = 0;
		for(int i = 0; i < noOfRows; i++) {
			for(int j = 0; j < keyLen; j++)  {
				if(getCharIndex < inputLen) {
					matrix[i][j] = input.charAt(getCharIndex);
				} else {
					matrix[i][j] = '#';
				}
				getCharIndex++;
			}
		}

		char keyInChar[] = key.toCharArray();
		Arrays.sort(keyInChar);

		for(int i = 0; i < keyLen; i++) {
			for(int j = 0; j < noOfRows; j++) {
				encryptedText = encryptedText + matrix[j][key.indexOf(keyInChar[i])];
			}
		}

		return encryptedText;
	}

	public static String decrypt(String input, String key) {
		String decryptedText = "";
		int keyLen = key.length();
		int inputLen = input.length();


		int noOfRows = (int)Math.floor(inputLen / keyLen);
		char matrix[][] = new char[noOfRows][keyLen];
		
		char keyInChar[] = key.toCharArray();
		Arrays.sort(keyInChar);

		int getCharIndex = 0;
		for(int i = 0; i < keyLen; i++) {
			for(int j = 0; j < noOfRows; j++) {
				if(getCharIndex < inputLen) {
					matrix[j][key.indexOf(keyInChar[i])] = input.charAt(getCharIndex);
				}
				getCharIndex++;
			}
		}

		for(int i = 0; i < noOfRows; i++) {
			for(int j = 0; j < keyLen; j++) {
				if(matrix[i][j] != '#') {
					decryptedText = decryptedText + matrix[i][j];
				}	
			}
		}

		return decryptedText;
	}

	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);


		int choice;
	    String inputText;
	    String key = "HACK";
	    boolean run = true;
	    do {
	      System.out.println("\nYou have to enter number to perform the action\n1 to update key (Default HACK):\n2 to encrypt\n3 to decrypt\n4 to terminate");
	      System.out.print("Enter Your Choice: ");
	      choice = Integer.parseInt(sc.nextLine());
	      switch (choice) {
	      	case 1:
	      		System.out.print("Enter Key Value: ");
	      		key = sc.nextLine();
	      		System.out.println("Key updated successfully");
	      		break;
	        case 2:
	          System.out.print("Enter text to encrypt: ");
	          inputText = sc.nextLine();
	          System.out.println("Encrypted Text: " + encrypt(inputText, key));
	          break;
	        case 3:
	          System.out.print("Enter text to decrypt: ");
	          inputText = sc.nextLine();
	          System.out.println("Decrypted Text: " + decrypt(inputText, key));
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