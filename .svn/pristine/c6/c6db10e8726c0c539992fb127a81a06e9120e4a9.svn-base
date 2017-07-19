package com.material.website.service;

import java.util.List;

import com.material.website.args.StockArgs;
import com.material.website.dto.StockDto;
import com.material.website.system.Pager;

/**
 * 库存业务接口
 * @author sunxiaorong
 *
 */
public interface IStockService {

	
	/**
	 * 查询库存信息(分页)
	 * @param stockArgs
	 * @return
	 */
	public Pager<StockDto> queryStockPager(StockArgs stockArgs);
	
	
	/**
	 * 查询库存商品列表
	 * @param stockArgs
	 * @return
	 */
	public List<StockDto> queryStockList(StockArgs stockArgs);
}
