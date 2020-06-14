import java.util.Scanner;

public class anagram {

    static boolean isAnagram(String a, String b) {
        // Complete the function
        int freq1[] = new int[26];
        int freq2[] = new int[26];
        
        a = a.toLowerCase();
        b = b.toLowerCase();
        
        if(a.length() != b.length()) {
        	return false;
        }
        
        for(int i = 0; i < a.length(); i++) {
        	freq1[(int)a.charAt(i)-97]++;
        	freq2[(int)b.charAt(i)-97]++;
        }
        
        for(int i = 0; i < 26; i++) {
        	if(freq1[i] != freq2[i]) {
        		return false;
        	}
        }
        return true;
        
    }

    public static void main(String[] args) {
    
        Scanner scan = new Scanner(System.in);
        String a = scan.next();
        String b = scan.next();
        scan.close();
        boolean ret = isAnagram(a, b);
        System.out.println( (ret) ? "Anagrams" : "Not Anagrams" );
    }
}
