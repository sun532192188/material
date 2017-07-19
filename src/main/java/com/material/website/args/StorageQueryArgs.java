package com.material.website.args;

/**
 * 入库查询参数
 * 
 * @author sunxiaorong
 * 
 */
public class StorageQueryArgs {
	
	private Integer storageId;
	
	public String operatNo;

	public Integer supplierId;

	private String startDate;

	private String endDate;
	
	private Integer type;
	
	private Integer operatType;
	
	private String title;

	public String getOperatNo() {
		return operatNo;
	}

	public void setOperatNo(String operatNo) {
		this.operatNo = operatNo;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getOperatType() {
		return operatType;
	}

	public void setOperatType(Integer operatType) {
		this.operatType = operatType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getStorageId() {
		return storageId;
	}

	public void setStorageId(Integer storageId) {
		this.storageId = storageId;
	}
}
