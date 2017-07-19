package com.material.website.util;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.material.website.system.SystemContext;


/**  
 * @Description: 附件Util 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月25日 下午3:36:38  
 */

public class AttachmentUtil {
	/**
	 * @param static 是否是静态目录
	 * @throws IOException
	 */
	public static String getBasePath(boolean stati) throws IOException {
		List<String> dirs = getFilePath();
		StringBuilder basePath = null;
		if(stati) {
			basePath = new StringBuilder(SystemContext.getSaveStaticPath());
		} else {
			basePath = new StringBuilder(SystemContext.getSaveDynamicPath());
		}
		basePath.append("/"+dirs.get(0)+"/"+dirs.get(1)+"/"+dirs.get(2));
		File path = new File(basePath.toString());
		if(!path.exists()) path.mkdirs();
		return basePath.toString();
	}
	
	/**
	 * 获取日期路径
	 * @return
	 */
	private static List<String> getFilePath() {
		String dateStr = DateFormatUtils.date2str(new Date(),"yyyy-MM-dd");
		return Arrays.asList(dateStr.split("-"));
	}
	
	/**
	 * 获取日期路径
	 * @return
	 */
	public static String getDatePath() {
		List<String> dirs = getFilePath();
		return "/"+dirs.get(0)+"/"+dirs.get(1)+"/"+dirs.get(2);
	}
}
