package com.material.website.service;

import java.util.List;

import com.material.website.dto.FunctionDto;
import com.material.website.dto.RoleFunctionDto;
import com.material.website.entity.Function;

/**
 * 角色功能业务接口
 * @author sunxiaorong
 *
 */
public interface IRoleFunctionService {
	
	/**
	 * 根据角色编号查询
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
	
	/**
	 * 删除角色功能
	 * @param id
	 * @return
	 */
	public boolean delRoleFunction(Integer id);
	
	/**
	 * 根据id查询功能信息
	 * @param id
	 * @return
	 */
    public Function queryFunctionById(Integer id);
}
