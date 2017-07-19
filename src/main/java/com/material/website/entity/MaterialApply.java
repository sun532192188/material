package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 部门月计划物资申请
 * @author sunxiaorong
 *
 */
@Entity
@Table(name="materialapply")
public class MaterialApply {
   /**
    * 物资申请主键
    */
	private Integer id;
	/**
	 * 计划编号
	 */
	private Integer planId = 0;
	/**
	 *商品编号 
	 */
	private Integer goodsId ;
	/**
	 * 商品单价
	 */
	private Double price = 0.0;
	/**
	 * 商品数量
	 */
	private Double goodsNum = 0.0;
	/**
	 * 一种类型商品金额(水2.0 *2 = 4.0)
	 */
	private Double singlePrice = 0.0;
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
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
	public Double getSinglePrice() {
		return singlePrice;
	}
	public void setSinglePrice(Double singlePrice) {
		this.singlePrice = singlePrice;
	}
}
