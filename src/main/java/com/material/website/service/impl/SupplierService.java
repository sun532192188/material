package com.material.website.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.material.website.args.SupplierQueryArgs;
import com.material.website.dao.ISupplierDao;
import com.material.website.dto.SupplierDto;
import com.material.website.entity.Supplier;
import com.material.website.service.ISupplierService;
import com.material.website.system.Pager;

/**
 * 供应商业务实现类
 * @author sunxiaorong
 *
 */
@Service
public class SupplierService implements ISupplierService {

	@Inject
	private ISupplierDao supplierDao;
	
	@Override
	public Pager<SupplierDto> querySupplierList(SupplierQueryArgs supplierArgs) {
		return supplierDao.querySupplierList(supplierArgs);
	}

	@Override
	public boolean addSupplier(Supplier supplier) {
		try {
			supplierDao.addEntity(supplier);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public void updateSupplier(Supplier supplier) {
		supplierDao.updateEntity(supplier);
	}

	@Override
	public Supplier querySupplierById(Integer supplierId) {
		return supplierDao.get(supplierId);
	}

	@Override
	public List<Supplier> queryAllSupplier() {
		return supplierDao.queryAllSupplier();
	}
}
