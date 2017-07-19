/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

/**  
 * @Description: properties文件读取工具
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class PropertiesUtil {
    private  PropertiesUtil() {
    }

    private static PropertiesUtil util = new PropertiesUtil();
    private static Properties prop = new Properties();

    /**
     * 返回一个创建好的单例对象<br/>
     * @return  返回PropertiesUtil单例对象
     */
    public static PropertiesUtil newInstance() {
        return util;
    }


    /**
     * 通过传入的文件名和Key值 获取到key对应的value     <br/>
     * @param key       需要获取的属性的key             <br/>
     * @param filename  需要读取的文件名称，注意，文件需放在resources下<br/>
     * @return          返回一个通过key获取到的value字符串
     */
    public String loadValue(String key,String filename) {
        try{
           prop.load(PropertiesUtil.class.getClassLoader().getResourceAsStream(filename)); 
           return prop.getProperty(key);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }
    
    /**
     * 写入文件
     * @param fileName
     * @param key
     * @param value
     */
    public static void writeProperties(String fileName,String key,String value){
    	String filePath = PropertiesUtil.class.getClassLoader().getResource(fileName).getPath();
        Properties property = new Properties();
        try {
            File file = new File(filePath);
            if (!file.exists()) {
                System.out.println("文件不存在");
                file.createNewFile();
            }else{
                System.out.println("文件存在");
            }
            // 写入
            System.out.println(file.getCanonicalPath());
            property.setProperty(key, value);
             
            FileOutputStream fos=new FileOutputStream(file);
            property.store(fos, null);//store(...)指定的流仍保持打开状态。 
            fos.close();//关闭输出流
             
            FileInputStream fis = new FileInputStream(file);
            property.clear();//你是同一个property进行操作,先清空吧
            property.load(fis);//load(...)指定的流仍保持打开状态。 
            fis.close();//关闭输入流
            // 读取
            System.out.println(property.getProperty(key));
        }catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    
    public static void main(String[] args) throws FileNotFoundException {
	    writeProperties("system_config.properties", "system_name","大三大四队物资管理系统");
    }
}
