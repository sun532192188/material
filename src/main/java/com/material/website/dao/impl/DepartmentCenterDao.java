package com.material.website.dao.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.args.DepartPlanQueryArgs;
import com.material.website.args.DepartStockQueryArgs;
import com.material.website.args.MaterialConsumeQueryArgs;
import com.material.website.args.StaticsDepartPlanArgs;
import com.material.website.args.StatisDepartConsumeArgs;
import com.material.website.dao.BaseDao;
import com.material.website.dao.IDepartmentCenterDao;
import com.material.website.dto.DeparPlanDto;
import com.material.website.dto.DepartStockDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.MaterialConsumeDto;
import com.material.website.dto.MonthPlanGoodsDto;
import com.material.website.dto.StaticsDepartPlanDto;
import com.material.website.dto.StatisDepartCounsumeDto;
import com.material.website.dto.StockDto;
import com.material.website.entity.DepartStock;
import com.material.website.entity.MaterialApply;
import com.material.website.entity.MaterialConsume;
import com.material.website.system.Pager;

@Repository
public class DepartmentCenterDao extends BaseDao<Object> implements IDepartmentCenterDao {

	@Override
	public Pager<DeparPlanDto> queryPlanPager(DepartPlanQueryArgs queryArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select dp.id,dp.planName,dp.departmentId,d.departmentName,dp.createDate,format(dp.sumPrice,2) as formatMoney,dp.remarks,dp.status  ");
		sql.append("  from DepartPlan as dp,department as d  ");
		sql.append(" where 1=1  and dp.departmentId = d.id ");
		if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
			sql.append(" and dp.createDate >= ?");
			args.add(queryArgs.getStartDate()+" 00:00:00");
		}
		if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
			sql.append(" and dp.createDate <= ?");
			args.add(queryArgs.getEndDate()+" 23:59:59");
		}
		if(queryArgs.getStatus() != null){
			sql.append(" and  dp.status = ? ");
			args.add(queryArgs.getStatus());
		}else{
			/*sql.append(" and dp.status = 0 ");*/
		}
		sql.append(" and dp.departmentId = ? order by dp.id desc ");
		args.add(queryArgs.getDepartmentId());
		return super.findBySql(sql.toString(), args.toArray(),DeparPlanDto.class, false);
	}

	
	@Override
	public List<MonthPlanGoodsDto> queryMonthPlanGoods(Integer planId) {
		StringBuffer sql = new StringBuffer();
		sql.append(" select ma.id,ma.planId,ma.goodsId,g.goodsName,format(ma.price,2) as formatPrice,ma.goodsNum,format(ma.singlePrice,2) as formatMoney,g.spec,g.specModel,g.goodsNo ");
		sql.append("  from MaterialApply as ma,goods as g  ");
		sql.append("  where ma.goodsId = g.id and planId = "+planId);
		return super.listBySql(sql.toString(), MonthPlanGoodsDto.class, false);
	}


	/**
	 * 根据条件查询部门库存商品(这里只查商品类型为物资的商品)
	 */
	@Override
	public DepartStock queryDepartStockList(Integer departId,
			Integer goodsId, Double price, Integer stockType) {
		String sql = "select * from DepartStock  where 1=1  and departmentId = ? and goodsId = ? and goodsPrice = ?  and goodsType =1";
		List<Object>args = new ArrayList<Object>();
		args.add(departId);
		args.add(goodsId);
		args.add(price);
        if(stockType != null){
        	sql += " and stockType = ?";
        	args.add(stockType);
        }
		List<DepartStock> stockList = super.listBySql(sql,args.toArray(),DepartStock.class, true);
		return stockList.size() > 0 ?stockList.get(0):null;
	}


	@Override
	public void updateMonthPlanStatus(Integer planId) {
         String sql = "update departplan set status = abs(status-1) where id =" +planId;
         super.updateBySql(sql);
	}


	@Override
	public MaterialApply queryGoodsByParam(Integer goodsId, Double goodsPrice,Integer planId) {
		List<Object>args = new ArrayList<Object>();
		String sql = "select * from MaterialApply where goodsId = ? and price=? and planId = ? ";
		args.add(goodsId);
		args.add(goodsPrice);
		args.add(planId);
		List<MaterialApply>list = super.listBySql(sql,args.toArray(), MaterialApply.class, true);
		return list.size()>0?list.get(0):null;
	}


	/**
	 * 查询部门物资
	 */
	@Override
	public Pager<DepartStockDto> queryDepartStockPager(
			DepartStockQueryArgs queryArgs) {
 		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select ds.id,ds.goodsId,g.goodsName,ds.goodsPrice,ds.stockNum,ds.goodsType,ds.stockType,ds.remarks,g.spec,ds.status  ");
		sql.append(" from departStock as ds, goods as g where ds.goodsId = g.id ");
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			sql.append(" and g.goodsName like ? ");
			args.add("%"+queryArgs.getGoodsName()+"%");
		}
		if(queryArgs.getCategoryOne() != null){
			sql.append(" and ds.categoryOne = ? ");
			args.add(queryArgs.getCategoryOne());
		}
		if(queryArgs.getCategoryTwo() != null){
			sql.append(" and ds.categoryTwo = ? ");
			args.add(queryArgs.getCategoryTwo());
		}
		if(queryArgs.getType() != null){
			sql.append(" and ds.stockType = ? ");
		    args.add(queryArgs.getType());
		}
		if(queryArgs.getDepartmentId() != null){
			sql.append(" and ds.departmentId = ? ");
			args.add(queryArgs.getDepartmentId());
		}
		sql.append(" and ds.goodsType ="+queryArgs.getGoodsType()+" order by ds.id desc ");
		return super.findBySql(sql.toString(),args.toArray(),DepartStockDto.class, false);
	}


	@Override
	public Pager<MaterialConsumeDto> queryConsumePager(
			MaterialConsumeQueryArgs queryArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select  mc.id,mc.operatNo,mc.consumeDate,format(mc.consumeMoney,2) as consumeMoney,mc.type,mc.targetDepartId,dp.departmentName as tartgetDepartName ,mc.remarks,mc.status  ");
		sql.append(" from MaterialConsume as mc,department as dp  where mc.departId=dp.id  ");
		if(StringUtils.isNotEmpty(queryArgs.getOperatNo())){
			sql.append(" and mc.operatNo like ? ");
			args.add("%"+queryArgs.getOperatNo()+"%");
		}
		if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
			sql.append(" and mc.consumeDate >= ? ");
			args.add(queryArgs.getStartDate()+" 00:00:00");
		}
		if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
			sql.append(" and mc.consumeDate <= ? ");
			args.add(queryArgs.getEndDate()+" 23:59:59 ");
		}
		if(queryArgs.getType() != null){
			sql.append(" and mc.type = ? ");
			args.add(queryArgs.getType());
		}
		if(queryArgs.getDepartmentId() != null){
			sql.append(" and mc.departId = ? ");
		    args.add(queryArgs.getDepartmentId());
		}
		sql.append("order by mc.id desc");
		return super.findBySql(sql.toString(),args.toArray(),MaterialConsumeDto.class, false);
	}


	@Override
	public Integer queryMaxCkCout(Integer departId) {
		String nowTime = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
		String  sql = "select * from MaterialConsume where departId = "+departId+" and consumeDate  like '"+nowTime+"%'";
		List<MaterialConsume>list = super.listBySql(sql, MaterialConsume.class, true);
		return list.size()>0?list.size():0;
	}

    
	//根据条件只查物资类型的商品
	@Override
	public List<StockDto> queryDepartStockList(
			DepartStockQueryArgs queryArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select ds.id,ds.goodsId,g.goodsName,format(ds.goodsPrice,2) as goodsPrice,ds.stockNum,g.spec,g.isDecimal   ");
		sql.append(" from departStock as ds, goods as g where ds.goodsId = g.id ");
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			sql.append(" and g.goodsName like ? ");
			args.add("%"+queryArgs.getGoodsName()+"%");
		}
		if(queryArgs.getCategoryOne() != null){
			sql.append(" and ds.categoryOne = ? ");
			args.add(queryArgs.getCategoryOne());
		}
		if(queryArgs.getCategoryTwo() != null){
			sql.append(" and ds.categoryTwo = ? ");
			args.add(queryArgs.getCategoryTwo());
		}
		if(queryArgs.getType() != null){
			sql.append(" and ds.stockType = ? ");
		    args.add(queryArgs.getType());
		}
		sql.append(" and ds.departmentId ="+queryArgs.getDepartmentId());
		sql.append(" and g.goodsType =1 ");
		return super.listBySql(sql.toString(),args.toArray(),StockDto.class, false);
	}


	@Override
	public List<GoodsInstallDto> queryCkGoodsList(Integer ckId) {
		String sql = "select mc.id,mc.goodsId,g.goodsName,mc.goodsNum,format(mc.goodsPrice,2) as formatPrice,format(mc.singleMoney,2) as formatMoney,g.spec,g.specModel,g.goodsNo  from materialconsumedetail as mc,goods as g  where 1=1 and mc.goodsId = g.id ";
		sql+= " and mc.outStockId = "+ckId;
		return super.listBySql(sql, GoodsInstallDto.class, false);
	}
	
	@Override
	public void updateFixedGoodsStatus(Integer id,Integer type,String remarks){
		String sql = "update departstock set status ="+type+",remarks ='"+remarks+"' where id = "+id ;
		super.updateBySql(sql);
	}


	/**
	 * 默认查询最近月份数据
	 */
	@Override
	public Pager<StaticsDepartPlanDto> staticsDepartPlan(
			StaticsDepartPlanArgs queryArgs) {
		//select dp.departmentName,mp.goodsId,g.goodsName,sum(goodsNum) as goodsNum,g.spec from materialapply as mp,goods as g,departplan as dp  where mp.goodsId = g.id and mp.planId=dp.id   and goodsId=12
	    List<Object>args = new ArrayList<Object>();
	    StringBuffer sql = new StringBuffer();
	    sql.append("  select mp.goodsId,sum(mp.goodsNum) as goodsNum,mp.price,format(mp.price,2) as formatPrice,sum(mp.singlePrice) as singlePrice,format(sum(mp.singlePrice),2) as formatMoney,g.goodsName,g.spec,dp.departmentName,g.goodsType,g.goodsNo,g.specModel,dp.remarks ");
	    sql.append("  from materialapply as mp,goods as g,DepartPlan as dp ");
	    sql.append(" where mp.goodsId=g.id and mp.planId=dp.id ");
	    if(queryArgs.getDepartId() != null){
	    	sql.append(" and dp.departmentId=? ");
	    	args.add(queryArgs.getDepartId());
	    }
	    if(queryArgs.getCategoryOne() != null){
	    	sql.append("  and g.categoryOne=  ? ");
	    	args.add(queryArgs.getCategoryOne());
	    }
	    if(queryArgs.getCategoryTwo() != null){
	    	sql.append("  and g.categoryTwo=  ? ");
	    	args.add(queryArgs.getCategoryTwo());
	    }
	    if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
	    	sql.append(" and g.goodsName like ? ");
	    	args.add("%"+queryArgs.getGoodsName()+"%");
	    }
	    if(StringUtils.isNotBlank(queryArgs.getMonthDate())){
	    	sql.append(" and dp.createDate like ? ");
	    	args.add(queryArgs.getMonthDate()+"%");
	    }else{
	    	String nowTime = new SimpleDateFormat("YYYY-MM").format(new Date());
	    	sql.append(" and dp.createDate like ? ");
	    	args.add(nowTime+"%");
	    }
	    if(StringUtils.isNotEmpty(queryArgs.getPlanName())){
	    	sql.append(" and dp.planName like ? ");
	    	args.add("%"+queryArgs.getPlanName()+"%");
	    }
	    sql.append(" and dp.status = 1  group by g.id,g.price ");
		return super.findBySql(sql.toString(),args.toArray(), StaticsDepartPlanDto.class, false);
	}


	@Override
	public Pager<StatisDepartCounsumeDto> statisDepartConsumePager(
			StatisDepartConsumeArgs queryArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select mcd.id, mcd.goodsId,g.goodsNo,sum(mcd.goodsNum) as goodsNum,format(mcd.goodsPrice,2) as formatPrice,format(sum(mcd.singleMoney),2) as formatMoney,  ");
		sql.append(" g.goodsName,g.spec,g.goodsType,d.departmentName,g.specModel ");
		sql.append(" from MaterialConsumeDetail as mcd,MaterialConsume as mc,goods as g,department as d   ");
		sql.append(" where mcd.outStockId = mc.id and mcd.goodsId = g.id and mc.departId = d.id ");
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
	    if(queryArgs.getDepartId() != null){
	    	sql.append(" and mc.departId = ? ");
	    	args.add(queryArgs.getDepartId());
	    }
	    if(StringUtils.isNotEmpty(queryArgs.getStartDate())){
	    	sql.append(" and mc.consumeDate >= ? ");
	    	args.add(queryArgs.getStartDate()+" 00:00:00");
	    }
	    if(StringUtils.isNotEmpty(queryArgs.getEndDate())){
	    	sql.append(" and mc.consumeDate <= ? ");
	    	args.add(queryArgs.getEndDate());
	    }
	    sql.append(" group by mcd.goodsId,mcd.goodsPrice ");
	    try {
			super.findBySql(sql.toString(), args.toArray(), StatisDepartCounsumeDto.class, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.findBySql(sql.toString(), args.toArray(), StatisDepartCounsumeDto.class, false);
	}


	@Override
	public DepartStock queryDepartStockById(Integer id) {
		String sql = "select * from departStock where id = "+id;
		List<DepartStock>list = super.listBySql(sql, DepartStock.class, true);
		return list.size()>0?list.get(0):null;
	}


	@Override
	public MaterialConsume queryConsumeInfo(String operatNo,Integer consumeId) {
		String sql = "select * from MaterialConsume where 1=1";
		if(StringUtils.isNotEmpty(operatNo)){
			sql += " and operatNo = '"+operatNo+"'";
		}
		if(consumeId != null){
			sql += " and id = "+consumeId;
		}
        List<MaterialConsume>list = super.listBySql(sql, MaterialConsume.class, true);
		return list.size()>0?list.get(0):null;
	}
	
}
