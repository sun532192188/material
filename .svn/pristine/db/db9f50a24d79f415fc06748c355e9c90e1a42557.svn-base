package com.material.website.dao;

import java.util.List;

import com.material.website.args.GoodsQueryArgs;
import com.material.website.dto.GoodsDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.entity.Goods;
import com.material.website.system.Pager;

/**
 * 商品数据持久接口
 * @author sunxiaorong
 *
 */
public interface IGoodsDao extends IBase<Goods> {
	
	/**
	 * 根据分类编号查询商品信息
	 * @param categoryId
	 * @return
	 */
	public List<Goods> queryGoodsByCategoryId(Integer categoryId);
	
	/**
	 * 商品查询(分页)
	 * @param queryArgs
	 * @return
	 */
   public Pager<GoodsDto> queryGoodsPager(GoodsQueryArgs queryArgs);	
   /**
    * 删除商品信息
    * @param goodsId
    */
   public void delGoods(Integer goodsId);
   
   /**
    * 查询所有的商品
    * @return
    */
   public List<GoodsDto> queryAllGoods(GoodsQueryArgs queryArgs);
   
    /**
     * 查询所有的临时商品信息
     * @return
     */
   public List<GoodsInstallDto> queryAllTemp(Integer supplierId,String operatNo,Integer operatId);
   
   /**
    * 根据条件删除临时表数据
    * @param suplierId
    * @param operatNo
    */
   public void delAllTemp(Integer suplierId,String operatNo,Integer operatId);
   
   
   /**
    * 定时删除临时数据
    * @param operatId
    * @param operatType
    */
   public void delTempData();
   
   /**
    * 根据条件查询临时表数据
    * @param goodsId
    * @param stockType 3&4 库存   5&6部门库存
    * @param operatId  
    * @return
    */
   public Double queryTemp(Integer goodsId,String stockType,Double goodsPrice);
   
}
