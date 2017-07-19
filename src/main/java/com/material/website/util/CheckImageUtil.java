/*
 * Copyright (c) 2015.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.awt.image.BufferedImage;
import java.io.FileNotFoundException;
import java.io.IOException;

/**  
 * @Description 
 * @author 孙晓荣 sunxiaorong@yuntengzhiyong.com  
 * @date 2015年3月27日 下午8:29:07  
 */

public class CheckImageUtil {
	private static CheckImageUtil checkImageUtil;
	private CheckImageUtil(){}

	public static CheckImageUtil newInstance(){
		if(checkImageUtil==null){
			checkImageUtil=new CheckImageUtil();
		}
		return checkImageUtil;
	}
	/**
	 * 后台验证图片是否符合规定(可按比例，也可按宽高)
	 * @param width  规定宽度 
	 * @param heigth  规定高度 
	 * @param sourceImg  图片文件
	 * @param isPercent true 验证比例  false 验证宽高
	 * @return  0.验证失败   1.图片大小不符合规定   2.图片比例不符合规定   -1.验证成功
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public static Integer checkImageScale(Integer width,Integer heigth,BufferedImage sourceImg, Boolean isPercent) throws FileNotFoundException, IOException{
		//如果为true按比例 为false按大小
		if(width==null||heigth==null||sourceImg==null||isPercent==null){
			return 0;
		} 
		
		if(isPercent){
			String imgResult= BigDecimaUtil.formatDouble(5, width/(heigth *1.0));
			String imgPercent = BigDecimaUtil.formatDouble(5, sourceImg.getWidth()/(sourceImg.getHeight()*1.0));
			if(imgPercent.equals(imgResult)){
				return -1;
			}
			return 2;
		} else{
			if(width.equals(sourceImg.getWidth())&&heigth.equals(sourceImg.getHeight())){
				return -1;
			}
			return 1;
		}
	}




/*	*//**
 * 后台验证图片是否符合规定(可按比例，也可按宽高)
 * @param width
 * @param heigth
 * @return
 * @throws IOException 
 * @throws FileNotFoundException 
 *//*
	public static boolean checkImageScale(Integer width,Integer heigth,BufferedImage sourceImg,boolean isPercent) throws FileNotFoundException, IOException{
		if(isPercent){
			double percent=width/heigth;
			//##.00%   百分比格式，后面不足2位的用0补齐 
			DecimalFormat df1 = new DecimalFormat("0.0%"); 
			String result= df1.format(percent);
			double imgPercent=sourceImg.getWidth()/sourceImg.getHeight();
			String imgResult=df1.format(imgPercent);
			if(result.equals(imgResult)){
				return true;
			}
		}else{
			if(width.equals(sourceImg.getWidth())&&heigth.equals(sourceImg.getHeight())){
				return true;
			}
			return false;
		}
		return false;
	}*/
}
