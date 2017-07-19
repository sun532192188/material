package com.material.website.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 部门物资消耗
 * 
 * @author sunxiaorong
 *
 */
@Entity
@Table(name = "materialConsume")
public class MaterialConsume {
	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 出库部门
	 */
	private Integer departId;
	/**
	 * 操作编号
	 */
	private String operatNo = "";
	/**
	 * 消耗日期
	 */
	private Date consumeDate = new Date();
	/**
	 * 消耗金额
	 */
	private Double consumeMoney = 0.0;
	/**
	 * 消耗类型 1.部门使用 2.部门调拨
	 */
	private Integer type = 1;
	/**
	 * 目标部门编号 如果为本部门消耗 则目标部门为本部门
	 */
	private Integer targetDepartId = 0;
	/**
	 * 备注
	 */
	private String remarks;
	
	/**
	 * 入账状态
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

	public String getOperatNo() {
		return operatNo;
	}

	public void setOperatNo(String operatNo) {
		this.operatNo = operatNo;
	}

	public Date getConsumeDate() {
		return consumeDate;
	}

	public void setConsumeDate(Date consumeDate) {
		this.consumeDate = consumeDate;
	}

	public Double getConsumeMoney() {
		return consumeMoney;
	}

	public void setConsumeMoney(Double consumeMoney) {
		this.consumeMoney = consumeMoney;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public Integer getTargetDepartId() {
		return targetDepartId;
	}

	public void setTargetDepartId(Integer targetDepartId) {
		this.targetDepartId = targetDepartId;
	}

	public Integer getDepartId() {
		return departId;
	}

	public void setDepartId(Integer departId) {
		this.departId = departId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
