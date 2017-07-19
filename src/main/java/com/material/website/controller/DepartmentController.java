package com.material.website.controller;

import java.io.UnsupportedEncodingException;
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

import com.material.website.args.DepartmentArgs;
import com.material.website.entity.Department;
import com.material.website.service.IDepartmentService;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.Pager;

/**
 * 部门控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="/department")
@Auth(ManagerType.EVERYONE)
public class DepartmentController {
   
	@Inject
	private IDepartmentService departmentService;
	
	/**
	 * 查询部门列表 
	 * @param departName
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/queryDepartList",method={RequestMethod.GET,RequestMethod.POST})
	public String queryDepartList(String departName,String phone,Model model) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(departName)){
			departName = new String(departName.getBytes("ISO-8859-1"),"UTF-8");
		}
		Pager pages = departmentService.queryDepartmentList(departName,phone);
		model.addAttribute("departName",departName);
		model.addAttribute("phone",phone);
		model.addAttribute("pages",pages);
		return "admin/department/list";
	}
	
	/**
	 * 部门添加初始化
	 * @return
	 */
	@RequestMapping(value="/addInit",method={RequestMethod.GET,RequestMethod.POST})
	public String addInit(){
		return "admin/department/add";
	}
	
	
	/**
	 * 添加部门
	 * @param supplierAddArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/addDepart",method={RequestMethod.POST})
	public String addSupplier(DepartmentArgs  departmentArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(departmentArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/department/add";
		}
		Department department = new Department();
		BeanUtils.copyProperties(departmentArgs, department);
		department.setDescription(department.getDescription().trim());
		boolean isSuccess = departmentService.addDepartment(department);
		if(!isSuccess){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","添加部门失败");
			return "admin/department/add";
		}else{
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","添加部门成功");
			return "admin/department/add";
		}
	}
	
	/**
	 * 更新初始化
	 * @param supplierId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/updateInit")
	public String updateInit(Integer departId,Model model){
		if(departId == null){
			model.addAttribute("errorInfo","查询参数为空");
			return "admin/department/update";
		}
		Department department = departmentService.loadDepartment(departId);
		if(department == null){
			model.addAttribute("errorInfo","初始化出错！");
			return "admin/department/update";
		}
		model.addAttribute("department",department);
		return "admin/department/update";
	}
	
	/**
	 * 修改部门信息
	 * @param updateArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateDepart",method={RequestMethod.GET,RequestMethod.POST})
	public String updateSupplier(DepartmentArgs updateArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(updateArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/department/update";
		}
		Department department = new Department();
		BeanUtils.copyProperties(updateArgs, department);
		try {
			departmentService.updateDepartment(department);
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","修改部门成功");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","修改部门失败");
		}
		return "admin/department/update";
	}
	
	
	/**
	 * 查询所有的部门信息
	 * @return
	 */
	@RequestMapping(value="/queryAllDepartment",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAllDepartment(){
		Map<String, Object>resultMap = new HashMap<String, Object>();
		List<Department>resultList = departmentService.queryAllDepartMent();
		resultMap.put("status", 200);
		resultMap.put("msg", "查询成功");
		resultMap.put("resultList", resultList);
		return resultMap;
	}
}
