package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.args.GoodsQueryArgs;
import com.material.website.dao.BaseDao;
import com.material.website.dao.IGoodsDao;
import com.material.website.dto.GoodsDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.entity.Goods;
import com.material.website.entity.OperatTemp;
import com.material.website.system.Pager;

/**
 * 商品数据持久实现类
 * @author sunxiaorong
 *
 */
@Repository
public class GoodsDaoImpl extends BaseDao<Goods> implements IGoodsDao {

	@Override
	public List<Goods> queryGoodsByCategoryId(Integer categoryId) {
		String sql = "select * from goods where categoryOne = ? OR categoryTwo = ? ";
		List<Object>args = new ArrayList<Object>();
		args.add(categoryId);
		args.add(categoryId);
		return super.listBySql(sql, args.toArray(), Goods.class, true);
	}

	@Override
	public Pager<GoodsDto> queryGoodsPager(GoodsQueryArgs queryArgs) {
		try {
			List<Object>args = new ArrayList<Object>();
			StringBuffer sql = new StringBuffer();
			sql.append("select g.id,g.goodsName,g.goodsNo,format(g.price,2) as price,g.specModel,g.spec,g.goodsType,s.shortName as supplierName,g.status, ");
			//sql.append(" '(select categoryName from category as c1  where c1.id = g.categoryOne )' as categoryOneName ");
			//sql.append(" (select categoryName from category as c2 where c2.id = g.categoryTwo ) as categoryTwoName ");
			sql.append(" c.categoryName as categoryTwoName ");
			sql.append(" from goods as g,supplier as s,category as c where 1=1 and g.supplierId = s.id and g.categoryTwo = c.id  ");
			if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
				sql.append(" and g.goodsName like ? ");
				args.add("%"+queryArgs.getGoodsName()+"%");
			}
			if(queryArgs.getCategoryOne() != null){
				sql.append(" and categoryOne = ? ");
				args.add(queryArgs.getCategoryOne());
			}
			if(queryArgs.getCategoryTwo() != null){
				sql.append(" and categoryTwo = ? ");
				args.add(queryArgs.getCategoryTwo());
			}
			if(queryArgs.getSupplierId() != null){
				sql.append(" and supplierId = ? ");
				args.add(queryArgs.getSupplierId());
			}
			if(queryArgs.getStatus() != null){
				sql.append(" and g.status = ? ");
				args.add(queryArgs.getStatus());
			}else{
				sql.append(" and g.status = 0 ");
			}
			sql.append(" order by g.id desc ");
			return super.findBySql(sql.toString(), args.toArray(),GoodsDto.class, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void delGoods(Integer goodsId) {
		String sql = "update goods set status = abs(status-1) where id ="+goodsId;
		super.updateBySql(sql);
	}

	@Override
	public List<GoodsDto> queryAllGoods(GoodsQueryArgs queryArgs) {
		String sql = "select Id,goodsName,goodsNo,format(price,2) as price,specModel,spec,isDecimal,goodsType,categoryOne,categoryTwo,supplierId,status from goods  where 1=1 ";
		List<Object>args = new ArrayList<Object>();
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			sql+= " and goodsName like ? ";
			args.add("%"+queryArgs.getGoodsName()+"%");
		}
		if(queryArgs.getSupplierId() != null){
			sql+= " and supplierId = ? ";
			args.add(queryArgs.getSupplierId());
		}
		if(queryArgs.getCategoryOne() != null){
			sql+= " and categoryOne = ? ";
			args.add(queryArgs.getCategoryOne());
		}
		if(queryArgs.getCategoryTwo() != null){
			sql+= " and categoryTwo = ? ";
			args.add(queryArgs.getCategoryTwo());
		}
		sql+= " and status = 0 ";
		System.out.println("sql语句为:"+sql);
		List<GoodsDto> list = null;
		try {
			list = super.listBySql(sql,args.toArray(),GoodsDto.class, false);
		} catch (Exception e) {
			System.out.println("查询商品异常");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<GoodsInstallDto> queryAllTemp(Integer supplierId,String operatNo,Integer operatId) {
		try {
			List<Object>args = new ArrayList<Object>();
			StringBuffer sql = new StringBuffer();
			sql.append(" select opt.id,opt.goodsNo,opt.goodsId,opt.goodsName,opt.specModel,Format(opt.price,2) as formatPrice,opt.spec,opt.goodsNum,format(opt.singleMoney,2) as formatMoney,opt.operatNo,opt.operatId,opt.operatType,opt.price,opt.singleMoney,g.supplierId   ");
			sql.append(" from operattemp as opt,goods as g  where 1=1 and opt.goodsId = g.id    ");
			if(StringUtils.isNotEmpty(operatNo)){
				sql.append( " and opt.operatNo = ? ");
				args.add(operatNo);
			}
			if(supplierId != null){
				sql.append( " and opt.supplierId = ? ");
				args.add(supplierId);
			}
			if(operatId != null){
				sql.append(" and opt.operatId = ? ");
				args.add(operatId);
			}
			return super.listBySql(sql.toString(),args.toArray(),GoodsInstallDto.class, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void delAllTemp(Integer suplierId, String operatNo,Integer operatId) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql  = new StringBuffer();
		sql.append(" delete from operattemp where  1=1 ");
		if(StringUtils.isNotEmpty(operatNo)){
			sql.append(" and  operatNo = ?");
			args.add(operatNo);
		}
		if(suplierId != null){
			sql.append(" and supplierId = ? ");
			args.add(suplierId);
		}
		if(operatId != null){
			sql.append(" and operatId = ? ");
			args.add(operatId);
		}
		super.updateBySql(sql.toString(),args.toArray());
		
	}

	@Override
	public void delTempData() {
		String sql = "delete from operattemp where operatId IS NULL and operatType IS NULL ";
		super.updateBySql(sql);
		
	}

	@Override
	public Double queryTemp(Integer goodsId,String stockType,Double goodsPrice) {
	    StringBuffer sql = new StringBuffer();
	    if(StringUtils.isNotEmpty(stockType)){
	    	 if(stockType.equals("alloct")){
	    		sql.append("select sum(goodsNum) as goodsNum from operatTemp where 1=1 and goodsId ="+goodsId);
	 	    	sql.append(" and operatType = 3 ");
	 	    	sql.append(" and price="+goodsPrice );
	 	     }else if(stockType.equals("use")){
	 	    	 sql.append("select sum(goodsNum) as goodsNum from operatTemp  where 1=1 and goodsId ="+goodsId);
	 	    	 sql.append(" and operatType = 4 ");
	 	    	sql.append(" and price="+goodsPrice );
	 	     }else if(stockType.equals("departCk")){
	 	    	 sql.append("select sum(goodsNum) as goodsNum from operatTemp  where 1=1 ");
	 	    	 sql.append(" and (operatType = 5 or operatType =6 ) ");
	 	    	 sql.append(" and operatId in (select id from MaterialConsume) ");
	 	    	 sql.append(" and goodsId="+goodsId);
	 	     }
	    }
	    List<GoodsInstallDto> list = super.listBySql(sql.toString(), GoodsInstallDto.class, false);
	    GoodsInstallDto dto = list.get(0);
		return dto.getGoodsNum() != null?dto.getGoodsNum():0;
	}
}
