package com.daoImpl;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

public class PasswordSecurity {

	public static String passwordSecurity(String passwordToHash) throws NoSuchAlgorithmException, NoSuchProviderException
    {
		
		try { 
			MessageDigest md = MessageDigest.getInstance("SHA-256"); 
			byte[] messageDigest = md.digest(passwordToHash.getBytes()); 
			BigInteger no = new BigInteger(1, messageDigest); 
			String hashtext = no.toString(16); 
			while (hashtext.length() < 32) { 
				hashtext = "0" + hashtext; 
			} 
			return hashtext; 
		} 
		catch (NoSuchAlgorithmException e) { 
			throw new RuntimeException(e); 
		} 
    }

}
