package com.material.website.dao;

import java.util.List;

import com.material.website.dto.CategoryDto;
import com.material.website.entity.Category;
import com.material.website.system.Pager;

/**
 * 商品分类数据持久接口
 * @author sunxiaorong
 *
 */
public interface ICategoryDao extends IBase<Category> {
 
	
	
	/**
	 * 查询分类集合                     
	 * @param parentId
	 * @return
	 */
	public List<CategoryDto> queryCategoryList(Integer parentId);
	
	/**
	 *  查询分类信息(分页)
	 * @param categoryName
	 * @param parentId
	 * @return
	 */
	public Pager<CategoryDto> queryCategoryPager(String categoryName,Integer parentId,Integer status);
	
	/**
	 * 更新分类状态
	 * @param categoryId
	 */
	public void updateCategoryStatus(Integer categoryId);
	
}
