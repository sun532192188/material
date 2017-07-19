package com.material.website.service;

import com.material.website.args.AdminArgs;
import com.material.website.dto.UserDto;
import com.material.website.entity.Admin;
import com.material.website.entity.LoginLog;
import com.material.website.system.Pager;

/**  
 * @Description: 管理员业务接口(功能描述) 
 * @author 孙晓荣 sunxiaorong@yuntengzhiyong.com  
 * @date 2015年5月20日 下午2:21:57  
 */

public interface IAdminService {
    
	/**
	 * 根据管理员名称查询管理员信息
	 * @param username
	 * @return
	 */
	public Admin login(String username,String paddword);
	
	/**
	 * 加载管理员列表(分页)
	 * @return
	 */
	public Pager<UserDto> queryUserPager(String userName, Integer roleId,Integer remove);
	
	/**
	 * 管理员添加
	 * @param adminArgs
	 */
	public void add(AdminArgs userArgs);
	
	/**
	 * 修改管理员信息
	 * @param adminArgs
	 */
	public Admin update(AdminArgs userArgs);
	
	/**
	 * 更改管理员状态
	 * @param id
	 */
	public void updateStatus(Integer id);
	
	/**
	 * 根据编号加载管理员信息
	 * @param id
	 * @return
	 */
	public Admin loadAdminInfo(Integer id);
	
	/**
	 * 根据用户名查询管理员信息(检测用户名唯一性)
	 * @param username
	 * @return
	 */
	public Admin loadAdminByName(String username);
	
	/**
	 * 添加用户 登录日志
	 * @param userLoginLog
	 */
	public void addUserLoginLog(LoginLog userLoginLog);
	
	/**
	 * 根据用户名查询用户 登录日志
	 * @param userName
	 * @return
	 */
	public LoginLog queryLogByUserName(String userName);
	
	/**
	 * 根据用户名删除用户登录 日志
	 * @param userName
	 */
	public void updateLogByUserName(String userName,Integer status);
	
	/**
	 * 删除表中的所有数据
	 */
	public boolean deleteAllData(String tableName);
		
}
