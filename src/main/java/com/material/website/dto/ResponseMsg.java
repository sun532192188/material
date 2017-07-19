package com.material.website.dto;

import java.util.HashMap;
import java.util.Map;
/**
 * 创建接口返回类
 * @author sunxiaorong
 *
 */
public class ResponseMsg {
	/**
	 * 返回消息状态
	 */
	private Integer status;
	/**
	 *返回错误信息
	 */
	private String msg;
	/**
	 * 返回接口数据
	 */
	private Map<String, Object>resultMap = new HashMap<String, Object>();

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(Map<String, Object> resultMap) {
		this.resultMap = resultMap;
	}
	
}
