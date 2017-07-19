package com.material.website.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 部门月计划实体
 * @author sunxiaorong
 *
 */
@Entity
@Table(name="DepartPlan")
public class DepartPlan {
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
	 * 创建日期
	 */
	private Date createDate;
    /**
     * 总金额
     */
	private Double sumPrice = 0.0;
	/**
	 * 备注
	 */
	private String remarks = "";
	/**
	 * 申请状态   0.未申请   1.已申请
	 */
	private Integer status;
	/**
	 * 部门名称
	 */
	private String departmentName;
	
	@Id
	@GeneratedValue
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
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
}
