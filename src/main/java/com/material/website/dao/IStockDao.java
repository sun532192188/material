package com.material.website.dao;

import java.util.List;

import com.material.website.args.StockArgs;
import com.material.website.dto.StockDto;
import com.material.website.entity.Stock;
import com.material.website.system.Pager;


/**
 * 库存数据接口
 * @author sunxiaorong
 *
 */
public interface IStockDao extends IBase<Stock> {

	
	/**
	 * 根据商品编号  商品单价 入库类型  查询商品信息
	 * @param goodsId
	 * @param goodsPrice
	 * @param stockType
	 * @return
	 */
	public Stock queryStockInfo(Integer goodsId,Double goodsPrice,Integer stockType);
	
	
	/**
	 * 查询库存分页
	 * @param stockArgs
	 * @return
	 */
	public Pager<StockDto> queryStockPager(StockArgs stockArgs);
	
	/**
	 * 根据条件查询库存列表
	 * @param stockArgs
	 * @return
	 */
	public List<StockDto> queryStockList(StockArgs stockArgs);
	
}
