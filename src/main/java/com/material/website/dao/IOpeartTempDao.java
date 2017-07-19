package com.material.website.dao;

import com.material.website.entity.OperatTemp;

public interface IOpeartTempDao extends IBase<OperatTemp> {
	
	 /**
     * 根据条件加载单条数据
     * @param goodsId
     * @param supplierId
     * @param operatNo
     * @return
     */
    public OperatTemp loadTemp(Integer goodsId,Integer supplierId,String operatNo,Double goodsPrice);
}
