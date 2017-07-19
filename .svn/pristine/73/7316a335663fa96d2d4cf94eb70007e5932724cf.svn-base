package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 物资操作临时表
 * @author sunxiaorong
 *
 */
@Entity
@Table(name="operatTemp")
public class OperatTemp {
	
	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 操作类型主键(保存操作完成后该字段中保存相应的主键)
	 */
	private Integer operatId;
	/**
	 * 供应商编号
	 */
	private Integer supplierId;
	/**
	 * 操作类型 1.验收入库 2.预存入库  3.调拨  4.领用 5.部门出库 6.部门调拨
	 */
	private Integer operatType;
	/**
	 * 操作编号  验收  预存  领用  调拨  出库  部门调拨
	 */
	private String operatNo;
	
	/**
	 * 商品编号
	 */
	private Integer goodsId;
	/**
	 * 商品编号
	 */
	private String goodsNo;
	/**
	 * 商品名称
	 */
	private String goodsName;
	/**
	 * 商品型号
	 */
	private String specModel;
	/**
	 * 单位
	 */
	private String spec;
	/**
	 * 单价
	 */
	private Double price;
	/**
	 * 商品数量
	 */
	private Double goodsNum;
	
	/**
	 * 金额
	 */
	private Double singleMoney;
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}
	public String getOperatNo() {
		return operatNo;
	}
	public void setOperatNo(String operatNo) {
		this.operatNo = operatNo;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public String getSpecModel() {
		return specModel;
	}
	public void setSpecModel(String specModel) {
		this.specModel = specModel;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Double getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(Double goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
	}
	public Double getSingleMoney() {
		return singleMoney;
	}
	public void setSingleMoney(Double singleMoney) {
		this.singleMoney = singleMoney;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getOperatId() {
		return operatId;
	}
	public void setOperatId(Integer operatId) {
		this.operatId = operatId;
	}
	public Integer getOperatType() {
		return operatType;
	}
	public void setOperatType(Integer operatType) {
		this.operatType = operatType;
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
}
