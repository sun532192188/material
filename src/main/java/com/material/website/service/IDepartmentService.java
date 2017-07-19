package com.material.website.service;

import java.util.List;

import com.material.website.dto.DepartmentDto;
import com.material.website.entity.Department;
import com.material.website.system.Pager;

/**
 * 部门业务接口
 * @author sunxiaorong
 *
 */
public interface IDepartmentService {

	/**
	 * 查询部门数据列表
	 * @return
	 */
	public Pager<DepartmentDto> queryDepartmentList(String departName,String phone);
	
	/**
	 * 添加部门数据
	 * @param department
	 * @return
	 */
	public  boolean addDepartment(Department department);
	
	/**
	 * 修改部门数据
	 * @param department
	 * @return
	 */
	public boolean updateDepartment(Department department);
	
	/**
	 * 根据编号加载部门信息
	 * @param departId
	 * @return
	 */
	public Department loadDepartment(Integer departId);
	
	/**
	 * 查询所有的部门
	 * @return
	 */
	public List<Department> queryAllDepartMent();
	
}
