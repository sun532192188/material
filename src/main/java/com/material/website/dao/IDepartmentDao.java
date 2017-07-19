package com.material.website.dao;

import java.util.List;

import com.material.website.dto.DepartmentDto;
import com.material.website.entity.Department;
import com.material.website.system.Pager;

/**
 * 部门数据持久接口
 * @author sunxiaorong
 *
 */
public interface IDepartmentDao extends IBase<Department>{

	/**
	 * 查询部门数据列表
	 * @return
	 */
	public Pager<DepartmentDto> queryDepartmentList(String departName,String phone);
	
	/**
	 * 查询所有的部门信息
	 * @return
	 */
	public List<Department> queryAllDepartMent();
	
}
