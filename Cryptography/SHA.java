import java.math.BigInteger; 
import java.nio.charset.StandardCharsets; 
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException; 
import java.util.*;

class SHA { 
	public static byte[] getSHA(String input) throws NoSuchAlgorithmException { 
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		return md.digest(input.getBytes(StandardCharsets.UTF_8)); 
	} 

	public static String toHexString(byte[] hash) {
		BigInteger number = new BigInteger(1, hash); 
		StringBuilder hexString = new StringBuilder(number.toString(16)); 
		while (hexString.length() < 32) { 
			hexString.insert(0, '0'); 
		} 
		return hexString.toString(); 
	} 

	public static void main(String args[]) 
	{
		Scanner sc = new Scanner(System.in);
		try
		{
			System.out.print("Enter a text to get HashCode by SHA-256 Algorithm: ");
			String input = sc.nextLine();
			String hashCode = toHexString(getSHA(input));
			System.out.println("Output: "+hashCode);
		} 
		catch (NoSuchAlgorithmException e) { 
			System.out.println("Error"); 
		} 
	} 
} 
