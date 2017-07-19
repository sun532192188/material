package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.dao.BaseDao;
import com.material.website.dao.IDepartmentDao;
import com.material.website.dto.DepartmentDto;
import com.material.website.entity.Department;
import com.material.website.system.Pager;

/**
 * 数据持久实现类
 * @author sunxiaorong
 *
 */
@Repository
public class DepartmentDao extends BaseDao<Department> implements IDepartmentDao {

	@Override
	public Pager<DepartmentDto> queryDepartmentList(String departName,String phone) {
		List<String>args = new ArrayList<String>();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from department where 1=1 ");
		if(StringUtils.isNotEmpty(departName)){
			sql.append(" and departmentName like ?");
			args.add("%"+departName+"%");
		}
		if(StringUtils.isNotEmpty(phone)){
			sql.append(" and phone like ?");
			args.add("%"+phone+"%");
		}
		sql.append(" order by id desc ");
		return super.findBySql(sql.toString(),args.toArray(),DepartmentDto.class, false);
	}

	@Override
	public List<Department> queryAllDepartMent() {
		String sql = "select * from department ";
		return super.listBySql(sql, DepartmentDto.class, false);
	}

}
