/*
 * Copyright (c) 2015.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;


/**  
 * @Description: 小工具
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2015年4月28日 下午5:11:28  
 */

public class LittleUtils {
	
	/**
	 * 获取章节名称
	 * @param title
	 * @return
	 */
	public static String getChapterTitle(String title) {
		Pattern pattern = Pattern.compile("((\\d+[\\.]*)*\\d+[\\s|,|、|，]+)(.*)");
		Matcher matcher = pattern.matcher(title);
		String intro = "";
		while(matcher.find()) {
			intro = matcher.group(3);
		}
		if(StringUtils.isBlank(intro)) {
			intro = title.replace(".","");
		}
		return intro;
	}
}
