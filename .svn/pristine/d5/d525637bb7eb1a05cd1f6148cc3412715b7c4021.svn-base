package com.material.website.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeansException;
import org.springframework.stereotype.Service;

import com.material.website.args.CategoryArgs;
import com.material.website.dao.ICategoryDao;
import com.material.website.dao.IGoodsDao;
import com.material.website.dto.CategoryDto;
import com.material.website.entity.Category;
import com.material.website.entity.Goods;
import com.material.website.service.ICategorySercice;
import com.material.website.system.Pager;

/**
 * 分类业务实现类
 * @author sunxiaorong
 *
 */
@Service
public class CategoryServiceImpl implements ICategorySercice {

	@Inject
	private ICategoryDao categoryDao;
	@Inject
	private IGoodsDao goodsDao;

	@Override
	public List<CategoryDto> queryCategoryList(Integer parentId) {
		List<CategoryDto>list = categoryDao.queryCategoryList(parentId);
		List<CategoryDto> resultList = new ArrayList<CategoryDto>();
		for(CategoryDto dto :list){
			 List<CategoryDto> childList = categoryDao.queryCategoryList(dto.getId());
			 if(childList != null && childList.size()>0){
				 dto.setIsParent(true);
			 }else{
				 dto.setIsParent(false);
			 }
			 resultList.add(dto);
		}
		return resultList;
	}

	@Override
	public Pager<CategoryDto> queryCategoryPager(String categoryName,
			Integer parentId,Integer status) {
		return categoryDao.queryCategoryPager(categoryName, parentId,status);
	}
	
	@Override
	public boolean addCategory(CategoryArgs categoryArgs) {
		try {
			Category category = new Category();
			BeanUtils.copyProperties(categoryArgs, category);
			category.setStatus(0);
			categoryDao.addEntity(category);
			return true;
		} catch (BeansException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateCategory(CategoryArgs categoryArgs) {
		try {
			Category category = new Category();
			BeanUtils.copyProperties(categoryArgs, category);
			categoryDao.updateEntity(category);
			return true;
		} catch (BeansException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Map<String, Object> delCategory(Integer categoryId) {
		Map<String, Object>map = new HashMap<String, Object>();
		try {
			Category category = categoryDao.get(categoryId);
			if(category.getParentId()  == 0){
				List<CategoryDto> list = categoryDao.queryCategoryList(categoryId);
				if(list != null && list.size() > 0){
					map.put("status", 500);
					map.put("msg", "该分类存在子级分类");
					return map;
				}	
			}else{
				List<Goods>resultList = goodsDao.queryGoodsByCategoryId(categoryId);
				if(resultList != null && resultList.size() > 0){
					map.put("status", 500);
					map.put("msg", "该分类已绑定商品");
					return map;
				}	
			} 
			categoryDao.updateCategoryStatus(categoryId);
			map.put("status", 200);
			map.put("msg", "移除成功");
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status", 500);
			map.put("msg", "移除失败");
			return map;
		}
	}

	@Override
	public Category loadCategory(Integer categoryId) {
		return categoryDao.get(categoryId);
	}

}
