package com.material.website.service;

import java.util.List;

import com.material.website.args.RoleAddArgs;
import com.material.website.entity.Role;
import com.material.website.entity.RoleFunction;

/**
 * 角色业务接口
 * @author sunxiaorong
 *
 */
public interface IRoleService {
    
	/**
     * 角色添加
     * @param role
     * @return
     */
	public Integer addRole(RoleAddArgs roleArgs);
	
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
	 * 根据角色名称查询角色信息
	 * @param roleId
	 * @return
	 */
	public Role queryRoleById(Integer roleId);
	
	/**
	 * 根据角色编号查询角色功能信息
	 * @param roleId
	 * @return
	 */
	public List<RoleFunction> queryRoleFunctionByRoleId(Integer roleId);
	
	/**
	 * 修改角色信息
	 * @param updateArgs
	 * @return
	 */
	public Integer updateRole(RoleAddArgs updateArgs);
	
}
