package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.args.StockArgs;
import com.material.website.dao.BaseDao;
import com.material.website.dao.IStockDao;
import com.material.website.dto.StockDto;
import com.material.website.entity.Stock;
import com.material.website.system.Pager;

/**
 * 库存数据持久实现类
 * @author sunxiaorong
 *
 */
@Repository
public class StockDao extends BaseDao<Stock> implements IStockDao {

	@Override
	public Stock queryStockInfo(Integer goodsId, Double goodsPrice,
			Integer stockType) {
		StringBuffer sql = new StringBuffer();
		List<Object>args = new ArrayList<Object>();
		sql.append("select * from stock where 1=1 ");
		sql.append(" and goodsId = ? and goodsPrice = ? and stockType=? ");
		args.add(goodsId);
		args.add(goodsPrice);
		args.add(stockType);
		List<Stock>list = super.listBySql(sql.toString(),args.toArray(), Stock.class, true);
		return list.size() > 0 ? list.get(0):null;
	}

	@Override
	public Pager<StockDto> queryStockPager(StockArgs stockArgs) {
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select s.id,s.goodsId,g.goodsName,format(s.goodsPrice,2) as goodsPrice,s.supplierId,sup.shortName as supplierName,s.goodsType,s.stockType,g.spec,s.stockNum,g.goodsNo,g.specModel ");
		sql.append(" from stock as s,goods as g,supplier as sup ");
		sql.append(" where s.goodsId = g.id and s.supplierId = sup.id  ");
		if(StringUtils.isNotEmpty(stockArgs.getGoodsName())){
			sql.append(" and g.goodsName like ? ");
			args.add("%"+stockArgs.getGoodsName()+"%");
		}
		if(stockArgs.getCategoryOne() != null){
			sql.append(" and g.categoryOne= ? ");
			args.add(stockArgs.getCategoryOne());
		}
		if(stockArgs.getCategoryTwo() != null){
			sql.append(" and g.categoryTwo= ? ");
			args.add(stockArgs.getCategoryTwo());
		}
		if(stockArgs.getType() != null){
			sql.append(" and s.stockType = ? ");
			args.add(stockArgs.getType());
		}
		sql.append(" order by s.id desc ");
		return super.findBySql(sql.toString(),args.toArray(),StockDto.class,false);
	}

	@Override
	public List<StockDto> queryStockList(StockArgs stockArgs) {
		StringBuffer sql = new StringBuffer();
		List<Object>args = new ArrayList<Object>();
		sql.append("select s.id,s.goodsId,g.goodsName,format(s.goodsPrice,2) as goodsPrice,g.spec,g.isDecimal,s.stockNum,s.stockType,g.goodsNo,g.specModel  ");
		sql.append(" from stock as s,goods as g  where 1=1 and s.goodsId = g.id  ");
		if(StringUtils.isNotEmpty(stockArgs.getGoodsName())){
			sql.append(" and g.goodsName  like ? ");
			args.add("%"+stockArgs.getGoodsName()+"%");
		}
		if(stockArgs.getCategoryOne() != null){
			sql.append(" and s.categoryOne = ? ");
			args.add(stockArgs.getCategoryOne());
		}
		if(stockArgs.getCategoryTwo() != null){
			sql.append(" and s.categoryTwo = ? ");
			args.add(stockArgs.getCategoryTwo());
		}
		if(stockArgs.getType() != null){
			sql.append(" and s.stockType =  ? ");
			args.add(Integer.valueOf(stockArgs.getType()));
		}
		sql.append(" and stockNum > 0");
		List<StockDto> list = null;
		try {
			list = super.listBySql(sql.toString(),args.toArray(), StockDto.class, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
