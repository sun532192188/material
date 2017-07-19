package com.material.website.dao;

import java.util.List;

import com.material.website.entity.Role;
import com.material.website.entity.RoleFunction;

/**
 * 角色数据持久接口
 * @author sunxiaorong
 *
 */
public interface IRoleDao extends IBase<Role>{
	
	/**
	 * 查询所有的角色信息
	 * @return
	 */
	public List<Role> queryRole();
	
	/**
	 * 根据名称查询角色
	 * @param roleName
	 * @return
	 */
	public Role queryRoleByName(String roleName);
	
	/**
	 * 根据角色编号查询角色功能信息
	 * @param roleId
	 * @return
	 */
	public List<RoleFunction>queryRoleFunctionByRoleId(Integer roleId);
	
	/**
	 * 根据角色名称删除角色功能
	 * @param roleId
	 */
	public void delRoleFunctionByRoleId(Integer roleId);
	
}
