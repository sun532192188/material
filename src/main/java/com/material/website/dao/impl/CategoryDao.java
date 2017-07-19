package com.material.website.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.material.website.dao.BaseDao;
import com.material.website.dao.ICategoryDao;
import com.material.website.dto.CategoryDto;
import com.material.website.entity.Category;
import com.material.website.system.Pager;

/**
 * 商品分类数据持久实现
 * @author sunxiaorong
 */
@Repository
public class CategoryDao extends BaseDao<Category> implements ICategoryDao {

	
	@Override
	public List<CategoryDto> queryCategoryList(Integer parentId) {
        List<Object>args = new ArrayList<Object>();
		String sql = " SELECT id,parentId as pId,categoryName as name FROM category where parentId = ? ";
		args.add(parentId);
		return super.listBySql(sql, args.toArray(),CategoryDto.class, false);
	}
	
	
	/**
	 * 查询分类(分页)
	 * @return
	 */
	@Override
	public Pager<CategoryDto> queryCategoryPager(String categoryName,Integer parentId,Integer status){
		List<Object>args = new ArrayList<Object>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select id,categoryName as name,parentId as pId,categoryNo,status from  category where 1=1 ");
		if(StringUtils.isNotEmpty(categoryName)){
			sql.append(" and  categoryName like ? ");
			args.add("%"+categoryName+"%");
		}
		if(parentId != null){
			sql.append(" and parentId = ? ");
			args.add(parentId);
		}
		if(StringUtils.isEmpty(categoryName) && parentId == null){
			sql.append(" and parentId = 0 ");
		} 
		if(status != null){
			sql.append(" and status ="+status);
		}else{
			sql.append(" and (status=0 or status is null) ");
		}
		sql.append("  order by id desc ");
		return super.findBySql(sql.toString(),args.toArray(),CategoryDto.class, false);
	}


	@Override
	public void updateCategoryStatus(Integer categoryId) {
		String sql = "update category set status = abs(status-1) where id="+categoryId;
		super.updateBySql(sql);
	}

}
