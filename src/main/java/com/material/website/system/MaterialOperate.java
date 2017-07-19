package com.material.website.system;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 物资操作枚举类型
 * @author sunxiaorong
 *
 */
public enum MaterialOperate {
	
	/**
	 * 验收入库
	 */
	YANSHOURUKU(0,"YSRK-"+new SimpleDateFormat("YYYYMMdd").format(new Date())),
	/**
	 * 预存入库
	 */
	YUCUNRUKU(1,"YCRK-"+new SimpleDateFormat("YYYYMMdd").format(new Date())),
	/**
	 * 领用
	 */
	LINGYONG(2,"LY-"+new SimpleDateFormat("YYYYMMdd").format(new Date())),
	/**
	 * 调拨
	 */
	DIAOBO(3,"DB-"+new SimpleDateFormat("YYYYMMdd").format(new Date())),
	/**
	 * 部门调拨
	 */
	BMDB(4,"BMDB-"+new SimpleDateFormat("YYYYMMdd").format(new Date())),
	/**
	 * 出库
	 */
	CK(5,"CK-"+new SimpleDateFormat("YYYYMMdd").format(new Date()));
	
	private int id;
	private String name;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @param id
	 * @param name
	 */
	private MaterialOperate(int id, String name) {
		this.id = id;
		this.name = name;
	}
}
