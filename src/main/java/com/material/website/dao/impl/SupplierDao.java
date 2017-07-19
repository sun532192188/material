package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.args.SupplierQueryArgs;
import com.material.website.dao.BaseDao;
import com.material.website.dao.ISupplierDao;
import com.material.website.dto.SupplierDto;
import com.material.website.entity.Supplier;
import com.material.website.system.Pager;

/**
 * 供应商数据持久实现类
 * @author sunxiaorong
 *
 */
@Repository
public class SupplierDao extends BaseDao<Supplier> implements ISupplierDao {

	
	@Override
	public Pager<SupplierDto> querySupplierList(SupplierQueryArgs supplierArgs) {
		StringBuffer sql = new StringBuffer();
		List<String>args = new ArrayList<String>();
		sql.append("select * from supplier where 1=1 ");
		//比如按姓名  电话   地址
		if(StringUtils.isNotEmpty(supplierArgs.getSupplierName())){
			sql.append(" and (shortName like ? or fullName like ? )");
			args.add("%"+supplierArgs.getSupplierName()+"%");
			args.add("%"+supplierArgs.getSupplierName()+"%");
		}
		if(StringUtils.isNotEmpty(supplierArgs.getPhone())){
			sql.append(" and phone like ? ");
			args.add("%"+supplierArgs.getPhone()+"%");
		}
		if(StringUtils.isNotEmpty(supplierArgs.getAddress())){
			sql.append(" and address like ? ");
			args.add("%"+supplierArgs.getAddress()+"%");
		}
		sql.append(" order by id desc ");
		return super.findBySql(sql.toString(), args.toArray(), SupplierDto.class, false);
	}

	@Override
	public List<Supplier> queryAllSupplier() {
		String sql = "select * from supplier ";
		return super.listBySql(sql, Supplier.class, true);
	}
}
