package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.material.website.dao.BaseDao;
import com.material.website.dao.IRoleDao;
import com.material.website.entity.Role;
import com.material.website.entity.RoleFunction;

/**
 * 角色数据持久实现
 * @author sunxiaorong
 *
 */
@Repository
public class RoleDao extends BaseDao<Role> implements IRoleDao {

	@Override
	public List<Role> queryRole() {
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from role ");
		return super.listBySql(sql.toString(), Role.class, true);
	}
	
	@Override
	public Role queryRoleByName(String roleName){
		List<String>args = new ArrayList<String>();
		String sql = "select * from role where roleName= ? ";
		args.add(roleName);
		List<Role>list = super.listBySql(sql,args.toArray(), Role.class, true);
		return list.size() >0?list.get(0):null;
	}

	@Override
	public List<RoleFunction> queryRoleFunctionByRoleId(Integer roleId) {
		String sql = "select * from roleFunction where roleId ="+roleId;
		return super.listBySql(sql, RoleFunction.class, true);
	}

	@Override
	public void delRoleFunctionByRoleId(Integer roleId) {
		String sql = "delete from roleFunction where roleId ="+roleId;
		super.updateBySql(sql);
	}

}
