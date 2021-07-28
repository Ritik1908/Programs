import java.io.*;
import java.util.*;

class HillCipher {

    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter size of matrix: ");
        int size = sc.nextInt();
        int key[][] = new int[size][size];

        System.out.println("Enter matrix elements in column-major order");
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                key[i][j] = sc.nextInt();
            }
        }
        
        sc.nextLine();
        System.out.print("Enter input text: ");
        String in = sc.nextLine();

        int extra = (in.length()) % size;
        if (extra != 0) {
            for (int i = 0; i < extra; i++) {
                in = in + "#";
            }
        }

        String output = "";
        int input[] = new int[size];
        for (int k = 0; k < in.length(); k = k + size) {
            for (int m = 0; m < size; m++) {
                input[m] = (int) (in.charAt(k + m)) - 97;
            }
            for (int i = 0; i < size; i++) {
                int val = 0;
                for (int j = 0; j < size; j++) {
                    val = val + (key[j][i] * input[j]);
                }
                output = output + (char) ((val % 26) + 97);
            }
        }
        System.out.println(output);
    }
}