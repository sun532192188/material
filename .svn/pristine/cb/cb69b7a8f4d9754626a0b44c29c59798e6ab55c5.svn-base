package com.material.website.util;

import java.io.BufferedReader;  
import java.io.File;  
import java.io.FileReader;  
import java.util.ArrayList;  
import java.util.Date;  
import java.util.List;  
  
/** 
 * 项目代码统计，包含统计代码总行数功能，和查找特定字符串的位置的功能 
 * <br/><br/> 
 * 注意：查找中文的时候，必须保证目标项目与此次项目编码格式一致 
 *  
 * @author Li Shaoqing 
 * 
 */  
public class LineCounter {  
      
    /** 
     * 项目的目录 
     */  
    String projectName = "E:/workspace/web-app/src";  
      
    /** 
     * 要统计的文件类型 
     */  
    String str[] = new String[]{"java","jsp","html","xml","properties"};  
      
    /** 
     * 要查找的文字 
     */  
    String find = "";
  
    List<File> list = new ArrayList<File>();  
  
    int linenumber = 0;  
  
    FileReader fr = null;  
    BufferedReader br = null;  
  
    public static void main(String args[]) {  
        new LineCounter().counter();  
    }  
  
    public void counter() {  
          
        Date date = new Date();  
          
        File file = new File(projectName);  
        File files[] = null;  
        files = file.listFiles();  
          
        addFile(files);  
        readLinePerFile();  
        System.out.println("总行数:" + linenumber + "行");  
        System.out.println("统计用时:" + (new Date().getTime() - date.getTime()) + "毫秒");  
        System.out.println("文件数量:" + list.size() + "个");  
    }  
  
    // 将所有符合查找类型的文件都加入到文件列表中  
    public void addFile(File file[]) {  
        for (int index = 0; index < file.length; index++) {  
            if(file[index].isFile()){  
                String name = file[index].getName().substring(file[index].getName().lastIndexOf(".") + 1);  
                for(int i = 0; i < str.length; i++){  
                    if(name.equals(str[i])){  
                        list.add(file[index]);  
                        break;  
                    }  
                }  
            } else {  
                addFile(file[index].listFiles());  
            }  
        }  
    }  
  
    // 统计文件  
    public void readLinePerFile() {  
        try {  
            for (File s : list) {  
                int num = 0;  
                if (s.isDirectory()) {  
                    continue;  
                }  
                fr = new FileReader(s);  
                br = new BufferedReader(fr);  
                String i = "";  
                boolean flag = true;  
                while ((i = br.readLine()) != null) {  
                    num++;  
                      
                    if(find != null && !find.equals("") && i.indexOf(find) != -1){  
                        if(flag){  
                            System.out.println("文件：" + s.getAbsolutePath());  
                            flag = false;  
                        }  
                        System.err.println("查找结果：" + num + "行，" + (i.indexOf(find) + 1) + "列");  
                    }  
                }  
                if(!flag){  
                    System.out.println();  
                }  
                if(find == null || find.equals("")){  
                    System.out.println("文件：" + s.getAbsolutePath());  
                    System.out.println("总行数：" + num + "\n");  
                }  
                  
                linenumber += num;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            if (br != null) {  
                try {  
                    br.close();  
                } catch (Exception e) {  
                }  
            }  
            if (fr != null) {  
                try {  
                    fr.close();  
                } catch (Exception e) {  
                }  
			}  
		}  
	}
}