/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

/**
 * @Description: 文件下载工具类
 * @author 张明虎 zhangminghu@yuntengzhiyong.com
 * @date 2014年12月8日 下午3:47:57
 */

public class FileOutPutUtil {
	
	/**
	 * 普通文件下载
	 * @param response   web的response对象
	 * @param filepath   文件的路径
	 * @param filename   文件名、这儿的文件名是文件的原始名称
	 * @throws IOException 
	 */
	public static void download(HttpServletResponse response,String filepath,String filename,Long progress) throws IOException {
		InputStream fis = null;
		OutputStream out = null;
		progress = (progress == null||progress < 0)?0:progress;
		try {
			File file = new File(filepath);
			fis = new BufferedInputStream(new FileInputStream(file));
			int num = 0;
			while(num < progress){
				num += fis.skip(progress - num);
			}
			response.setContentType("multipart/form-data");
			response.setHeader("Content-Disposition","attachment;filename="+ 
								new String(filename.getBytes("gb2312"), "ISO8859-1"));
			response.setCharacterEncoding("GB2312");
			response.setHeader("Content-Length", "" + file.length());
			out = new BufferedOutputStream(response.getOutputStream());
			int length = 0;
			byte[] buffer = new byte[10240];
			while ((length = fis.read(buffer)) != -1) {
				out.write(buffer, 0, length);
				out.flush();
			}
			fis.close();
			out.close();
		} catch(Exception e) {
			
		} finally {
			if(fis != null) fis.close();
			if(out != null) out.close();
		}
	}
	
	/**
	 * 验证码生成
	 * 验证码的值会存储到session里、
	 * @param response
	 * @throws IOException 
	 */
	public static void writeValidCode(HttpServletResponse response,HttpSession session) throws IOException {
		response.setContentType("image/jpg");
		int width = 150;
		int height = 30;
		CaptchaUtils c = CaptchaUtils.getInstance();
		c.set(width, height, 4);
		String checkcode = c.generateCheckcode();
		
		session.setAttribute("validcode", checkcode);
		
		OutputStream os = response.getOutputStream();
		ImageIO.setCacheDirectory(new File(System.getProperty("user.dir")));
		ImageIO.write(c.generateCheckImg(checkcode), "jpg", os);
	}
	
	/**
	 * 读取输入流到字节数组
	 * @param inputStream
	 * @return
	 * @throws Exception
	 */
	public static byte[] readInputStream2byte(InputStream inputStream) throws Exception{
        byte[] buffer = new byte[1024];
        int len = -1;
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        while((len = inputStream.read(buffer)) != -1){
            outputStream.write(buffer, 0, len);
        }
        outputStream.close();
        inputStream.close();
        return outputStream.toByteArray();
    }
	
	/**
	 * 加密文件
	 * @param source
	 * @param target
	 */
	public static void encodeFile(File source,File target) {
		try {
			String readFileToString = FileUtils.readFileToString(source);
			byte[] makeData = AESEncrypt.makeData(readFileToString);
			FileUtils.copyInputStreamToFile(new ByteArrayInputStream(makeData),target);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
