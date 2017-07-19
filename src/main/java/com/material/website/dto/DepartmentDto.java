package com.material.website.dto;

/**
 * 部门业务类
 * @author sunxiaorong
 *
 */
public class DepartmentDto {
	/**
	 * 部门主键编号
	 */
	private Integer id;
	/**
	 * 部门名称
	 */
	private String departmentName;
	/**
	 * 描述
	 */
	private String description;
	/**
	 * 部门电话
	 */
	private String phone;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
