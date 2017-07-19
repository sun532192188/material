package com.material.website.dto;

/**
 * 功能业务参数类
 * @author sunxiaorong
 *
 */
public class FunctionDto {

	/**
	 * 主键编号
	 */
	private Integer id;
	/**
	 * 功能名称
	 */
	private String functionName = "";
	
	/**
	 * 功能路径
	 */
	private String url = "";
	/**
	 * 父模块编号
	 */
	
	private Integer parentId = 0;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
}
