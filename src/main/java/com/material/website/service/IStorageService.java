package com.material.website.service;

import java.util.List;
import java.util.Map;

import com.material.website.args.StaticsStorageArgs;
import com.material.website.args.StorageAddArgs;
import com.material.website.args.StorageQueryArgs;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StaticsStorageDto;
import com.material.website.dto.StorageDto;
import com.material.website.entity.Storage;
import com.material.website.system.Pager;

/**
 * 入库业务接口
 * @author sunxiaorong
 *
 */
public interface IStorageService {

	/**
	 * 根据类型、时间获取入库数量
	 * @param type
	 * @return
	 */
	public Integer getStorageCount(Integer type);
	
	/**
	 * 添加入库
	 * @param storageArgs
	 * @return
	 */
	public boolean addStorage(StorageAddArgs storageArgs);
	
	/**
	 * 查询入库信息
	 * @param queryArgs
	 * @return
	 */
	public Pager<StorageDto> queryStoragePager(StorageQueryArgs queryArgs);
	
	/**
	 * 根据单号编号 查询商品信息
	 * @param id
	 * @return
	 */
	public List<GoodsInstallDto> queryGoodsById(Integer id);
	
	/**
	 * 统计
	 * @param queryArgs
	 * @return
	 */
	public Pager<StaticsStorageDto> staticsStoragePager(StaticsStorageArgs queryArgs);
	
	public Storage queryStorageById(Integer storageId);
	
	/**
	 * 入账 入库信息
	 * @return
	 */
	public boolean addLockStorage(Integer storageId);
	
	/**
	 * 入库信息更新初始化
	 * @param storageId
	 * @return
	 */
	public Map<String, Object>updateStorageInit(Integer storageId);
	
	/**
	 * 入库信息更新
	 * @param updsateArgs
	 * @return
	 */
	public boolean updateStorageInfo(StorageAddArgs updsateArgs);
	
	/**
	 * 根据物资编号查询入库信息
	 * @param operatNo
	 * @return
	 */
	public Storage queryStorageByNo(String operatNo);
	
}
