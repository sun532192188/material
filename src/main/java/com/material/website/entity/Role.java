package com.material.website.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 角色实体
 * @author sunxiaorong
 *
 */
@Entity
@Table(name="role")
public class Role {
    /**
     * 主键id
     */
	private Integer  id;
	/**
	 * 角色名称
	 */
	private String roleName = "";
	
	@Id
	@GeneratedValue
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
}
