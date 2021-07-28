import java.util.*;

class Main {
    
static String getkFromText(String str, String k) { 
    int x = str.length(); 
  
    for (int i = 0; ; i++) { 
        if (x == i) { 
            i = 0;
        }
        if (k.length() == str.length()) { 
            break; 
        }
        k+=(k.charAt(i)); 
    } 
    return k; 
} 
  
// This function returns the encrypted text
static String encrypt(String plainText, String k) { 
    String cipherText=""; 
  
    for (int i = 0; i < plainText.length(); i++) { 
        // converting in range 0-25 
        int x = (plainText.charAt(i) + k.charAt(i)) %26; 
  
        // convert into alphabets(ASCII) 
        x += 'A'; 
  
        cipherText+=(char)(x); 
    } 
    return cipherText; 
} 
  
// This function decrypts the encrypted text
static String decrypt(String cipherText, String k) { 
    String plainText=""; 
  
    for (int i = 0 ; i < cipherText.length() &&  i < k.length(); i++) { 
        // converting in range 0-25 
        int x = (cipherText.charAt(i) -  k.charAt(i) + 26) %26; 
  
        // convert into alphabets(ASCII) 
        x += 'A'; 
        plainText+=(char)(x); 
    } 
    return plainText; 
} 
  
// Driver code 
public static void main(String[] args) { 
    
    Scanner sc = new Scanner (System.in);

    String keyWord = "LEG";
    String k = "";

    int choice;
        String userInput;

        boolean run = true;
        do {
            System.out.println("\nEnter a number:\n1 to update Key value (default is LEG)\n2 to encrypt\n3 to decrypt\n4 to terminate");
            System.out.print("Enter Your Choice: ");
            choice = Integer.parseInt(sc.nextLine());
            switch (choice) {
                case 1:
                    System.out.print ("Enter New k: ");
                    keyWord = sc.nextLine ();
                    break;
                case 2:
                    System.out.print("Enter text to encrypt: ");
                    userInput = sc.nextLine();
                    k = getkFromText(userInput, keyWord);
                    System.out.println("Encrypted Text: " + encrypt(userInput, k));
                    break;
                case 3:
                    System.out.print("Enter text to decrypt: ");
                    userInput = sc.nextLine();
                    k = getkFromText(userInput, keyWord);
                    System.out.println("Decrypted Text: " + decrypt(userInput, k));
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