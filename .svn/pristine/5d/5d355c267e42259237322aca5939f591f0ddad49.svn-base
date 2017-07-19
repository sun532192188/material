package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 物资消耗商品目录
 * 
 * @author sunxiaorong
 *
 */
@Entity
@Table(name ="materialConsumeDetail")
public class MaterialConsumeDetail {

	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 消耗编号
	 */
	private Integer outStockId;
	/**
	 * 入库商品
	 */
	private Integer goodsId = 0;
	/**
	 * 商品单价
	 */
	private Double goodsPrice = 0.0;
	/**
	 * 入库数量
	 */
	private Double goodsNum = 0.0;
	/**
	 * 金额
	 */
	private Double singleMoney = 0.0;

	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOutStockId() {
		return outStockId;
	}

	public void setOutStockId(Integer outStockId) {
		this.outStockId = outStockId;
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

	public Double getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Double goodsNum) {
		this.goodsNum = goodsNum;
	}

	public Double getSingleMoney() {
		return singleMoney;
	}

	public void setSingleMoney(Double singleMoney) {
		this.singleMoney = singleMoney;
	}
}
