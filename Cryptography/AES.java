import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;
import java.util.*;

public class AES {
  private static final String ALGO = "AES";
  private static final byte[] keyValue = new byte[]{'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P'};

    public static String encrypt(String data) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.ENCRYPT_MODE, key);
        byte[] encVal = c.doFinal(data.getBytes());
        return Base64.getEncoder().encodeToString(encVal);
    }

    public static String decrypt(String encryptedData) throws Exception {
        Key key = generateKey();
        Cipher c = Cipher.getInstance(ALGO);
        c.init(Cipher.DECRYPT_MODE, key);
        byte[] decordedValue = Base64.getDecoder().decode(encryptedData);
        byte[] decValue = c.doFinal(decordedValue);
        return new String(decValue);
    }

    private static Key generateKey() throws Exception {
        return new SecretKeySpec(keyValue, ALGO);
    }

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        try {
            int choice;
            String inputText = "";
            boolean run = true;
            do {
              System.out.println("\nYou have to enter number to perform the action\n1 encrypt\n2 to decrypt\n3 to terminate");
              System.out.print("Enter Your Choice: ");
              choice = Integer.parseInt(sc.nextLine());
              switch (choice) {
                case 1:
                  System.out.print("Enter text to encrypt: ");
                  inputText = sc.nextLine();
                  System.out.println("Encrypted Text: " + encrypt(inputText));
                  break;
                case 2:
                  System.out.print("Enter text to decrypt: ");
                  inputText = sc.nextLine();
                  System.out.println("Decrypted Text: " + decrypt(inputText));
                  break;
                case 3:
                  System.out.println("Terminating the program .....");
                  run = false;
                  break;
                default:
                  System.out.println("Wrong choice, re-enter correct value");
              }
            } while(run);
        } catch (Exception e) {
            System.out.println("Error");
        }
    }
}