package com.material.website.args;

public class DepartPlanAddArgs {

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 部门编号
	 */
	private Integer departmentId;
	/**
	 * 总金额
	 */
	private Double sumPrice;
	/**
	 * 备注
	 */
	private String remarks = "";
	/**
	 * 申请状态 0.未申请 1.已申请
	 */
	private Integer status;
	
	/**
	 * 临时id
	 */
	private String tempId;
	
	/**
	 * 计划名称
	 */
	private String planName;
	
	private String departmentName;
	
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Double getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(Double sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTempId() {
		return tempId;
	}

	public void setTempId(String tempId) {
		this.tempId = tempId;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
}
