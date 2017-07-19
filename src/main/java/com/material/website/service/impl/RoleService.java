package com.material.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.material.website.args.RoleAddArgs;
import com.material.website.dao.IRoleDao;
import com.material.website.entity.Function;
import com.material.website.entity.Role;
import com.material.website.entity.RoleFunction;
import com.material.website.service.IRoleService;

/**
 * 角色业务实现类
 * @author sunxiaorong
 *
 */
@Service
public class RoleService implements IRoleService {
	
	@Inject
	private IRoleDao roleDao;

	@Override
	public Integer addRole(RoleAddArgs roleArgs) {
		Role role = new Role();
		role.setRoleName(roleArgs.getRoleName());
		role = roleDao.add(role);
		if(role != null){
			String[]roleFunctionArray =  roleArgs.getFunctions().split(",");
			for(String str :roleFunctionArray){
				Function function =  (Function) roleDao.getEntity(Function.class, Integer.valueOf(str));
			    RoleFunction roleFunction = new RoleFunction();
			    roleFunction.setFunctionId(function.getId());
			    roleFunction.setFunctionName(function.getFunctionName());
			    roleFunction.setRoleId(role.getId());
			    roleFunction.setUrl(function.getUrl());
			    roleDao.addEntity(roleFunction);
			}
			return role.getId();
		}
		return -1;
	}


	@Override
	public List<Role> queryRole() {
		return roleDao.queryRole();
	}
	
	@Override
	public Role queryRoleByName(String roleName){
		return roleDao.queryRoleByName(roleName);
	}


	@Override
	public Role queryRoleById(Integer roleId) {
		return roleDao.get(roleId);
	}


	@Override
	public List<RoleFunction> queryRoleFunctionByRoleId(Integer roleId) {
		return roleDao.queryRoleFunctionByRoleId(roleId);
	}


	@Override
	public Integer updateRole(RoleAddArgs updateArgs) {
		Role role = new Role();
		role.setRoleName(updateArgs.getRoleName());
		role.setId(updateArgs.getId());
	    roleDao.update(role);
	    roleDao.delRoleFunctionByRoleId(updateArgs.getId());
	    String[]roleFunctionArray =  updateArgs.getFunctions().split(",");
		for(String str :roleFunctionArray){
			Function function =  (Function) roleDao.getEntity(Function.class, Integer.valueOf(str));
		    RoleFunction roleFunction = new RoleFunction();
		    roleFunction.setFunctionId(function.getId());
		    roleFunction.setFunctionName(function.getFunctionName());
		    roleFunction.setRoleId(role.getId());
		    roleFunction.setUrl(function.getUrl());
		    roleDao.addEntity(roleFunction);
		}
	    return updateArgs.getId();
	}
}
