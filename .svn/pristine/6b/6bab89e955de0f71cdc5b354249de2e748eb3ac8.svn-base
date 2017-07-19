package com.material.website.service;

import java.util.List;
import java.util.Map;

import com.material.website.args.StatisUseAlloctArgs;
import com.material.website.args.UseAlloctAddArgs;
import com.material.website.args.UseAlloctQueryArgs;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StatisUseAlloctDto;
import com.material.website.dto.UseAlloctDto;
import com.material.website.entity.UseAlloct;
import com.material.website.system.Pager;

/**
 * 领用/调拨业务接口
 * 
 * @author sunxiaorong
 * 
 */
public interface IUseAlloctService {
	/**
	 * 查询领用信息分页
	 * 
	 * @param queryArgs
	 * @return
	 */
	public Pager<UseAlloctDto> queryDepartUsePager(UseAlloctQueryArgs queryArgs);

	/**
	 * 添加领用/调拨 
	 * @param addArgs
	 */
	public Map<String, Object> addUseAlloct(UseAlloctAddArgs addArgs);
	/**
	 * 根据类型查询
	 * @param type
	 * @return
	 */
	public Integer queryUseAlloct(Integer type);
	
	/**
	 * 根据编号查询商品
	 * @param useAlloctId
	 * @return
	 */
	public List<GoodsInstallDto> queryGoodsList(Integer useAlloctId);
	
	/**
	 * 统计库存出库分页
	 * @param queryArgs
	 * @return
	 */
	public Pager<StatisUseAlloctDto> statisUseAlloctPager(StatisUseAlloctArgs queryArgs);
	
	/**
	 * 更新初始化
	 * @param useAlloctId
	 * @return
	 */
	public Map<String, Object> updateUseAlloctInit(Integer useAlloctId);
	
	/**
	 * 修改物资 调拨/领用信息
	 * @param addArgs
	 * @return
	 */
	public boolean updateUseAlloct(UseAlloctAddArgs updateArgs);
	
	/**
	 * 根据物资编号查询调拨/领用信息
	 * @param operatNo
	 * @return
	 */
	public UseAlloct queryUseAlloctNo(String operatNo);
	
	/**
	 * 将调拨/领用物资入账
	 * @param useAlloctId
	 * @return
	 */
	public boolean addLockUseAlloct(Integer useAlloctId);
}
