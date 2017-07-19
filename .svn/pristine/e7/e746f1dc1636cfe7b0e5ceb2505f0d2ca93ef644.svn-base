/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**  
 * @Description: 简单的md5加密(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com   
 * @date 2014年12月4日 上午12:37:23  
 */
public class SecurityUtil {
	private static final String SALT_USER = "d!@3sd#@$%dsfmw3#s#FDSf)(*^dfdsf223^^^FSDFs2@#3fasdf";
	private static final String SALT_EMAIL = "32@#$CDSAF#$32903280@#$23^^^4u9()^523#@*&($fdsF#@$sdf";
	private static final String SALT_TOKEN = "asdfj#$%dsamflksadj)(&(832m43l.25&(jlk23m453jjlkaf^%O";
	
	public static String email(String email) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(email.getBytes());
			md.update(SALT_EMAIL.getBytes());
			return new BigInteger(1,md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("数据加密失败："+e.getMessage());
		}
	}
	
	public static String password(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(SALT_USER.getBytes());
			md.update(str.getBytes());
			return new BigInteger(1,md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("数据加密失败："+e.getMessage());
		}
	}
	
	public static String token(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(SALT_TOKEN.getBytes());
			md.update(str.getBytes());
			return new BigInteger(1,md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException("数据加密失败："+e.getMessage());
		}
	}
}
