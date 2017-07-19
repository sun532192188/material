package com.material.website.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.args.StaticsStorageArgs;
import com.material.website.args.StorageQueryArgs;
import com.material.website.dao.BaseDao;
import com.material.website.dao.IStorageDao;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StaticsStorageDto;
import com.material.website.dto.StorageDto;
import com.material.website.entity.Storage;
import com.material.website.system.Pager;

/**
 * 入库数据持久实现类
 * @author sunxiaorong
 *
 */
@Repository
public class StorageDao extends BaseDao<Storage> implements IStorageDao {

	@Override
	public Integer getStorageCount(Integer type) {
		String sql = "select * from storage where 1=1 and storageDate like ? and storageType= ?";
		List<Object>args = new ArrayList<Object>();
		String nowTime = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
		args.add(nowTime+"%");
		args.add(type);
		List<Storage> list = null;
		try {
			list = super.listBySql(sql,args.toArray(),Storage.class, true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list.size();
	}

	@Override
	public Pager<StorageDto> queryStoragePager(StorageQueryArgs queryArgs) {
		StringBuffer sql = new StringBuffer();
		List<Object>args = new ArrayList<Object>();
		sql.append(" select s.id,s.storageNo,s.storageDate,FORMAT(s.storageMoney,2) as storageMoney,s.storageType,s.signName,s.remarks,sup.id as supplierId,sup.shortName as supplierName,d.id as signDepart,d.departmentName as department,s.status ");
		sql.append("  from storage as s,supplier as sup,department as d  ");
		sql.append("  where 1=1  and s.supplierId = sup.id and s.signDepart = d.id   ");
		if(StringUtils.isNotEmpty(queryArgs.getOperatNo())){
			sql.append(" and s.storageNo like ? ");
			args.add("%"+queryArgs.getOperatNo()+"%");
		}
		if(queryArgs.getSupplierId() != null){
			sql.append(" and s.supplierId = ?");
			args.add(queryArgs.getSupplierId());
		}
		if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
			sql.append(" and s.storageDate > ?");
			args.add(queryArgs.getStartDate());
		}
		if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
			sql.append(" and s.storageDate <= ? ");
			args.add(queryArgs.getEndDate());
		}
		if(queryArgs.getType() != null){
			sql.append(" and s.storageType = ? ");
			args.add(queryArgs.getType());
		}
		sql.append(" order by s.id desc ");
		return super.findBySql(sql.toString(),args.toArray(), StorageDto.class,false);
	}

	@Override
	public List<GoodsInstallDto> queryGoodsById(Integer id) {
		String sql = "select sm.id,sm.goodsId,g.goodsName,g.specModel,format(g.price,2) as formatPrice,g.spec,sm.goodsNum,format(sm.singleMoney,2) as formatMoney,g.goodsNo from storagematerial as sm,goods as g  where  sm.goodsId = g.id and sm.storageId="+id;
		return super.listBySql(sql, GoodsInstallDto.class, false);
	}

	@Override
	public Pager<StaticsStorageDto> staticsStoragePager(
			StaticsStorageArgs queryArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select sm.id,sm.goodsId,g.goodsName,g.goodsNo,sum(sm.goodsNum) as goodsNum,format(sm.goodsPrice,2) as formatPrice,format(sum(sm.singleMoney),2) as formatMoney,g.spec,g.goodsType,s.shortName as supplierName,g.specModel,st.remarks,sum(sm.singleMoney) as singleMoney ");
		sql.append(" from StorageMaterial as sm,supplier as s,goods as g,storage as st    ");
		sql.append(" where st.supplierId = s.id and sm.goodsId = g.id and sm.storageId = st.id ");
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			sql.append(" and g.goodsName like ? ");
			args.add("%"+queryArgs.getGoodsName()+"%");
		}
		if(queryArgs.getCategoryOne() != null){
			sql.append(" and g.categoryOne = ? ");
			args.add(queryArgs.getCategoryOne());
		}
		if(queryArgs.getCategoryTwo() != null){
			sql.append(" and g.categoryTwo =? ");
			args.add(queryArgs.getCategoryTwo());
		}
		if(queryArgs.getSupplierId() != null){
			sql.append(" and st.supplierId = ? ");
			args.add(queryArgs.getSupplierId());
		}
		if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
			sql.append(" and st.storageDate >= ? ");
			args.add(queryArgs.getStartDate() +" 00:00:00");
		}
		if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
			sql.append(" and st.storageDate <= ? ");
			args.add(queryArgs.getEndDate()+" 23:59:59");
		}
		if(queryArgs.getStorageType() != null){
			sql.append(" and st.storageType = ? ");
			args.add(queryArgs.getStorageType());
		}
		sql.append(" group by sm.goodsId,sm.goodsPrice ");
		return super.findBySql(sql.toString(),args.toArray(),StaticsStorageDto.class, false);
	}

	@Override
	public void updateOperatTemp(Integer operatId, Integer operatType,
			String operatNo) {
		String sql = "update operatTemp set operatId="+operatId+" ,operatType="+operatType+"  where operatNo= '"+operatNo+"'";
		super.updateBySql(sql);
	}

	@Override
	public Storage queryStorageByNo(String operatNo) {
		String sql = "select * from storage where storageNo = '"+operatNo+"'";
        List<Storage>list = super.listBySql(sql, Storage.class, true);
		return list.size()>0?list.get(0):null;
	}
	
}
