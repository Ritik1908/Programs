import java.lang.*;
import java.util.*;

public class AutoKey {
  private static final String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  public static String autoEncryption (String msg, String key) {
    int len = msg.length ();

    // generating the keystream 
    String newKey = key.concat (msg);
    newKey = newKey.substring (0, newKey.length () - key.length ());
    String encryptMsg = "";

    // applying encryption algorithm 
    for (int x = 0; x < len; x++) {
    	int first = alphabet.indexOf (msg.charAt (x));
    	int second = alphabet.indexOf (newKey.charAt (x));
    	int total = (first + second) % 26;
    	encryptMsg += alphabet.charAt (total);
    }
    return encryptMsg;
  }

  public static String autoDecryption (String msg, String key) {
    String currentKey = key;
    String decryptMsg = "";

    // applying decryption algorithm 
    for (int x = 0; x < msg.length (); x++) {
    	int get1 = alphabet.indexOf (msg.charAt (x));
    	int get2 = alphabet.indexOf (currentKey.charAt (x));
    	int total = (get1 - get2) % 26;
    	total = (total < 0) ? total + 26 : total;
    	decryptMsg += alphabet.charAt (total);
    	currentKey += alphabet.charAt (total);
      }
    return decryptMsg;
  }

  public static void main (String[]args) {
    int choice;
    String inputText;
    String key = "Z";
    Scanner sc = new Scanner(System.in);

    boolean run = true;
    do {
      System.out.println("\nYou have to enter number to perform the action:\n1 to update key value (default 'Z')\n2 to encrypt\n3 to decrypt\n4 to terminate");
      System.out.print("Enter Your Choice: ");
      choice = Integer.parseInt(sc.nextLine());
      switch (choice) {
        case 1:
          System.out.print("Enter new value: ");
          key = sc.nextLine();
          System.out.println("Key Updated");
          break;
        case 2:
          System.out.print("Enter text to encrypt: ");
          inputText = sc.nextLine();
          System.out.println("Encrypted Text: " + autoEncryption(inputText, key));
          break;
        case 3:
          System.out.print("Enter text to decrypt: ");
          inputText = sc.nextLine();
          System.out.println("Decrypted Text: " + autoDecryption(inputText, key));
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
