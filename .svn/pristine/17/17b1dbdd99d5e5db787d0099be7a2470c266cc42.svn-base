/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.Properties;

import com.material.website.system.Alice;


/**  
 * @Description: properties文件读取工具(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class PropertiesUpdateUtil {
    private  PropertiesUpdateUtil() {}
    private static PropertiesUpdateUtil util;
    private Properties prop = new Properties();
    private String filename;
    private Class<?> clz;
    
    /**
     * 创建配置对象
     * @param filename 配置文件名
     * @param recover 
     * @return
     * @throws IOException
     */
    public static PropertiesUpdateUtil newInstance(String filename,Class<?> clz) {
		 try {
			 util = new PropertiesUpdateUtil();
			 util.filename = filename;
			 util.clz = clz;
			 util.prop.load(PropertiesUpdateUtil.class.getClassLoader().getResourceAsStream(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return util;
    }
    
    public synchronized void store(Object o) throws IllegalArgumentException, IllegalAccessException, IOException {
    	FileOutputStream fos = null;
    	try {
			String path = PropertiesUpdateUtil.class.getClassLoader().getResource(filename).getPath();
			fos = new FileOutputStream(path);
			for(Field f:clz.getDeclaredFields()) {
				f.setAccessible(true);
				Alice alice = f.getAnnotation(Alice.class);
				String key = alice.value();
				if(f.get(o)==null) continue;
				prop.setProperty(key,(String) f.get(o));
			}
			prop.store(fos,null);
		} finally {
			if(fos != null) fos.close();
		}
    }
    
    public Object load() throws InstantiationException, IllegalAccessException, SecurityException, NoSuchMethodException, IllegalArgumentException, InvocationTargetException {
    	Constructor<?> constructor = clz.getConstructor();
    	constructor.setAccessible(true);
    	Object obj = constructor.newInstance();
    	Field[] fields = clz.getDeclaredFields();
    	for(Field f:fields) {
    		f.setAccessible(true);
    		Alice alice = f.getAnnotation(Alice.class);
    		String value = prop.getProperty(alice.value());
    		f.set(obj, value);
    	}
    	return obj;
    }
}
