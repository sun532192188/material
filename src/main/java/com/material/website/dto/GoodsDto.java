package com.material.website.dto;

/**
 * 
 * @author sunxiaorong
 * 
 */
public class GoodsDto {
	/**
	 * 商品编号
	 */
	private Integer id;
	/**
	 * 商品名称
	 */
	private String goodsName = "";
	/**
	 * 商品编号(可选商品首字母 )
	 */
	private String goodsNo = "";
	/**
	 * 商品单价
	 */
	private String price ;
	/**
	 * 规格型号
	 */
	private String specModel = "";
	/**
	 * 单位
	 */
	private String spec = "";
	/**
	 * 1.物资 2.固定资产
	 */
	private Integer goodsType;
	/**
	 * 商品大类名称
	 */
	private String categoryOneName;
	/**
	 * 商品小类名称
	 */
	private String categoryTwoName;
	/**
	 * 所属供应商
	 */
	private String supplierName;
	/**
	 * 移除状态
	 */
	private Integer status;
	
	//修改使用
	/**
	 * 供应商编号
	 */
	private Integer supplierId;
	/**
	 * 规格
	 */
	private Integer isDecimal;
	
	private Integer categoryOne;
	
	private Integer categoryTwo;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSpecModel() {
		return specModel;
	}
	public void setSpecModel(String specModel) {
		this.specModel = specModel;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public Integer getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(Integer goodsType) {
		this.goodsType = goodsType;
	}
	public String getCategoryOneName() {
		return categoryOneName;
	}
	public void setCategoryOneName(String categoryOneName) {
		this.categoryOneName = categoryOneName;
	}
	public String getCategoryTwoName() {
		return categoryTwoName;
	}
	public void setCategoryTwoName(String categoryTwoName) {
		this.categoryTwoName = categoryTwoName;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public Integer getIsDecimal() {
		return isDecimal;
	}
	public void setIsDecimal(Integer isDecimal) {
		this.isDecimal = isDecimal;
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
}
