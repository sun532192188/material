package com.material.website.dto;

/***
 * 库存出库统计业务类
 * 
 * @author sunxiaorong
 * 
 */
public class StatisUseAlloctDto {

	private Integer id;

	private Integer goodsId;

	private String goodsNo="";

	private Double goodsNum;

	private Double goodsPrice;

	private Double singleMoney;

	private String goodsName="";

	private String spec="";

	private Integer goodsType;

	private String departmentName = "";

	/**
	 * 规格型号
	 */
	private String specModel = "";

	private String remarks;
	
	private String formatPrice="";
	
	private String formatMoney="";

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

	public String getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}

	public Double getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(Double goodsNum) {
		this.goodsNum = goodsNum;
	}

	public Double getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Double goodsPrice) {
		this.goodsPrice = goodsPrice;
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

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getSpecModel() {
		return specModel;
	}

	public void setSpecModel(String specModel) {
		this.specModel = specModel;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getFormatPrice() {
		return formatPrice;
	}

	public void setFormatPrice(String formatPrice) {
		this.formatPrice = formatPrice;
	}

	public String getFormatMoney() {
		return formatMoney;
	}

	public void setFormatMoney(String formatMoney) {
		this.formatMoney = formatMoney;
	}
}
