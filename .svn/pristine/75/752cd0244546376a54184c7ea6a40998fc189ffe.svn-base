package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 角色功能关联表
 * 
 * @author sunxiaorong
 * 
 */
@Entity
@Table(name="rolefunction")
public class RoleFunction {

	private Integer id;
	/**
	 * 角色编号
	 */
	private Integer roleId;
	/**
	 * 功能编号
	 */
	private Integer functionId;
	/**
	 * 功能名称
	 */
	private String functionName;
	/**
	 * ' 功能路径
	 */
	private String url;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getFunctionId() {
		return functionId;
	}

	public void setFunctionId(Integer functionId) {
		this.functionId = functionId;
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
}
