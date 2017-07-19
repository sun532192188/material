package com.material.website.args;

/**
 * 统计部门出库参数类
 * @author sunxiaorong
 *
 */
public class StatisDepartConsumeArgs {

    private String goodsName;
	
	private Integer categoryOne;
	
	private Integer categoryTwo;
	
	private String StartDate;
	
	private String endDate;
	
	private Integer departId;
	
	private Integer opeartType;
	

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getCategoryOne() {
		return categoryOne;
	}

	public void setCategoryOne(Integer categoryOne) {
		this.categoryOne = categoryOne;
	}

	public Integer getCategoryTwo() {
		return categoryTwo;
	}

	public void setCategoryTwo(Integer categoryTwo) {
		this.categoryTwo = categoryTwo;
	}

	public String getStartDate() {
		return StartDate;
	}

	public void setStartDate(String startDate) {
		StartDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Integer getDepartId() {
		return departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}

	public Integer getOpeartType() {
		return opeartType;
	}

	public void setOpeartType(Integer opeartType) {
		this.opeartType = opeartType;
	}
}
