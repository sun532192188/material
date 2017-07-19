package com.material.website.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.material.website.args.StockArgs;
import com.material.website.dao.IGoodsDao;
import com.material.website.dao.IStockDao;
import com.material.website.dto.StockDto;
import com.material.website.service.IStockService;
import com.material.website.system.Pager;

/**
 * 库存业务实现类
 * @author sunxiaorong
 *
 */
@Service
public class StockService implements IStockService {
	
	@Inject
	private IStockDao stockDao;
	@Inject
	private IGoodsDao goodsDao;

	@Override
	public Pager<StockDto> queryStockPager(StockArgs stockArgs) {
		return stockDao.queryStockPager(stockArgs);
	}

	@Override
	public List<StockDto> queryStockList(StockArgs stockArgs) {
		List<StockDto> list = stockDao.queryStockList(stockArgs);
		List<StockDto>stockList = new ArrayList<StockDto>();
		Double temNum = null;
		for(StockDto dto :list){
			Double price = Double.valueOf(dto.getGoodsPrice().replaceAll(",",""));
			if(dto.getStockType() == 1){
				temNum = goodsDao.queryTemp(dto.getGoodsId(), "alloct", price);
			}else if(dto.getStockType() == 2){
				temNum = goodsDao.queryTemp(dto.getGoodsId(), "use", price);
			}
			Double stockNum = dto.getStockNum()-temNum;
			if(stockNum > 0){
				dto.setStockNum(dto.getStockNum()-temNum);
				stockList.add(dto);
			}
		}
		return stockList;
	}

}
