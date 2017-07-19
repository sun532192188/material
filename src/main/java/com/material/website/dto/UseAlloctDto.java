package com.material.website.dto;

import java.util.Date;

import com.material.website.util.DateFormatUtils;


/**
 * 物资领用业务类
 * @author sunxiaorong
 *
 */
public class UseAlloctDto {

	/**
     * 领用编号
     */
	private Integer id;
	/**
	 * 领用/调拨编号
	 */
	private String operatNo = "";
	/**
	 * 领用/调拨日期
	 */
	private String useAlloctDate = "";
	/**
	 * 领用部门
	 */
	private Integer departmentId = 0;
	/**
	 * 部门名称
	 */
	private String departName = "";
	/**
	 * 总金额
	 */
	private String sumMoney;
	/**
	 * 备注
	 */
	private String remarks = "";
	/**
	 * 操作类型   1.领用   2.调拨
	 */
	private Integer type = 0;
	
	/**
	 * 领用员
	 */
	private String useName;
	
	/**
	 * 入账状态  0.未入账   1.已入账
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
	public String getUseAlloctDate() {
		return useAlloctDate;
	}
	public void setUseAlloctDate(Date useAlloctDate) {
		if(useAlloctDate != null){
			this.useAlloctDate = DateFormatUtils.date2str(useAlloctDate, "yyyy-MM-dd HH:mm:ss");
		}
	}
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartName() {
		return departName;
	}
	public void setDepartName(String departName) {
		this.departName = departName;
	}
	public String getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(String sumMoney) {
		this.sumMoney = sumMoney;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getUseName() {
		return useName;
	}
	public void setUseName(String useName) {
		this.useName = useName;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
