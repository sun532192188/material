package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 库存实体
 * @author sunxiaorong
 *
 */
@Entity
@Table(name="stock")
public class Stock {
   
	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 商品编号
	 */
	private Integer goodsId = 0;
	/**
	 * 商品单价
	 */
	private Double goodsPrice = 0.0;
	/**
	 * 供应商
	 */
	public Integer supplierId;
	/**
	 * 数量
	 */
	private Double stockNum = 0.0;
	/**
	 * 1.物资  2.固定资产
	 */
	private Integer goodsType = 0;
	/**
	 * 1.验收  2.预存
	 */
	private Integer stockType = 0 ;
	/**
	 * 一级分类
	 */
	private Integer categoryOne;
	/**
	 * 二级分类
	 */
	private Integer categoryTwo;
	/**
	 * 备注
	 */
	private String remarks = "";
	
	
	@Id 
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Double getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public Double getStockNum() {
		return stockNum;
	}
	public void setStockNum(Double stockNum) {
		this.stockNum = stockNum;
	}
	public Integer getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(Integer goodsType) {
		this.goodsType = goodsType;
	}
	public Integer getStockType() {
		return stockType;
	}
	public void setStockType(Integer stockType) {
		this.stockType = stockType;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
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
