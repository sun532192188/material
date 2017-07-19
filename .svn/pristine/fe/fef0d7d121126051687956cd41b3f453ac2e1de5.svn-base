package com.material.website.dao;

import java.util.List;

import com.material.website.args.StatisUseAlloctArgs;
import com.material.website.args.UseAlloctQueryArgs;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StatisUseAlloctDto;
import com.material.website.dto.UseAlloctDto;
import com.material.website.entity.UseAlloct;
import com.material.website.system.Pager;

/**
 * 物资领用数据持久接口
 * @author sunxiaorong
 *
 */
public interface IUseAlloctDao extends IBase<UseAlloct>{

	/**
	 * 查询领用信息分页
	 * @param queryArgs
	 * @return
	 */
	public Pager<UseAlloctDto>  queryDepartUsePager(UseAlloctQueryArgs queryArgs);
	
	/**
	 * 根据类型查询
	 * @param type
	 * @return
	 */
	public Integer queryUseAlloct(Integer type);
	
	/**
	 * 根据操作单好查询
	 * @return
	 */
	public UseAlloct queryByOperatNo(String operatNo,Integer type);
	
	/**
	 * 根据单号查询信息
	 */
	public List<GoodsInstallDto> queryGoodsList(Integer useAlloctId);
	
	/**
	 * 统计库存出库分页
	 * @param queryArgs
	 * @return
	 */
	public Pager<StatisUseAlloctDto> statisUseAlloctPager(StatisUseAlloctArgs queryArgs);
	
	/**
	 * 根据物资编号查询调拨/领用信息
	 * @param operatNo
	 * @return
	 */
	public UseAlloct queryUseAlloctNo(String operatNo);
	
}
