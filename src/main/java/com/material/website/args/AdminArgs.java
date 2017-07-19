package com.material.website.args;

import org.zh.validate.annotation.NotEmpty;

/**  
 * @Description: 管理员添加参数接收类(功能描述) 
 * @author 孙晓荣 sunxiaorong@yuntengzhiyong.com  
 * @date 2015年5月20日 下午5:57:43  
 */
public class AdminArgs {
	
	/**
	 * 主键id
	 */
	private Integer id;
	
	/**
	 * 用户名
	 */
	@NotEmpty
	private String userName;
	
	/**
	 * 所属部门
	 */
	private Integer departId;
	
	/**
	 * 密码
	 */
	@NotEmpty
	private String password;
	
	/**
	 * 所属角色
	 */
	@NotEmpty
	private Integer roleId;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getDepartId() {
		return departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
}
