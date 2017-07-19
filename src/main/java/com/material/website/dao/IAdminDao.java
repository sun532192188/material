package com.material.website.dao;

import com.material.website.dto.UserDto;
import com.material.website.entity.Admin;
import com.material.website.entity.LoginLog;
import com.material.website.system.Pager;

/**
 * @Description:管理员数据持久接口(功能描述)
 * @author 孙晓荣 sunxiaorong@yuntengzhiyong.com
 * @date 2015年5月20日 下午4:30:03
 */
public interface IAdminDao extends IBase<Admin> {

	/**
	 * 根据管理员名称加载管理员信息
	 * 
	 * @param username
	 * @return
	 */
	public Admin loadAdminByName(String username);

	/**
	 * 查询用户(分页)
	 * 
	 * @param departName
	 * @param roleId
	 * @return
	 */
	public Pager<UserDto> queryUserPager(String departName, Integer roleId,Integer remove);

	/**
	 * 根据管理员编号更改管理员状态
	 * 
	 * @param id
	 */
	public void updateStatus(Integer id);
	
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
	 * @param tableName
	 */
	public void deleteAllData(String tableName);
}
