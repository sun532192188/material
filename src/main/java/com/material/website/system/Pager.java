package com.material.website.system;

import java.util.ArrayList;
import java.util.List;

/**  
 * @Description: 系统底层分页对象(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class Pager<T> {
	/**
	 * 每页显示的条数
	 */
	private int size;
	/**
	 * 总页数
	 */
	private long totalPage;
	/**
	 * 当前页
	 */
	private int currentPage;
	/**
	 * 当前起始记录数
	 */
	private int offset;
	/**
	 * 总记录数
	 */
	private long total;
	/**
	 * 分页的数据
	 */
	private List<T> rows = new ArrayList<T>();
	
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	/**
	 * @return the totalPage
	 */
	public long getTotalPage() {
		return totalPage;
	}
	/**
	 * @return the currentPage
	 */
	public int getCurrentPage() {
		return currentPage;
	}
	/**
	 * @param currentPage the currentPage to set
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	/**
	 * @param totalPage the totalPage to set
	 */
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
}
