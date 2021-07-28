import java.io.*;
import java.math.BigInteger; 
import java.util.*;


public class Deff_Hellman {
	static BigInteger power(BigInteger a, BigInteger b, BigInteger P) {
		if (b.equals(BigInteger.ONE)) {
			return a;
		} else {
			return (a.pow(b.intValue())).remainder(P);
		}
	}

	public static void main(String args[]) {
		BigInteger P, G, x, a, y, b, ka, kb;
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter value of P: ");
		P = new BigInteger(sc.nextLine());

		System.out.print("Enter value of Q: ");
		G = new BigInteger(sc.nextLine());

		System.out.print("Private key of Alice: ");
		a = new BigInteger(sc.nextLine());

		System.out.print("Private key of Bob: ");
		b = new BigInteger(sc.nextLine());

		x = power(G, a, P);
		y = power(G, b, P);

		ka = power(y, a, P);
		kb = power(x, b, P);

		System.out.println("Secret key for Alice: "+ka);
		System.out.println("Secret key for Bob: "+kb);
	}
}


// 	// Generating the secret key after the exchange
// 		// of keys
// 	ka = power(y, a, P); // Secret key for Alice
// 	kb = power(x, b, P); // Secret key for Bob
	
// 	printf("Secret key for the Alice is : %lld\n", ka);
// 	printf("Secret Key for the Bob is : %lld\n", kb);
	
// 	return 0;
// }
