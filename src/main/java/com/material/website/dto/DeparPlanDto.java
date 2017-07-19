package com.material.website.dto;

import java.util.Date;

import com.material.website.util.DateFormatUtils;

/**
 * 部门月计划业务类
 * 
 * @author sunxiaorong
 *
 */
public class DeparPlanDto {
	/**
	 * id
	 */
	private Integer id;
	/**
	 * 计划名称(比如:采购部一月份月计划申请)
	 */
	private String planName;
	/**
	 * 部门编号
	 */
	private Integer departmentId;

	/**
	 * 部门名称
	 */
	private String departmentName;
	/**
	 * 创建日期
	 */
	private String createDate = "";
	/**
	 * 总金额
	 */
	private Double sumPrice = 0.0;
	/**
	 * 备注
	 */
	private String remarks = "";
	/**
	 * 申请状态 0.未申请 1.已申请
	 */
	private Integer status;
	
	private String formatMoney;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		if(createDate != null){
			this.createDate = DateFormatUtils.date2str(createDate, "yyyy-MM-dd HH:mm:ss");
		}
	}

	public Double getSumPrice() {
		return sumPrice;
	}

	public void setSumPrice(Double sumPrice) {
		this.sumPrice = sumPrice;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getFormatMoney() {
		return formatMoney;
	}

	public void setFormatMoney(String formatMoney) {
		this.formatMoney = formatMoney;
	}
}
