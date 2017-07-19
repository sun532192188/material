package com.material.website.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zh.validate.util.ValidUtil;

import com.material.website.args.SupplierAddArgs;
import com.material.website.args.SupplierQueryArgs;
import com.material.website.entity.Department;
import com.material.website.entity.Supplier;
import com.material.website.service.ISupplierService;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.Pager;

/**
 * 供应商控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="/supplier")
@Auth(ManagerType.EVERYONE)
public class SupplierController {
   
	@Inject
	private ISupplierService supplierService;
	
	
	/**
	 * 查询供应商列表
	 * @param supplierArgs
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/querySupplierList",method={RequestMethod.GET,RequestMethod.POST})
	public String querySupplierList(SupplierQueryArgs supplierArgs,Model model) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(supplierArgs.getSupplierName())){
			 supplierArgs.setSupplierName(new String(supplierArgs.getSupplierName().getBytes("ISO-8859-1"),"UTF-8"));
		}
		if(StringUtils.isNotEmpty(supplierArgs.getAddress())){
			supplierArgs.setAddress(new String(supplierArgs.getAddress().getBytes("ISO-8859-1"),"UTF-8"));
		}
		Pager pager = supplierService.querySupplierList(supplierArgs);
		model.addAttribute("pages",pager);
		model.addAttribute("supplierArgs",supplierArgs);
		return "admin/supplier/list";
	}
	
	/**
	 * 供应商添加初始化
	 * @return
	 */
	@RequestMapping(value="/addInit",method={RequestMethod.GET,RequestMethod.POST})
	public String addInit(){
		return "admin/supplier/add";
	}
	
	
	/**
	 * 添加供应商
	 * @param supplierAddArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/addSupplier",method={RequestMethod.GET,RequestMethod.POST})
	public String addSupplier(SupplierAddArgs  supplierArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(supplierArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/supplier/add";
		}
		Supplier supplier = new Supplier();
		BeanUtils.copyProperties(supplierArgs, supplier);
		boolean isSuccess = supplierService.addSupplier(supplier);
		if(!isSuccess){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","添加供应商失败");
			return "admin/supplier/add";
		}else{
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","添加供应商成功");
			return "admin/supplier/add";
		}
	}
	
	/**
	 * 更新初始化
	 * @param supplierId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/updateInit")
	public String updateInit(Integer supplierId,Model model){
		if(supplierId == null){
			model.addAttribute("errorInfo","查询参数为空");
			return "admin/supplier/update";
		}
		Supplier supplier = supplierService.querySupplierById(supplierId);
		if(supplier == null){
			model.addAttribute("errorInfo","初始化出错！");
			return "admin/supplier/update";
		}
		model.addAttribute("supplier",supplier);
		return "admin/supplier/update";
	}
	
	/**
	 * 修改供应商信息
	 * @param updateArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateSupplier",method={RequestMethod.GET,RequestMethod.POST})
	public String updateSupplier(SupplierAddArgs updateArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(updateArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/supplier/update";
		}
		Supplier supplier = new Supplier();
		BeanUtils.copyProperties(updateArgs, supplier);
		try {
			supplierService.updateSupplier(supplier);
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","修改供应商成功");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","修改供应商失败");
		}
		return "admin/supplier/update";
	}
	
	
	@RequestMapping(value="/testPrint",method={RequestMethod.GET,RequestMethod.POST})
	public String testPrint(Model model){
		List<Department> list = new ArrayList();
		for(int i=0;i<10;i++){
			Department depart = new Department();
			depart.setDepartmentName("采购部");
			depart.setDescription("测试打印");
			depart.setPhone("15811140738");
			list.add(depart);
		}
		model.addAttribute("resultList",list);
		model.addAttribute("time",new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		model.addAttribute("supplier","华联超市");
		return "admin/print/lingyong";
	}
	
	
	/**
	 * 查询所有的供应商
	 * @return
	 */
	@RequestMapping(value="/queryAllSuppler")
	@ResponseBody
	public Map<String, Object> queryAllSuppler(){
		Map<String, Object>resultMap = new HashMap<String, Object>();
		try {
			List<Supplier>resultList = supplierService.queryAllSupplier();
			resultMap.put("status", 200);
			resultMap.put("msg", "查询成功");
			resultMap.put("resultList", resultList);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", 500);
			resultMap.put("msg", "查询失败");
		}
		return resultMap;
	}
}
