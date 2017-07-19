package com.material.website.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zh.validate.util.ValidUtil;

import com.material.website.args.RoleAddArgs;
import com.material.website.dto.FunctionDto;
import com.material.website.dto.RoleFunctionDto;
import com.material.website.dto.RoleTreeDto;
import com.material.website.entity.Role;
import com.material.website.entity.RoleFunction;
import com.material.website.service.IRoleFunctionService;
import com.material.website.service.IRoleService;

/**
 * 角色控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="role")
public class RoleController {

	@Inject
	private  IRoleService roleService;
	@Inject
	private IRoleFunctionService roleFunctionService;
	
	
	
	/**
	 * 查询角色(权限树使用)
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value="/queryRoleTree",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<RoleTreeDto> queryRoleTree(Integer pid){
		List<Role> resultList = null;
		List<RoleTreeDto> treeList = new ArrayList<RoleTreeDto>();;
		try {
			resultList =roleService.queryRole();
			if(resultList != null && resultList.size()>0){
				for(Role role:resultList){
					RoleTreeDto dto = new RoleTreeDto();
					dto.setId(role.getId());
					dto.setName(role.getRoleName());
					dto.setIsParent(false);
					treeList.add(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return treeList;
	}
	
	
	/**
	 * 添加初始化
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/addInit")
	public String addInit(Model model){
		List<FunctionDto>functionList = roleFunctionService.queryAllFunction();
		model.addAttribute("functionList",functionList);
		return "admin/role/add";
	}
	
	
	/**
	 * 角色添加
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/addRole")
	public String addRole(RoleAddArgs roleArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(roleArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/role/add";
		}
		Integer resultNum = roleService.addRole(roleArgs);
		if(resultNum == -1){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","添加角色失败");
		}else{
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","添加角色成功");
			model.addAttribute("saveRoleId",resultNum);
		}
		return "admin/role/add";
	}
	
	
	/**
	 * 查询初始化
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/queryInit")
	public String queryInit(Model model){
		return "admin/role/init";
	}
	
	/**
	 * 根据角色编号查询功能
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/queryRoleFunction")
	public String queryRoleFunction(Integer roleId,Model model){
		if(roleId == null){
			model.addAttribute("type","danger");
			model.addAttribute("title","查询失败");
		}else{
			List<RoleFunctionDto> resultList = roleFunctionService.queryFunctionByRoleId(roleId);
			model.addAttribute("resultList",resultList);
		}
		return "admin/role/list";
	}
	
	/**
	 * 根据编号删除角色功能
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delRoleFunction",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>delRoleFunction(Integer id){
		Map<String, Object>map = new HashMap<String,Object>();
		if(id == null){
		    map.put("status", 500);
		    map.put("msg", "请选择删除功能");
		}else{
		   boolean isTrue =  roleFunctionService.delRoleFunction(id);
		   if(isTrue){
			   map.put("status", 200);
			   map.put("msg","删除成功");
		   }else{
			   map.put("status", 500);
			   map.put("msg","删除失败");
		   }
		}
		return  map;
	}
	
	
	/**
	 * 修改初始化
	 * @param roleId
	 * @return
	 */
	@RequestMapping(value="/updateInit")
	public String updateInit(Integer roleId,Model model){
		Role role = roleService.queryRoleById(roleId);
		model.addAttribute("role",role);
		List<FunctionDto>functionList = roleFunctionService.queryAllFunction();
		model.addAttribute("functionList",functionList);
		return "admin/role/update";
	}
	
	@RequestMapping(value="/queryRoleFunctionByRoleId",method=RequestMethod.POST)
	@ResponseBody
	public List<RoleFunction> queryRoleFunctionByRoleId(Integer roleId){
		List<RoleFunction>roleFunctionList = roleService.queryRoleFunctionByRoleId(roleId);
		return roleFunctionList;
	}
	
	/**
	 * 角色修改
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateRole")
	public String updateRole(RoleAddArgs roleArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(roleArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/role/update";
		}
		Integer  resultNum = roleService.updateRole(roleArgs);
		if(resultNum <= 0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","修改角色失败");
		}else{
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","修改角色成功");
			model.addAttribute("updateRoleId",resultNum);
		}
		return "admin/role/update";
	}
	
	
	/**
	 * 检测角色名称是否存在
	 * @param roleName
	 * @return
	 */
	@RequestMapping(value="/checkRoleExit",method=RequestMethod.POST)
	@ResponseBody
	public String checkRoleExit(String roleName){
		if(StringUtils.isEmpty(roleName)){
			return "isNull";
		}
		Role role = roleService.queryRoleByName(roleName);
		if(role != null){
			return "isExit";
		}
		return "success";
	}
}
