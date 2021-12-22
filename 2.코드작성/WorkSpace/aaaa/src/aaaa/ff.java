package aaaa;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class ff {
		
	
		public static String codeSK(String secretKey) throws NoSuchAlgorithmException {
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			md.update(secretKey.getBytes());
	
			byte byteDate[] = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(int i=0; i<byteDate.length; i++) {
				sb.append(Integer.toString((byteDate[i]&0xff) + 0x100, 16).substring(1));
			}
			secretKey = sb.toString();
			return secretKey;
		}
}
