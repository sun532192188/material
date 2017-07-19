package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.dao.BaseDao;
import com.material.website.dao.IOpeartTempDao;
import com.material.website.entity.OperatTemp;

@Repository
public class OperatTempDao extends BaseDao<OperatTemp> implements
		IOpeartTempDao {

	@Override
	public OperatTemp loadTemp(Integer goodsId, Integer supplierId,
			String operatNo,Double goodsPrice) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from operatTemp where 1=1 ");
		if(goodsId != null){
			sql.append(" and goodsId = ? ");
			args.add(goodsId);
		}
		if(StringUtils.isNotEmpty(operatNo)){
			sql.append("  and operatNo=? ");
			args.add(operatNo);
		}
		if(supplierId != null){
			sql.append(" and supplierId=? ");
			args.add(supplierId);
		}
		if(goodsPrice != null){
			sql.append(" and price = ? ");
			args.add(goodsPrice);
		}
		List<OperatTemp> list = super.listBySql(sql.toString(), args.toArray(), OperatTemp.class, true);
		return list.size()>0?list.get(0):null;
	}

}
