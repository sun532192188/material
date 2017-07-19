package com.material.website.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.dao.BaseDao;
import com.material.website.dao.IAdminDao;
import com.material.website.dto.UserDto;
import com.material.website.entity.Admin;
import com.material.website.entity.LoginLog;
import com.material.website.system.Pager;

/**  
 * @Description: 管理员数据持久层(功能描述) 
 * @author 孙晓荣 sunxiaorong@yuntengzhiyong.com  
 * @date 2015年5月20日 下午4:32:32  
 */
@Repository
public class AdminDao extends  BaseDao<Admin> implements IAdminDao{

	/* (non-Javadoc)
	 * @see org.ytzy.app.dao.IEntityInfoDao#loadAdminByName(java.lang.String)
	 */
	@Override
	public Admin loadAdminByName(String username) {
		String  sql="select * from admin where username=?";
		List<Admin>list=super.listBySql(sql,username, Admin.class, true);
		return  list.size()>0?list.get(0):null;
	}


	/* (non-Javadoc)
	 * @see org.ytzy.app.dao.IAdminDao#updateStatus(java.lang.Integer)
	 */
	@Override
	public void updateStatus(Integer id) {
		String sql="update admin set remove=abs(remove-1) where id=?";
		super.updateBySql(sql, id);
	}


	@Override
	public Pager<UserDto> queryUserPager(String userName, Integer roleId,Integer remove) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select ad.id,ad.userName,ad.departId,d.departmentName ,ad.roleId,r.roleName,ad.remove  ");
		sql.append("  from admin as ad,role as r,department as d ");
		sql.append(" where ad.roleId = r.id and ad.departId = d.id  ");
		if(StringUtils.isNotEmpty(userName)){
			sql.append(" and ad.userName like ? ");
			args.add("%"+userName+"%");
		}
		if(roleId != null){
			sql.append(" and ad.roleId =  ? ");
			args.add(roleId);
		}
		if(remove != null){
			sql.append(" and ad.remove =  ? ");
			args.add(remove);
		}else{
			sql.append(" and ad.remove = 0 ");
		}
		sql.append(" order by ad.id desc ");
		return super.findBySql(sql.toString(), args.toArray(), UserDto.class, false);
	}


	@Override
	public LoginLog queryLogByUserName(String userName) {
		List<Object>args = new ArrayList<Object>();
		String sql = "select * from loginlog where userName = ?";
		args.add(userName);
		List<LoginLog>list = super.listBySql(sql,args.toArray(), LoginLog.class, true);
		return list.size()>0?list.get(0):null;
	}


	@Override
	public void updateLogByUserName(String userName,Integer status) {
		String sql = "update loginLog set status="+status;
		if(status == 1){
			sql += " ,loginTime ='"+ new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(new Date())+"'";
		}
		sql += " where userName = '"+userName+"'";
		super.updateBySql(sql);
		
	}


	@Override
	public void deleteAllData(String tableName) {
       String sql = "delete from  "+tableName;
        super.updateBySql(sql);
	}
}
