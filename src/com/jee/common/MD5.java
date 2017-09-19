package com.jee.common;

import java.security.MessageDigest;

public class MD5 {
	public static String md5(String plainText){
		try{
			MessageDigest md=MessageDigest.getInstance("MD5");
			md.update(plainText.getBytes());
			byte b[]=md.digest();
			int i;
			StringBuffer sb=new StringBuffer("");
			for(int offset=0;offset<b.length;offset++){
				i=b[offset];
				if(i<0)
					i+=256;
				if(i<16)
					sb.append("0");
				sb.append(Integer.toHexString(i));
			}
			//System.out.println("32:"+sb.toString());
			//System.out.println("16:"+sb.toString().substring(8,24));
			return sb.toString();
			//return sb.toString().substring(8,24);
		}
		catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String args[]){
		//MD5.md5(MD5.md5("2316574"));
		//MD5.md5("wang");
	}
}
