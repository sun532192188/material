package com.material.website.dao;

import java.util.List;

import com.material.website.args.SupplierQueryArgs;
import com.material.website.dto.SupplierDto;
import com.material.website.entity.Supplier;
import com.material.website.system.Pager;

/**
 * 供应上数据持久层接口
 * @author sunxiaorong
 *
 */
public interface ISupplierDao extends IBase<Supplier> {
   
	/**
	 * 分页查询供应商信息
	 * @param supplierDto
	 * @return
	 */
	public Pager<SupplierDto> querySupplierList(SupplierQueryArgs supplierArgs);
	
	/**
	 * 查询所有的供应商
	 * @return
	 */
	public List<Supplier> queryAllSupplier();
}
