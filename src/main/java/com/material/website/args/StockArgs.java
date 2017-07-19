package com.material.website.args;

/**
 * 库存查询参数类
 * 
 * @author sunxiaorong
 * 
 */
public class StockArgs {

	private String goodsName;

	private Integer type;

	private Integer categoryOne;

	private Integer categoryTwo;
	
	private Integer operatType;
	
	
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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

	public Integer getOperatType() {
		return operatType;
	}

	public void setOperatType(Integer operatType) {
		this.operatType = operatType;
	}
}
