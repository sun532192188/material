package com.material.website.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zh.validate.util.ValidUtil;

import com.material.website.args.AdminArgs;
import com.material.website.dto.UserDto;
import com.material.website.entity.Admin;
import com.material.website.service.IAdminService;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.Pager;


/**
 * 用户控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="/user")
@Auth(ManagerType.EVERYONE)
public class UserController {
	@Inject
	private IAdminService adminService;
	
	@RequestMapping(value="/addInit")
	public String addInit(){
		return "admin/user/add";
	}

	/**
	 * 添加用户
	 * 
	 * @param admin
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/addUser")
	public String addUser(AdminArgs userArgs, Model model) {
		List validInfo = ValidUtil.newInstance().valid(userArgs);
		if (validInfo.size() > 0) {
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", validInfo.get(0).toString());
			return "admin/user/add";
		}
		try {
			adminService.add(userArgs);
			model.addAttribute("type", "success");
			model.addAttribute("title", "操作成功");
			model.addAttribute("msg", "添加用户成功");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", "添加用户失败");
		}
		return "admin/user/add";
	}
	
	
	/**
	 * 查询用户信息分页
	 * @param userName
	 * @param roleId
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/queryUserPager")
	public String queryUserPager(String userName,String realName,Integer roleId,Integer remove,Model model,HttpSession session) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(userName)){
			userName = new String(userName.getBytes("ISO-8859-1"),"UTF-8");
		}
		Pager<UserDto> pages = adminService.queryUserPager(userName, roleId,remove);
	    model.addAttribute("pages",pages);
	    model.addAttribute("userName",userName);
	    model.addAttribute("roleId",roleId);
	    model.addAttribute("remove",remove);
	    return "admin/user/list";
	}
	
	/**
	 * 更新初始化
	 * @param userId
	 * @return
	 */
	@RequestMapping(value="/updateInit")
	public String updateInit(Integer userId,Model model){
		Admin admin = adminService.loadAdminInfo(userId);
		model.addAttribute("user",admin);
		return "admin/user/update";
	}
	
	/**
	 * 更新用户
	 * @param admin
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateUser")
	public String updateUser(AdminArgs userArgs, Model model) {
		List validInfo = ValidUtil.newInstance().valid(userArgs);
		if (validInfo.size() > 0) {
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", validInfo.get(0).toString());
			return "admin/user/add";
		}
		try {
			adminService.update(userArgs);
			model.addAttribute("type", "success");
			model.addAttribute("title", "操作成功");
			model.addAttribute("msg", "修改用户成功");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", "修改用户失败");
		}
		return "admin/user/update";
	}
	
	/**
	 * 删除用户信息
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delUser")
	@ResponseBody
	public Map<String, Object>delUser(Integer id){
		Map<String, Object>map = new HashMap<String, Object>();
		try {
			adminService.updateStatus(id);
			map.put("status",200);
			map.put("msg", "删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("status",500);
			map.put("msg", "删除失败");
		}
		return map;
	}
	
	/**
	 * 检测用户是否存在
	 * @param username
	 * @return
	 */
	@RequestMapping(value="/checkUserExit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkUserExit(String username){
		Map<String, Object>map = new HashMap<String,Object>();
		if(StringUtils.isEmpty(username)){
			map.put("status", 500);
			map.put("msg", "用户名为空");
			return map;
		}
		Admin admin = adminService.loadAdminByName(username);
		if(admin != null){
			map.put("status", 500);
			map.put("msg", "用户名已存在");
		}else{
			map.put("status", 200);
		}
		return map;
	}
	
}
