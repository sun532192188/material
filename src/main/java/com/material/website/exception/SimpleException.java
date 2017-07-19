/*
 * Copyright (c) 2015.
 * 北京云腾致用科技有限公司
 */
package com.material.website.exception;

/**  
 * @Description: 异常类 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2015年4月18日 下午1:40:03  
 */

@SuppressWarnings("serial")
public class SimpleException extends RuntimeException {

	/**
	 * 错误状态
	 */
	private Integer status;
	
	/**
	 * @return the status
	 */
	public Integer getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(Integer status) {
		this.status = status;
	}

	/**
	 * 
	 */
	public SimpleException() {
		super();
	}

	/**
	 * @param message
	 * @param cause
	 * @param enableSuppression
	 * @param writableStackTrace
	 */
	public SimpleException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	/**
	 * @param message
	 * @param cause
	 */
	public SimpleException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * @param message
	 */
	public SimpleException(Integer status,String message) {
		super(message);
		this.status = status;
	}

	/**
	 * @param cause
	 */
	public SimpleException(Throwable cause) {
		super(cause);
	}

	/**
	 * @param message
	 */
	public SimpleException(String message) {
		super(message);
	}
}
