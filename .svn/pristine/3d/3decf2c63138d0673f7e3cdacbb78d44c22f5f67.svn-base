package com.material.website.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 文件 创建  读取工具类
 * @author sunxiaorong
 *
 */
public class FileOperation {
	
	public static void addFile(String filePath){
		File file=new File(filePath);    
		if(!file.exists())    
		{    
		    try {    
		        file.createNewFile();    
		    } catch (IOException e) {    
		        e.printStackTrace();    
		    }    
		}   
	}
	
	public static void writeFile(String filePath,String writeContent){
		FileWriter out=null;
		try {
			//此处设置为true即可追加
		     out = new FileWriter(filePath, true); 
			//往文件写入
			out.write(writeContent);
			//换行
			out.write("\r\n");
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				//刷新IO内存流
				out.flush();
				//关闭
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	/**
	 * @Description: 读取文本内容
	 * @param @param filePath
	 * @param @param encoding
	 * @param @return   
	 * @return String  
	 * @throws
	 * @author xulonglong
	 * @date 2016-1-13 上午11:40:02
	 */
	public static String readTxtFile(String filePath,String encoding){
		String content="";
        try {
            File file=new File(filePath);
            if(file.isFile() && file.exists()){ //判断文件是否存在
                InputStreamReader read = new InputStreamReader(
                new FileInputStream(file),encoding);//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                while((lineTxt = bufferedReader.readLine()) != null){
                	content +=lineTxt;
                }
                read.close();
	        }else{
	            System.out.println("找不到指定的文件");
	        }
        } catch (Exception e) {
            System.out.println("读取文件内容出错");
            e.printStackTrace();
        }
        return content;
    }
	
}
