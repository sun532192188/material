package com.material.website.util;

import com.material.website.system.MaterialOperate;

/**
 * 物资编码生成工具类
 * @author sunxiaorong
 *
 */
public class MaterialNoUtil {

	
	/**
	 * 获取编码
	 * @param type
	 * @param count
	 */
	public static String getNo(String  type,Integer count){
		String no = type+"-"+String.format("%05d", count);
		return no;
	}
	
	/**
	 * 获取编码
	 * @param type
	 * @param count
	 */
	public static String getNo(Integer weishu,Integer count){
		String no = String.format("%0"+weishu+"d", count);
		return no;
	}
	
	public static void main(String[] args) {
		/*String no = getNo(MaterialOperate.YANSHOURUKU.getName(),200);
		System.out.println(no);*/
		System.out.println(getNo(5,1));
	}
}
