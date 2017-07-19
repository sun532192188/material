/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**  
 * @Description: 类扫描器/获取到一个包下的所有class名称/权限控制时有用(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class ScanUtil {
	
	/**
	 * 扫描到的完整类名集合
	 */
	private static List<String> classnames;
	/**
	 * 要扫描的包名
	 */
	private static String npackage;
	
	/**
	 * 根据包的前缀、获得对应的文件或目录
	 * @param _npackage 包的前缀 、可以精确到类、但那样无意义
	 */
	public static List<String> scanAllClassName(String _npackage) {
		if(_npackage==null||"".equals(_npackage)) {
			throw new RuntimeException("请传入正确的包名！");
		}
		classnames = new ArrayList<String>();
		npackage = _npackage;
		String fpath = npackage.replace(".","/");
		URL url = ScanUtil.class.getClassLoader().getResource(fpath);
		String filepath = url.getPath();
		initClassNames(new File(filepath));
		return classnames;
	}
	
	/**
	 * 通过递归调用、扫描出所有、class的完整类名
	 * @param file
	 */
	private static void initClassNames(File file) {
		Pattern pattern = Pattern.compile(".*("+npackage+".*)");
		if(file.isDirectory()) {
			for(File f:file.listFiles()) {
				initClassNames(f);
			}
		} else {
			String fileName = file.getAbsolutePath();
			if(fileName.endsWith(".class")) {
				fileName = fileName.substring(0,fileName.lastIndexOf("."));
				Matcher m = pattern.matcher(fileName);
				if(m.find()) {
					fileName = m.group(1);
					fileName = fileName.replaceAll("\\\\","/").replace("/", ".");
					classnames.add(fileName);
				}
			}
		}
	}
}
