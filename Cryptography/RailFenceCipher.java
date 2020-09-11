import java.io.*;
import java.util.*;

class RailFenceCipher {
	public static int key = 2;

	public static void printArr(char arr[][]) {
		int rows = arr.length;
		for(int i = 0; i < rows; i++) {
			for(int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]+" ");
			}
			System.out.println();
		}
	}

	public static String encrypt(String input) {
		char ans[][] = new char[key][input.length()];
		int k = 0;
		String encryptedText = "";
		int changeIndexBy = 1;

		for(int i = 0; i < key; i++) {
			for(int j = 0; j < input.length(); j++) {
				ans[i][j] = '#';
			}
		}

		for(int i = 0; i < input.length(); i++) {
			ans[k][i] = input.charAt(i);
			if(k == key-1) {
				changeIndexBy = -1;
			}
			if(k == 0) {
				changeIndexBy = 1;
			}
			k = k + changeIndexBy;
		}
		printArr(ans);

		for(int i = 0; i < key; i++) {
			for(int j = 0; j < input.length(); j++) {
				if(ans[i][j] != '#') {
					encryptedText = encryptedText + ans[i][j];
				}
			}
		}
		return encryptedText;
	}

	public static String decrypt(String input) {
		char ans[][] = new char[key][input.length()];
		int k = 0;
		int changeIndexBy = 1;

		for(int i = 0; i < key; i++) {
			for(int j = 0; j < input.length(); j++) {
				ans[i][j] = '#';
			}
		}

		for(int i = 0; i < input.length(); i++) {
			ans[k][i] = '*';
			if(k == key-1) {
				changeIndexBy = -1;
			}
			if(k == 0) {
				changeIndexBy = 1;
			}
			k = k + changeIndexBy;
		}

		k = 0;
		for(int i = 0; i < key; i++) {
			for(int j = 0; j < input.length(); j++) {
				if(ans[i][j] == '*' && k < input.length()) {
					ans[i][j] = input.charAt(k);
					k++;
				}
			}
		}

		printArr(ans);

		String decryptedText = "";
		for(int i = 0; i < input.length(); i++) {
			for(int j = 0; j < key; j++) {
				if(ans[j][i] != '#') {
					decryptedText = decryptedText + ans[j][i];
				}
			}
		}

		return decryptedText;

	}

	public static void main(String args[]) {
		Scanner sc = new Scanner(System.in);


		int choice;
	    String inputText;
	    boolean run = true;
	    do {
	      System.out.println("\nYou have to enter number to perform the action\n1 to update key (Default 2):\n2 to encrypt\n3 to decrypt\n4 to terminate");
	      System.out.print("Enter Your Choice: ");
	      choice = Integer.parseInt(sc.nextLine());
	      switch (choice) {
	      	case 1:
	      		System.out.print("Enter Key Value: ");
	      		int newKey = Integer.parseInt(sc.nextLine());
	      		RailFenceCipher.key = newKey;
	      		System.out.println("Key updated successfully");
	      		break;
	        case 2:
	          System.out.print("Enter text to encrypt: ");
	          inputText = sc.nextLine();
	          System.out.println("Encrypted Text: " + encrypt(inputText));
	          break;
	        case 3:
	          System.out.print("Enter text to decrypt: ");
	          inputText = sc.nextLine();
	          System.out.println("Decrypted Text: " + decrypt(inputText));
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