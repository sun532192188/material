/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

/**  
 * @Description: 验证码工具类(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class CaptchaUtils {
	private int width;
	private int height;
	private int num;
	private String code;
	private int r = 180;
	private int g = 180;
	private int b = 180;
	private static final Random ran = new Random();
	private static CaptchaUtils captcha;
	private CaptchaUtils(){
		code = "1q2w3e4r5t6y7u8i9o0p1a2s3d4f5g6h7j8k9l0z1x2c3v4b5n6m";
		num = 4;
	}
	
	public static CaptchaUtils getInstance() {
		if(captcha==null) captcha = new CaptchaUtils();
		return captcha;
	}
	
	public CaptchaUtils set(int width,int height,int num,String code) {
		this.width = width;
		this.height = height;
		this.setNum(num);
		this.setCode(code);
		return this;
	}
	
	public CaptchaUtils set(int width,int height,int num) {
		this.width = width;
		this.height = height;
		this.setNum(num);
		this.setCode(code);
		return this;
	}
	
	public CaptchaUtils set(int width,int height) {
		this.width = width;
		this.height = height;
		return this;
	}
	
	public void setRGB(int r,int g,int b) {
		if(r>255) r = 255;if(r<0) r = 0;if(g>255) g = 255;
		if(g<0) g = 0;if(b>255) b = 255;	if(b<0) b = 0;
		this.r = r;this.g = g;this.b = b;
	}
	
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String generateCheckcode() {
		StringBuffer cc = new StringBuffer();
		for(int i=0;i<num;i++) {
			cc.append(code.charAt(ran.nextInt(code.length())));
		}
		return cc.toString();
	}
	
	public BufferedImage generateCheckImg(String checkcode) {
		//创建一个图片对象
		BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//获取图片对象的画笔
		Graphics2D graphic = img.createGraphics();
		graphic.setColor(Color.WHITE);
		graphic.fillRect(0, 0, width, height);
		graphic.setColor(Color.BLACK);
		graphic.drawRect(0, 0, width-1, height-1);
		Font font = new Font("宋体",Font.BOLD+Font.ITALIC,(int)(height*0.95));
		graphic.setFont(font);
		for(int i=0;i<num;i++) {
			graphic.setColor(new Color(ran.nextInt(r),ran.nextInt(g),ran.nextInt(b)));
			graphic.drawString(String.valueOf(checkcode.charAt(i)), i*(width/num)+4, (int)(height*0.8));
		}
		
		//加一些点
		for(int i=0;i<(width+height);i++) {
			graphic.setColor(new Color(ran.nextInt(r),ran.nextInt(g),ran.nextInt(b)));
			graphic.drawOval(ran.nextInt(width), ran.nextInt(height), 1, 1);
		}
		
		/*//加一些线
		for(int i=0;i<num;i++) {
			graphic.setColor(new Color(ran.nextInt(r),ran.nextInt(g),ran.nextInt(b)));
			graphic.drawLine(0, ran.nextInt(height), width, ran.nextInt(height));
		}*/
		return img;
	}
	
	
}
