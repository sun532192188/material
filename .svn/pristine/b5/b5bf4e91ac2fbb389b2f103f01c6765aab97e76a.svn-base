package com.material.website.dao;

import java.util.List;

import com.material.website.args.StaticsStorageArgs;
import com.material.website.args.StorageQueryArgs;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StaticsStorageDto;
import com.material.website.dto.StorageDto;
import com.material.website.entity.Storage;
import com.material.website.system.Pager;

/**
 * 入库数据持久接口
 * @author sunxiaorong
 *
 */
public interface IStorageDao extends IBase<Storage> {

	/**
	 * 根据日期、类型 获取入库单数量
	 * @return
	 */
	public Integer getStorageCount(Integer type);
	
	/**
	 * 查询入库信息
	 * @param queryArgs
	 * @return
	 */
	public Pager<StorageDto> queryStoragePager(StorageQueryArgs queryArgs);
	
	/**
	 * 根据单号查询商品
	 * @param id
	 * @return
	 */
	public List<GoodsInstallDto> queryGoodsById(Integer id);
	
	/**
	 * 统计物资入库分页
	 * @param queryArgs
	 * @return
	 */
	public Pager<StaticsStorageDto> staticsStoragePager(StaticsStorageArgs queryArgs);
	
	/**
	 * 更具编号更新临时表数据
	 * @param operatNo
	 */
	public void updateOperatTemp(Integer operatId,Integer operatType,String operatNo);
	
	/**
	 * 根据物资编号查询入库信息
	 * @param operatNo
	 * @return
	 */
	public Storage queryStorageByNo(String operatNo);
   
}
