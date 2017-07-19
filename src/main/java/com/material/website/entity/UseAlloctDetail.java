package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 领用/调拨 物资明细
 * 
 * @author sunxiaorong
 * 
 */
@Entity
@Table(name = "usealloctdetail")
public class UseAlloctDetail {
	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 领用/调拨单编号
	 */
	private Integer useAlloctId ;
	/**
	 * 物资编号
	 */
	private Integer goodsId = 0;
	/**
	 * 物资名称
	 */
	private String goodsName = "";
	/**
	 * 品牌型号
	 */
	private Integer goodsType;
	/**
	 * 单位
	 */
	private String spec = "";
	/**
	 * 数量
	 */
	private Double goodsNum = 0.0;
	/**
	 * 商品所属大类
	 */
	private Integer categoryOne = 0;

	/**
	 * 商品所属小类
	 */
	private Integer categoryTwo = 0;
	/**
	 * 单价
	 */
	private Double price = 0.0;
	/**
	 * 金额
	 */
	private Double singleMoney = 0.0;
	/**
	 * 供应商编号
	 */
	private Integer supplierId = 0;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUseAlloctId() {
		return useAlloctId;
	}

	public void setUseAlloctId(Integer useAlloctId) {
		this.useAlloctId = useAlloctId;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(Integer goodsType) {
		this.goodsType = goodsType;
	}

	public String getSpec() {
		return spec;
	}

	public void setSpec(String spec) {
		this.spec = spec;
	}

	public Double getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Double goodsNum) {
		this.goodsNum = goodsNum;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getSingleMoney() {
		return singleMoney;
	}

	public void setSingleMoney(Double singleMoney) {
		this.singleMoney = singleMoney;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
}
