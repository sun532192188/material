package com.material.website.dao;

import java.util.List;

import com.material.website.dto.FunctionDto;
import com.material.website.dto.RoleFunctionDto;
import com.material.website.entity.RoleFunction;

/**
 * 
 * @author sunxiaorong
 *
 */
public interface IRoleFunctionDao  extends IBase<RoleFunction> {
  
	/***
	 * 根据角色编号查询功能列表
	 * @param roleId
	 * @return
	 */
	public List<RoleFunctionDto> queryFunctionByRoleId(Integer roleId);
	
	/**
	 * 根据父功能编号查询功能列表
	 * @param parentId
	 * @return
	 */
	public List<FunctionDto> queryFunctionListByParentId(Integer parentId);
	
	/**
	 * 查询 所有 的一级功能
	 * @return
	 */
	public List<FunctionDto> queryAllFunction();
	
}
