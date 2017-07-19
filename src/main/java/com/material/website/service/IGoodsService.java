package com.material.website.service;

import java.util.List;

import com.material.website.args.GoodsAddArgs;
import com.material.website.args.GoodsQueryArgs;
import com.material.website.dto.GoodsDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.entity.Goods;
import com.material.website.entity.OperatTemp;
import com.material.website.system.Pager;

/**
 * 商品业务接口
 * @author sunxiaorong
 *
 */
public interface IGoodsService {

	/**
	 * 查询商品信息(分页)
	 * @param queryArgs
	 * @return
	 */
	public Pager<GoodsDto> queryGoodsPager(GoodsQueryArgs queryArgs);
	/**
	 * 添加商品
	 * @param goodsAddArgs
	 * @return
	 */
	public boolean addGoods(GoodsAddArgs goodsAddArgs);
	/**
	 * 修改商品信息
	 * @param goodsArgs
	 * @return
	 */
	public boolean updateGoods(GoodsAddArgs goodsArgs);
	/**
	 * 根据id加载商品
	 * @param goodsId
	 * @return
	 */
	public Goods loadGoods(Integer goodsId);
	/**
	 * 删除商品信息
	 * @param goodsId
	 * @return
	 */
	public boolean delGoods(Integer goodsId);
	
	/**
	 * 查询所有商品
	 * @return
	 */
	public List<GoodsDto> queryAllGoods(GoodsQueryArgs queryArgs);
	
	/**
	 * 查询所有的临时商品信息
	 * @param supplierId
	 * @param operatNo
	 * @return
	 */
	public List<GoodsInstallDto> queryAllTemp(Integer supplierId,String operatNo);
	
	/**
	 * 添加操作临时表
	 * @param operatTemp
	 * @return
	 */
	public boolean addOperatTemp(OperatTemp operatTemp);
	/**
	 * 删除临时操作表
	 * @param id
	 * @return
	 */
	public boolean delOperaTemp(Integer id);
	
	/**
	 * 删除所有的临时数据
	 * @param suplierId
	 * @param operatNo
	 */
	public void delAllTemp(Integer suplierId, String operatNo);
	
	/**
	 * 根据id更新临时表数据
	 * @param tempId
	 */
    public void updateTempGoodsNum(OperatTemp temp);
    
    /**
     * 根据条件加载单条数据
     * @param goodsId
     * @param supplierId
     * @param operatNo
     * @return
     */
    public OperatTemp loadTemp(Integer goodsId,Integer supplierId,String operatNo,Double goodsPrice);

   /**
    * 根据分类编号查询分类信息
    * @param categoryId
    * @return
    */
    public List<Goods> queryGoodsByCategoryId(Integer categoryId);
    
    /**
     * 定时删除临时表数据(防止对库存量造成影响)
     */
	public boolean delTempData();
}
