/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**  
 * @Description: 公共的日期格式化类(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class DateFormatUtils {
	public static String date2str(Date date,String pattern){
		return getSimpleDateFormat(pattern).format(date);
	}
	public static Date str2date(String source,String pattern) throws ParseException {
		return getSimpleDateFormat(pattern).parse(source);
	}
	public static SimpleDateFormat getSimpleDateFormat(String pattern) {
		return new SimpleDateFormat(pattern);
	}
}
