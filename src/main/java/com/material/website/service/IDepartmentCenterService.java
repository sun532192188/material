package com.material.website.service;

import java.util.List;
import java.util.Map;

import com.material.website.args.DepartPlanAddArgs;
import com.material.website.args.DepartPlanQueryArgs;
import com.material.website.args.DepartStockQueryArgs;
import com.material.website.args.MaterialConsumeAddArgs;
import com.material.website.args.MaterialConsumeQueryArgs;
import com.material.website.args.StaticsDepartPlanArgs;
import com.material.website.args.StatisDepartConsumeArgs;
import com.material.website.dto.DeparPlanDto;
import com.material.website.dto.DepartStockDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.MaterialConsumeDto;
import com.material.website.dto.MonthPlanGoodsDto;
import com.material.website.dto.StaticsDepartPlanDto;
import com.material.website.dto.StatisDepartCounsumeDto;
import com.material.website.dto.StockDto;
import com.material.website.entity.MaterialConsume;
import com.material.website.system.Pager;

/**
 * 部门中心业务接口
 * 
 * @author sunxiaorong
 *
 */
public interface IDepartmentCenterService {

	/**
	 * 查询月计划分页
	 * 
	 * @param queryArgs
	 * @return
	 */
	public Pager<DeparPlanDto> queryPlanPager(DepartPlanQueryArgs queryArgs);

	/**
	 * 根据月计划编号查询申请商品信息
	 * 
	 * @return
	 */
	public List<MonthPlanGoodsDto> queryMonthPlanGoods(Integer planId);
	
    /**
     * 添加月计划
     * @return
     */
	public boolean addMonthPlan(DepartPlanAddArgs addArgs);
	
	/**
	 * 部门出库
	 * @param addArgs
	 * @return
	 */
	public Map<String, Object> addDepartOutStock(MaterialConsumeAddArgs addArgs);
	
	/**
	 * 修改月计划状态
	 * @param planId
	 */
	public boolean updateMonthPlanStatus(Integer planId);
	
	/***
	 * 删除月计划选购的商品
	 * @param goodsId
	 * @return
	 */
	public boolean delPlanGoods(Integer goodsId);
	
	/**
	 * 根据计划编号更新商品信息
	 * @param planId
	 * @param goodsStr
	 * @return
	 */
	public String updatePlanGoods(Integer planId,String goodsStr);
	
	
	 /**
     * 部门出库查询分页
     * @param queryArgs
     * @return
     */
    public Pager<MaterialConsumeDto> queryConsumePager(MaterialConsumeQueryArgs queryArgs);
    
    /**
     * 查询部门库存分页
     * @param queryArgs
     * @return
     */
    public Pager<DepartStockDto> queryDepartStockPager(DepartStockQueryArgs queryArgs);
    
    /**
     * 根据部门查询当天最大出库量
     * @param departId
     * @return
     */
    public Integer queryMaxCkCout(Integer departId);
    
    /**
     * 查询部门库存商品列表
     * @param queryArgs
     * @return
     */
    public List<StockDto> queryDepartStockList(DepartStockQueryArgs queryArgs);
    
    /**
     * 根据出库编号查询出库商品列表
     * @param ckNo
     * @return
     */
    public List<GoodsInstallDto> queryCkGoodsList(Integer ckNo);
    
    /**
     * 根据编号更改固定资产使用状态
     * @param id
     * @param type
     * @param remarks
     */
    public boolean updateFixedGoodsStatus(Integer id,Integer type,String remarks,Integer departId,Integer targetDepart);
    
    /**
     * 统计部门月计划
     * @param queryArgs
     * @return
     */
    public Pager<StaticsDepartPlanDto> staticsDepartPlan(StaticsDepartPlanArgs queryArgs);
	
    /**
     * 统计部门出库
     * @param queryArgs
     * @return
     */
    public Pager<StatisDepartCounsumeDto> statisDepartConsumePager(StatisDepartConsumeArgs queryArgs);
    
    /**
     * 出库更新初始化
     * @param consumeId
     * @return
     */
	public Map<String, Object> updateDepartConsumeInit(Integer consumeId);
	
	
	/**
	 * 更新部门出库信息
	 * @param updateArgs
	 * @return
	 */
	public boolean updateDepartConsume(MaterialConsumeAddArgs updateArgs);
	
	/**
	 * 根据物资编号查询出库信息
	 * @param operatNo
	 * @return
	 */
	public MaterialConsume queryConsumeInfo(String operatNo,Integer consumeId);
	
	/**
	 * 入账 入库信息
	 * @return
	 */
	public boolean addLockConsume(Integer consumeId);

}
