package com.material.website.dto;

import java.util.Date;

import com.material.website.util.DateFormatUtils;

/**
 * 入库业务参数
 * 
 * @author sunxiaorong
 * 
 */
public class StorageDto {
	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 入库编号
	 */
	private String storageNo;
	/**
	 * 供应商编号
	 */
	private Integer supplierId;
	/**
	 * 供应商名称
	 */
	private String supplierName;
	/**
	 * 入库日期
	 */
	private String storageDate;
	/**
	 * 入库物资金额
	 */
	private String storageMoney;
	/**
	 * 入库类型 1.验收 2.预存
	 */
	private Integer storageType;
	/**
	 * 签收部门
	 */
	private Integer signDepart;
	/**
	 * 部门名称
	 */
	private String department;
	/**
	 * 签收员姓名
	 */
	private String signName;
	/**
	 * 备注
	 */
	private String remarks;
	
	private String formatMoney;
	
	private Integer status;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStorageNo() {
		return storageNo;
	}

	public void setStorageNo(String storageNo) {
		this.storageNo = storageNo;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getStorageDate() {
		return storageDate;
	}

	public void setStorageDate(Date storageDate) {
		if(storageDate != null){
			this.storageDate = DateFormatUtils.date2str(storageDate, "YYYY-MM-dd HH:mm:ss");
		}
		
	}

	public String getStorageMoney() {
		return storageMoney;
	}

	public void setStorageMoney(String storageMoney) {
		this.storageMoney = storageMoney;
	}

	public Integer getStorageType() {
		return storageType;
	}

	public void setStorageType(Integer storageType) {
		this.storageType = storageType;
	}
	public Integer getSignDepart() {
		return signDepart;
	}

	public void setSignDepart(Integer signDepart) {
		this.signDepart = signDepart;
	}

	public String getSignName() {
		return signName;
	}

	public void setSignName(String signName) {
		this.signName = signName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getFormatMoney() {
		return formatMoney;
	}

	public void setFormatMoney(String formatMoney) {
		this.formatMoney = formatMoney;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
