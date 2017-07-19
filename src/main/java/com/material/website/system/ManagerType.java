package com.material.website.system;

/**  
 * @Description: 管理类型枚举 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月18日 下午5:43:00  
 */

public enum ManagerType {
	/**
	 *产品，资讯，运营，用户，财务，超级，所有人
	 */
	COUNT(0,"统计管理员"),PRODUCT(1,"产品管理员"),ADMIN(2,"超级管理员"),EVERYONE(3,"EveryOne");
	private int id;
	private String name;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @param id
	 * @param name
	 */
	private ManagerType(int id, String name) {
		this.id = id;
		this.name = name;
	}
}
