package com.material.website.dto;

import java.util.Date;

import com.material.website.util.DateFormatUtils;


/**
 * 部门出库查询业务类
 * 
 * @author sunxiaorong
 *
 */
public class MaterialConsumeDto {

	/**
	 * 主键
	 */
	private Integer id;
	/**
	 * 操作编号
	 */
	private String operatNo = "";
	/**
	 * 消耗日期
	 */
	private String consumeDate;
	/**
	 * 消耗金额
	 */
	private String consumeMoney;
	/**
	 * 消耗类型 1.部门使用 2.部门调拨
	 */
	private Integer type = 1;
	/**
	 * 目标部门编号 如果为本部门消耗 则目标部门为本部门
	 */
	private Integer targetDepartId = 0;

	/**
	 * 物资去向部门
	 */
	private String tartgetDepartName;

	/**
	 * 备注
	 */
	private String remarks;
	
	/**
	 * 入账状态  0.未入账  1.已入库
	 */
	private Integer status;

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

	public String getConsumeDate() {
		return consumeDate;
	}

	public void setConsumeDate(Date consumeDate) {
		if(consumeDate != null){
			this.consumeDate = DateFormatUtils.date2str(consumeDate, "yyyy-MM-dd HH:mm:ss");
		}
	}

	public String getConsumeMoney() {
		return consumeMoney;
	}

	public void setConsumeMoney(String consumeMoney) {
		this.consumeMoney = consumeMoney;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getTargetDepartId() {
		return targetDepartId;
	}

	public void setTargetDepartId(Integer targetDepartId) {
		this.targetDepartId = targetDepartId;
	}

	public String getTartgetDepartName() {
		return tartgetDepartName;
	}

	public void setTartgetDepartName(String tartgetDepartName) {
		this.tartgetDepartName = tartgetDepartName;
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
}
