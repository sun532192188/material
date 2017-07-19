package com.material.website.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class PushAESEncrypt {

	private static byte key[] = {-91,76,-57,-54,-44,-94,-124,-37,89,95,-75,24,38,-84,-69,-70};
	private static byte iv[] = {-106,-2,-126,42,110,-34,-90,49,-58,-101,1,14,-82,-10,7,-49};
	
	/**
	 * 解析数据
	 * @param bytes
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	public static String getData(byte[] bytes) throws IOException, Exception{
		// 先解密，然后解压
		return uncompress(DecodeAESEncrypt(bytes));
	}
	
	/**
	 * 加工数据
	 * @param str
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	public static byte[] makeData(String str) throws IOException, Exception{
		// 先压缩，然后加密
		return AESencrypt(compress(str));
	}
	
	/**
	 * AES解密
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public static byte[] DecodeAESEncrypt(byte[] input) throws Exception {

		Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding"); // 算法/模式/补码方式
		SecretKeySpec keyspec = new SecretKeySpec(key, "AES");
		IvParameterSpec ivspec = new IvParameterSpec(iv);

		cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);

		byte[] original = cipher.doFinal(input);
		original = DecodeBytearray(original);
		return original;
	}

	/**
	 * AES加密
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public static byte[] AESencrypt(byte[] input) throws Exception {

		input = EncodeByteArray(input);
		Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding"); // 算法/模式/补码方式

		SecretKeySpec keyspec = new SecretKeySpec(key, "AES");
		IvParameterSpec ivspec = new IvParameterSpec(iv);
		
		cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
		byte[] encrypted = cipher.doFinal(input);
		return encrypted;
	}
	
	/**
	 * 文本压缩
	 * @param str
	 * @return
	 * @throws IOException
	 */
	public static byte[] compress(String str) throws IOException {
		if (str == null || str.length() == 0) {
			return null;
	    }
	    ByteArrayOutputStream out = new ByteArrayOutputStream();
	    GZIPOutputStream gzip = new GZIPOutputStream(out);
	    gzip.write(str.getBytes("UTF-8"));
	    gzip.close();
	    return out.toByteArray();
	}
	
	/**
	 * 文本解压缩
	 * @param str
	 * @return
	 * @throws IOException
	 */
	public static String uncompress(byte[] str) throws IOException {
		if (str == null || str.length == 0) {
			return null;
	    }
	    ByteArrayOutputStream out = new ByteArrayOutputStream();
	    ByteArrayInputStream in = new ByteArrayInputStream(str);
	    GZIPInputStream gunzip = new GZIPInputStream(in);
	    byte[] buffer = new byte[256];
	    int n;
	    while ((n = gunzip.read(buffer)) >= 0) {
	    	out.write(buffer, 0, n);
	    }
	    // toString()使用平台默认编码，也可以显式的指定如toString("GBK")
	    String content = out.toString("UTF-8");
	    if (content.length() > 0 && content.charAt(0) == 65279) {
        	content = content.substring(1);
        }
	    return content;
	}
	
	private static byte[] EncodeByteArray(byte[] a) {
		int count  = 32 - a.length % 16 + a.length;
		byte[] b = new byte[count];
		int q = 0;
		for (int i = 0; i < count; i++) {
			if (i < 15) {
				b[i] = 0;
			} else if (i == 15) {
				b[i] = (byte) ((16 - a.length % 16) * 7);
			} else if (i > 15 && i < 16 + a.length) {
				b[i] = a[q++];
			} else if (i > 15 + a.length) {
				b[i] = 0;
			}
		}
		return b;
	}
	
	private static byte[] DecodeBytearray(byte[] a) {
		int c = a[15] / 7;
		
		int count = a.length - c;
		byte[] b = new byte[count - 16];
		int q = 0;
		for (int i = 16; i < count; i++) {
			b[q++] = a[i];
		}
		return b;
	}
}
