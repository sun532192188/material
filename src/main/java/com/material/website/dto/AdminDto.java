package com.material.website.dto;

/**
 * @Description: 管理员数据业务类(功能描述)
 * @author 孙晓荣 sunxiaorong@yuntengzhiyong.com
 * @date 2015年5月20日 下午4:40:15
 */

public class AdminDto {

	private Integer id;
	private String username;
	private String realname;
	private Integer role;
	private Integer remove;

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the realname
	 */
	public String getRealname() {
		return realname;
	}

	/**
	 * @param realname
	 *            the realname to set
	 */
	public void setRealname(String realname) {
		this.realname = realname;
	}

	/**
	 * @return the role
	 */
	public Integer getRole() {
		return role;
	}

	/**
	 * @param role
	 *            the role to set
	 */
	public void setRole(Integer role) {
		this.role = role;
	}

	/**
	 * @return the remove
	 */
	public Integer getRemove() {
		return remove;
	}

	/**
	 * @param remove
	 *            the remove to set
	 */
	public void setRemove(Integer remove) {
		this.remove = remove;
	}
}
