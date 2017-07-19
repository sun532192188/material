package com.material.website.service;

import java.util.List;

import com.material.website.args.SupplierQueryArgs;
import com.material.website.dto.SupplierDto;
import com.material.website.entity.Supplier;
import com.material.website.system.Pager;

/**
 * 供应商业务接口
 * @author sunxiaorong
 *
 */
public interface ISupplierService {

	/**
	 * 分页查询供应商信息
	 * @param supplierArgs
	 * @return
	 */
	public Pager<SupplierDto> querySupplierList(SupplierQueryArgs supplierArgs);
	
	/**
	 * 添加供应商信息
	 * @param supplier
	 * @return
	 */
	public boolean addSupplier(Supplier supplier);
	
	/**
	 * 修改供应商信息
	 * @param supplier
	 * @return
	 */
	public void updateSupplier(Supplier supplier);
	
	/**
	 * 根据供应商编号查询供应商信息
	 * @param supplierId
	 * @return
	 */
	public Supplier querySupplierById(Integer supplierId);
	
	/**
	 * 查询所有的供应商
	 * @return
	 */
	public List<Supplier> queryAllSupplier();
	

}
