/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.apache.commons.compress.archivers.tar.TarArchiveInputStream;
import org.apache.commons.compress.archivers.tar.TarArchiveOutputStream;
import org.apache.commons.compress.compressors.gzip.GzipCompressorInputStream;
import org.apache.commons.compress.compressors.gzip.GzipCompressorOutputStream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;


/**  
 * @Description: 文件压缩工具类/目前只支持gzip(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class Compress {
	private static Compress compress;
	private Compress() {}
	
	public static Compress newInstance() {
		if(compress == null) compress = new Compress();
		return compress;
	}
	
	
	/**
	 * tar 打包
	 * @param source 打包的源文件
	 * @param target 打包的目标文件
	 * @param encoding 打包之后的字符编码
	 * @param absolute 打包路径是绝对还是相对
	 */
	public void tar(String source,String target,String encoding,boolean absolute) {
		tar(source,target,encoding,absolute,false);
	}
	
	/**
	 * tar 打包
	 * @param source 打包的源文件
	 * @param target 打包的目标文件
	 * @param encoding 打包之后的字符编码
	 * @param absolute 打包路径是绝对还是相对
	 * @param my 是否是内部调用，若不是，则判断文件名是否以tar结尾
	 */
	private void tar(String source,String target,String encoding,boolean absolute,boolean own) {
		TarArchiveOutputStream taos = null;
		try {
			File ct = new File(source);
			if(!ct.exists()) throw new RuntimeException("源文件不存在");
			if(encoding == null || "".equals(encoding.trim())) {
				encoding = System.getProperty("file.encoding");
			}
			if(!own && !target.endsWith(".tar")) {
				target+=".tar";
			}
			taos = new TarArchiveOutputStream(new BufferedOutputStream(new FileOutputStream(target)),encoding);
			//设置支持大文件打包
			taos.setBigNumberMode(TarArchiveOutputStream.BIGNUMBER_STAR);
			//设置支持长文件名打包
			taos.setLongFileMode(TarArchiveOutputStream.LONGFILE_GNU);
			if(absolute) {
				rTar(ct, taos,null);
			} else {
				rTar(ct, taos,ct.getParent());
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if(taos != null) taos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 文件解包
	 * @param source 解包的文件
	 * @param target 解包的目标路径
	 * @param encoding 解压的字符编码
	 * @throws IOException
	 */
	public void unTar(String source,String target,String encoding) {
		TarArchiveInputStream tais = null;
		try {
			File file = new File(source);
			if(!file.exists()) throw new RuntimeException("解压的源文件不存在");
			if(encoding == null || "".equals(encoding.trim())) encoding = System.getProperty("file.encoding");
			tais = new TarArchiveInputStream(new BufferedInputStream(new FileInputStream(file)),encoding);
			TarArchiveEntry tae = null;
			while((tae = tais.getNextTarEntry()) != null) {
				File f = new File(target+File.separator+tae.getName());
				if(!f.getParentFile().exists())
					f.getParentFile().mkdirs();
				if(!f.exists()) f.createNewFile();
				BufferedOutputStream fos = new BufferedOutputStream(new FileOutputStream(f));
				IOUtils.copyLarge(tais,fos);
				fos.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if(tais!=null) tais.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 递归进行文件打包
	 * @param file 添加到包中的文件
	 * @param taos 文件包的输出流
	 * @param base 要排除的路径，若为null 或者 "" 则表示基于根目录打包
	 * @throws IOException
	 */
	private void rTar(File file,TarArchiveOutputStream taos,String base) throws IOException {
		if(file.isDirectory()) {
			File[] files = file.listFiles();
			for(File f:files) {
				rTar(f,taos,base);
			}
		} else { 
			TarArchiveEntry entry;
			if(base != null && !"".equals(base.trim())) {
				String path =file.getAbsolutePath().replace(base, "");
				entry = new TarArchiveEntry(path);
				entry.setSize(file.length());
			} else {
				entry = new TarArchiveEntry(file);
			}
			taos.putArchiveEntry(entry);
			taos.write(FileUtils.readFileToByteArray(file));
			taos.closeArchiveEntry();
		}
	}
	
	/**
	 * 
	 * 解压文件
	 * @param source 压缩包
	 * @param target 解压目录
	 * @param encoding 解压文件字符编码
	 */
	public void gunzip(String source,String target,String encoding) {
		TarArchiveInputStream tais = null;
		BufferedOutputStream fos = null;
		try {
			//加载解压文件
			File file = new File(source);
			if(!file.exists()) throw new RuntimeException("压缩文件不存在");
			//设置字符编码
			if(encoding == null || "".equals(encoding.trim())) {
				encoding = System.getProperty("file.encoding");
			}
			/**
			 * 方法2 直接读取到输出流
			 * 直接进行解压和打包
			 */
			tais = new TarArchiveInputStream(new GzipCompressorInputStream(new BufferedInputStream(new FileInputStream(file))),encoding);
			TarArchiveEntry tae = null;
			while((tae = tais.getNextTarEntry()) != null) {
				File f = new File(target+File.separator+tae.getName());
				if(!f.getParentFile().exists())
					f.getParentFile().mkdirs();
				if(!f.exists()) f.createNewFile();
				fos = new BufferedOutputStream(new FileOutputStream(f));
				IOUtils.copyLarge(tais,fos);
			}
		} catch (Exception e) {
			e.printStackTrace();//////////////////
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if(tais!=null) tais.close();
				if(fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * 解压文件
	 * @param source 压缩包
	 * @param target 解压目录
	 * @param encoding 解压文件字符编码
	 */
	public void gunzip1(String source,String target,String encoding) {
		GzipCompressorInputStream gins = null;
		BufferedOutputStream bos = null;
		try {
			//加载解压文件
			File file = new File(source);
			if(!file.exists()) throw new RuntimeException("压缩文件不存在");
			//设置字符编码
			if(encoding == null || "".equals(encoding.trim())) {
				encoding = System.getProperty("file.encoding");
			}
			gins = new GzipCompressorInputStream(new BufferedInputStream(new FileInputStream(file)));
			/**
			 * 方法1 使用临时文件
			 * 先解压为tar然后在解包
			 */
			//解压得到临时tar文件
			File temp = new File(file.getParent()+new Date().getTime()+"_temp");
			bos = new BufferedOutputStream(new FileOutputStream(temp));
			IOUtils.copy(gins,bos);
			gins.close();
			bos.close();
			//解压tar到文件夹
			this.unTar(temp.getAbsolutePath(), target,encoding);
			if(temp.exists()) temp.delete();
		} catch (Exception e) {
			e.printStackTrace();//////////////////
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if(gins!=null) gins.close();
				if(bos!=null) bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 方法1、先进行tar打包，然后在进行压缩，最后删除临时文件
	 * 压缩文件，格式 .tar.zg
	 * @param source 需压缩的目录
	 * @param target 压缩文件存放目录
	 * @param encoding 压缩文件编码，默认gbk
	 * @param absolute 是否基于绝对路径压缩
	 */
	public void gzip(String source,String target,String encoding,boolean absolute) {
		GzipCompressorOutputStream gcos = null;
		BufferedInputStream bis = null;
		try {
			if(!target.endsWith(".tar.gz")) {
				target += ".tar.gz";
			}
			File targetFile = new File(target);
			
			//gzip压缩文件输出流
			gcos = new GzipCompressorOutputStream(new BufferedOutputStream(new FileOutputStream(targetFile)));
			//tar临时文件输入流
			String tpath = targetFile.getParent()+new Date().getTime()+"_temp";
			this.tar(source,tpath, encoding, absolute,true);
			bis = new BufferedInputStream(new FileInputStream(tpath));
			//拷贝输入流到输出流
			IOUtils.copyLarge(bis, gcos);
			bis.close();
			//压缩完毕，删除临时文件
			File temp = new File(tpath);
			if(temp.exists()) temp.delete();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		} finally {
			try {
				if(gcos!=null) gcos.close();
				if(bis!=null) bis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
