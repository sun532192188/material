package com.material.website.system;

/**  
 * @Description: ajax对象/主要用来传输json数据(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class AjaxMsg {
	/**
	 * 是否成功
	 */
	private boolean success = true;
	/**
	 * 消息提示
	 */
	private String msg;
	/**
	 * 传输数据
	 */
	private Object entity;
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getEntity() {
		return entity;
	}
	public void setEntity(Object entity) {
		this.entity = entity;
	}
}
