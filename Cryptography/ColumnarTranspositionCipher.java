import java.io.*;
import java.util.*;

public class ColumnarTranspositionCipher {

	public static String encrypt(String input, String key) {
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

		for(int i = 0; i < noOfRows; i++) {
			for(int j = 0; j < keyLen; j++) {
				System.out.print(matrix[i][j]+" ");
			}
			System.out.println();
		}
		return "Ok";
	}

	public static void main(String args[]) {
		System.out.println(encrypt("RITIK VERMA", "XYZ"));
	}
}