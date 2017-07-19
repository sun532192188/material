package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品基本信息实体
 * @author sunxiaorong
 *
 */
@Entity 
@Table(name="goods")
public class Goods {
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
	private Double price = 0.0;
	/**
	 * 规格型号
	 */
	private String specModel = "";
	/**
	 * 单位
	 */
	private String spec = "";
	/**
	 * 可否为小数  1 可以  0不可以
	 */
	private Integer isDecimal;
	/**
	 * 1.物资  2.固定资产
	 */
	private Integer goodsType;
	/**
	 * 所属大类
	 */
	private Integer categoryOne;
	/**
	 * 所属小类
	 */
	private Integer categoryTwo;
	/**
	 * 所属供应商
	 */
	private Integer supplierId;
	/**
	 * 状态  0.正常  1.移除
	 */
	private Integer status;
	
	@Id
	@GeneratedValue
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
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
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
	public Integer getIsDecimal() {
		return isDecimal;
	}
	public void setIsDecimal(Integer isDecimal) {
		this.isDecimal = isDecimal;
	}
	public Integer getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(Integer goodsType) {
		this.goodsType = goodsType;
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
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
}
