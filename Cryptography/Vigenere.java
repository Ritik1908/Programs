import java.util.*;

class Vigenere {
    
static String generateKey(String str, String key) { 
    int x = str.length(); 
  
    for (int i = 0; ; i++) { 
        if (x == i) { 
            i = 0;
        }
        if (key.length() == str.length()) { 
            break; 
        }
        key+=(key.charAt(i)); 
    } 
    return key; 
} 
  
// This function returns the encrypted text
static String encrypt(String str, String key) { 
    String cipher_text=""; 
  
    for (int i = 0; i < str.length(); i++) { 
        // converting in range 0-25 
        int x = (str.charAt(i) + key.charAt(i)) %26; 
  
        // convert into alphabets(ASCII) 
        x += 'A'; 
  
        cipher_text+=(char)(x); 
    } 
    return cipher_text; 
} 
  
// This function decrypts the encrypted text
static String decrypt(String cipher_text, String key) { 
    String orig_text=""; 
  
    for (int i = 0 ; i < cipher_text.length() &&  i < key.length(); i++) { 
        // converting in range 0-25 
        int x = (cipher_text.charAt(i) -  key.charAt(i) + 26) %26; 
  
        // convert into alphabets(ASCII) 
        x += 'A'; 
        orig_text+=(char)(x); 
    } 
    return orig_text; 
} 
  
// Driver code 
public static void main(String[] args) { 
    
    Scanner sc = new Scanner (System.in);

    String keyword = "ABCD";
    String key = "";

    int choice;
        String inputText;

        boolean run = true;
        do {
            System.out.println("\nYou have to enter number to perform the action:\n1 to update key value (default is ABCD)\n2 to encrypt\n3 to decrypt\n4 to terminate");
            System.out.print("Enter Your Choice: ");
            choice = Integer.parseInt(sc.nextLine());
            switch (choice) {
                case 1:
                    System.out.print ("Enter New Key: ");
                    keyword = sc.nextLine ();
                    break;
                case 2:
                    System.out.print("Enter text to encrypt: ");
                    inputText = sc.nextLine();
                    key = generateKey(inputText, keyword);
                    System.out.println("Encrypted Text: " + encrypt(inputText, key));
                    break;
                case 3:
                    System.out.print("Enter text to decrypt: ");
                    inputText = sc.nextLine();
                    key = generateKey(inputText, keyword);
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