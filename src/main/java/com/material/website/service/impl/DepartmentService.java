package com.material.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.material.website.dao.IDepartmentDao;
import com.material.website.dto.DepartmentDto;
import com.material.website.entity.Department;
import com.material.website.service.IDepartmentService;
import com.material.website.system.Pager;

/**
 * 部门业务实现类
 * @author sunxiaorong
 *
 */
@Service
public class DepartmentService implements IDepartmentService {
	
	@Inject
	private IDepartmentDao departmentDao;

	@Override
	public Pager<DepartmentDto> queryDepartmentList(String departName,String phone) {
		return departmentDao.queryDepartmentList(departName, phone);
	}

	@Override
	public boolean addDepartment(Department department) {
		try {
			departmentDao.addEntity(department);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateDepartment(Department department) {
		try {
			departmentDao.updateEntity(department);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Department loadDepartment(Integer departId) {
		Department department = departmentDao.get(departId);
		return department;
	}

	@Override
	public List<Department> queryAllDepartMent() {
		return departmentDao.queryAllDepartMent();
	}

}
