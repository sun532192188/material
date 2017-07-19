package com.material.website.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.stereotype.Service;

import com.material.website.args.StaticsStorageArgs;
import com.material.website.args.StorageAddArgs;
import com.material.website.args.StorageQueryArgs;
import com.material.website.dao.IGoodsDao;
import com.material.website.dao.IStockDao;
import com.material.website.dao.IStorageDao;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StaticsStorageDto;
import com.material.website.dto.StorageDto;
import com.material.website.entity.Goods;
import com.material.website.entity.Stock;
import com.material.website.entity.Storage;
import com.material.website.entity.StorageMaterial;
import com.material.website.service.IStorageService;
import com.material.website.system.Pager;
import com.material.website.util.DateFormatUtils;

/**
 * 入库业务实现类
 * @author sunxiaorong
 *
 */
@Service
public class StorageService implements IStorageService {
 
	@Inject
	private IStorageDao storageDao;
	
	@Inject
	private IGoodsDao goodsDao;
	
	@Inject
	private IStockDao stockDao;
	
	@Override
	public Integer getStorageCount(Integer type) {
		return storageDao.getStorageCount(type);
	}

	@Override
	public boolean addStorage(StorageAddArgs storageArgs) {
		try {
			//1.生成入库单数据
			Storage storage = new Storage();
			BeanUtils.copyProperties(storageArgs, storage);
			Date dtime = DateFormatUtils.str2date(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()), "yyyy-MM-dd HH:mm:ss");
			storage.setStorageDate(dtime);
			Storage returnStorage = null;
			storage.setStatus(0);
			returnStorage =storageDao.add(storage);
			//2.更新临时表中的信息
			Integer operatType = null;
			if(storageArgs.getStorageType() == 1){
				operatType = 1;
			}else{
				operatType = 2;
			}
		    storageDao.updateOperatTemp(returnStorage.getId(), operatType,storageArgs.getStorageNo());
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public Pager<StorageDto> queryStoragePager(StorageQueryArgs queryArgs) {
		return  storageDao.queryStoragePager(queryArgs);
	}

	@Override
	public List<GoodsInstallDto> queryGoodsById(Integer id) {
		return storageDao.queryGoodsById(id);
	}

	@Override
	public Pager<StaticsStorageDto> staticsStoragePager(
			StaticsStorageArgs queryArgs) {
		return storageDao.staticsStoragePager(queryArgs);
	}

	@Override
	public Storage queryStorageById(Integer storageId){
		return storageDao.get(storageId);
	}

	@Override
	public boolean addLockStorage(Integer storageId) {
		try {
			Storage storage = storageDao.get(storageId);
			//添加入库商品
			List<GoodsInstallDto> goodsList = goodsDao.queryAllTemp(null, "", storage.getId());
			for(GoodsInstallDto dto :goodsList){
				StorageMaterial sm = new StorageMaterial();
				BeanUtils.copyProperties(dto, sm);
				sm.setId(null);
				sm.setGoodsPrice(dto.getPrice());
				sm.setStorageId(storage.getId());
				try {
					storageDao.addEntity(sm);
					//添加库存 
					Stock stock = stockDao.queryStockInfo(dto.getGoodsId(), dto.getPrice(),storage.getStorageType());
				    if(stock != null){
				    	stock.setStockNum(stock.getStockNum()+dto.getGoodsNum());
				    	stockDao.updateEntity(stock);
				    }else{
				    	Goods goods = goodsDao.get(dto.getGoodsId());
				    	stock = new Stock();
				    	stock.setGoodsId(dto.getGoodsId());
				    	stock.setGoodsPrice(dto.getPrice());
				    	stock.setGoodsType(goods.getGoodsType());
				    	stock.setSupplierId(goods.getSupplierId());
				    	stock.setStockType(storage.getStorageType());
				    	stock.setStockNum(dto.getGoodsNum());
				    	stock.setCategoryOne(goods.getCategoryOne());
				    	stock.setCategoryTwo(goods.getCategoryTwo());
				    	stockDao.addEntity(stock);
				    }
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			storage.setStatus(1);
			storageDao.updateEntity(storage);
			goodsDao.delAllTemp(null,"", storage.getId());
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public Map<String, Object> updateStorageInit(Integer storageId) {
		Map<String, Object>map = new HashMap<String, Object>();
		Storage storage = storageDao.get(storageId);
		List<GoodsInstallDto>resultList = goodsDao.queryAllTemp(null, storage.getStorageNo(), storageId);
		map.put("storage", storage);
		map.put("resultList", resultList);
		return map;
	}

	@Override
	public boolean updateStorageInfo(StorageAddArgs updateArgs) {
	    try {
			Storage storage = storageDao.get(updateArgs.getId());
			BeanUtils.copyProperties(updateArgs, storage);
			storageDao.updateEntity(storage);
			//2.更新临时表中的信息
			Integer operatType = null;
			if(storage.getStorageType() == 1){
				operatType = 1;
			}else{
				operatType = 2;
			}
			storageDao.updateOperatTemp(updateArgs.getId(), operatType,updateArgs.getStorageNo());
			return true;
		} catch (BeansException e) {
			e.printStackTrace();
		}
	    return false;
	}

	@Override
	public Storage queryStorageByNo(String operatNo) {
		return storageDao.queryStorageByNo(operatNo);
	}
}
