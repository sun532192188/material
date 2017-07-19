package com.material.website.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.args.StatisUseAlloctArgs;
import com.material.website.args.UseAlloctQueryArgs;
import com.material.website.dao.BaseDao;
import com.material.website.dao.IUseAlloctDao;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StatisUseAlloctDto;
import com.material.website.dto.UseAlloctDto;
import com.material.website.entity.UseAlloct;
import com.material.website.system.Pager;

/**
 * 物资领用持久类
 * @author sunxiaorong
 *
 */
@Repository
public class UseAlloctDao extends BaseDao<UseAlloct> implements IUseAlloctDao {

	@Override
	public Pager<UseAlloctDto> queryDepartUsePager(UseAlloctQueryArgs queryArgs) {
        List<Object>args = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer();
        sql.append(" select ua.id,ua.operatNo,ua.useAlloctDate,ua.departmentId,d.departmentName as departName,format(ua.sumMoney,2) as sumMoney,ua.remarks,ua.useName,ua.type,ua.status  ");
		sql.append(" from useAlloct as ua,department as d  ");
		sql.append(" where ua.departmentId = d.id ");
		if(StringUtils.isNotEmpty(queryArgs.getOperatNo())){
			sql.append(" and ua.operatNo like ? ");
			args.add("%"+queryArgs.getOperatNo()+"%");
		}
		if(queryArgs.getDepartId() != null){
			sql.append(" and ua.departmentId = ? ");
			args.add(queryArgs.getDepartId());
		}
		if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
			sql.append(" and ua.useAlloctDate >= ? ");
			args.add(queryArgs.getStartDate());
		}
		if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
			sql.append(" and ua.useAlloctDate <= ? ");
			args.add(queryArgs.getEndDate());
		}
		if(queryArgs.getType() != null && queryArgs.getType() != 3){
			sql.append(" and ua.type = ? ");
			args.add(queryArgs.getType());
			//如果类型为为3 则只查询已入账数据
			if(queryArgs.getType() == 3){
				sql.append(" and ua.status =1 ");
			}
		}
		sql.append(" order by ua.id desc ");
        return super.findBySql(sql.toString(),args.toArray(),UseAlloctDto.class,false);
	}

	@Override
	public Integer queryUseAlloct(Integer type) {
		String sql  = " select * from useAlloct where 1=1 and type = "+type+" and useAlloctDate like '"+new SimpleDateFormat("YYYY-MM-dd").format(new Date())+"%'";
		List<UseAlloct>list = super.listBySql(sql, UseAlloct.class,true);
		return list.size()>0?list.size():0;
	}

	@Override
	public UseAlloct queryByOperatNo(String operatNo,Integer type) {
		String sql = "select * from useAlloct where operatNo='"+operatNo+"' and type ="+type;
		List<UseAlloct> list = null;
		try {
			list = super.listBySql(sql, UseAlloct.class,true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list.size()>0?list.get(0):null;
	}

	@Override
	public List<GoodsInstallDto> queryGoodsList(Integer useAlloctId) {
		String sql = "select g.goodsNo, ud.id,ud.goodsId,g.goodsName,g.specModel,ud.price,g.spec,ud.goodsNum,ud.singleMoney,g.supplierId from usealloctDetail as ud,goods as g  where  ud.goodsId = g.id  and ud.useAlloctId="+useAlloctId;
		return super.listBySql(sql, GoodsInstallDto.class, false);
	}

	@Override
	public Pager<StatisUseAlloctDto> statisUseAlloctPager(
			StatisUseAlloctArgs queryArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select uad.id,uad.goodsId,g.goodsNo,sum(uad.goodsNum) as goodsNum,format(uad.price,2) as formatPrice,format(sum(uad.singleMoney),2) as formatMoney,g.goodsName,g.spec,g.goodsType,g.specModel,d.departmentName  ");
		sql.append(" from UseAlloctDetail as uad,UseAlloct as ua,goods as g,department as d   ");
		sql.append(" where uad.useAlloctId = ua.id and uad.goodsId = g.id and ua.departmentId = d.id ");
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			sql.append(" and g.goodsName like ? ");
			args.add("%"+queryArgs.getGoodsName()+"%");
		}
		if(queryArgs.getCategoryOne() != null){
			sql.append(" and g.categoryOne = ? ");
			args.add(queryArgs.getCategoryOne());
		}
		if(queryArgs.getCategoryTwo() != null){
			sql.append(" and g.categoryTwo = ? ");
			args.add(queryArgs.getCategoryTwo());
		}
		if(queryArgs.getDepartId()!= null){
			sql.append(" and ua.departmentId = ? ");
			args.add(queryArgs.getDepartId());
		}
		if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
			sql.append(" and ua.useAlloctDate >= ? ");
			args.add(queryArgs.getStartDate()+" 00:00:00");
		}
		if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
			sql.append(" and ua.useAlloctDate <= ? ");
			args.add(queryArgs.getEndDate() +" 23:59:59 ");
		}
		if(queryArgs.getUseAlloctType() != null){
			sql.append(" and ua.type = ? ");
			args.add(queryArgs.getUseAlloctType());
		}
		sql.append(" group by uad.goodsId ");
		return super.findBySql(sql.toString(),args.toArray(),StatisUseAlloctDto.class, false);
	}

	@Override
	public UseAlloct queryUseAlloctNo(String operatNo) {
		String sql = "select * from useAlloct where operatNo = '"+operatNo+"'";
        List<UseAlloct>list = super.listBySql(sql, UseAlloct.class, true);
		return list.size()>0?list.get(0):null;
	}
}
