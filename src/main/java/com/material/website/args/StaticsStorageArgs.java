package com.material.website.args;

/**
 * 统计入库参数类
 * 
 * @author sunxiaorong
 * 
 */
public class StaticsStorageArgs {

	private String goodsName;

	private Integer categoryOne;

	private Integer categoryTwo;

	private Integer supplierId;

	private String startDate;

	private String endDate;
	
	private Integer storageType;
	
	private Integer operatType;
	
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

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
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

	public Integer getStorageType() {
		return storageType;
	}

	public void setStorageType(Integer storageType) {
		this.storageType = storageType;
	}

	public Integer getOperatType() {
		return operatType;
	}

	public void setOperatType(Integer operatType) {
		this.operatType = operatType;
	}
}
