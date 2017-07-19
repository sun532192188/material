package com.material.website.args;

/**
 * 部门使用参数类
 * 
 * @author sunxiaorong
 * 
 */
public class UseAlloctQueryArgs {

	private Integer departId;

	private String operatNo;

	private String startDate;

	private String endDate;
	
	private Integer type;

	public Integer getDepartId() {
		return departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}

	public String getOperatNo() {
		return operatNo;
	}

	public void setOperatNo(String operatNo) {
		this.operatNo = operatNo;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}
