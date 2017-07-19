package com.material.website.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

import com.material.website.args.StatisUseAlloctArgs;
import com.material.website.args.UseAlloctAddArgs;
import com.material.website.args.UseAlloctQueryArgs;
import com.material.website.dto.CategoryDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StatisUseAlloctDto;
import com.material.website.dto.UseAlloctDto;
import com.material.website.entity.Admin;
import com.material.website.entity.UseAlloct;
import com.material.website.service.ICategorySercice;
import com.material.website.service.IUseAlloctService;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.MaterialOperate;
import com.material.website.system.Pager;
import com.material.website.util.BigDecimaUtil;
import com.material.website.util.MaterialNoUtil;

/**
 * 领用/调拨控制类
 * 
 * @author sunxiaorong
 */
@Controller
@RequestMapping(value = "/useAlloct")
@Auth(ManagerType.EVERYONE)
public class UseAlloctController {

	@Inject
	private IUseAlloctService useAlloctService;
	@Inject
	private ICategorySercice categoryService;

	/**
	 * 查询领用/调拨/部门调拨 分页
	 * 
	 * @param queryArgs
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/queryUseAlloctPager")
	public String queryUseAlloctPager(UseAlloctQueryArgs queryArgs, Model model,HttpSession session) throws UnsupportedEncodingException {
		if(StringUtils.isNotEmpty(queryArgs.getOperatNo())){
			queryArgs.setOperatNo(new String(queryArgs.getOperatNo().getBytes("ISO-8859-1"),"UTF-8"));
		}
		if(queryArgs.getType() == 3){
			Admin loginManager = (Admin) session.getAttribute("loginManager");
			queryArgs.setDepartId(loginManager.getDepartId());
		}
		model.addAttribute("queryArgs", queryArgs);
		Pager<UseAlloctDto> pages = useAlloctService
				.queryDepartUsePager(queryArgs);
		model.addAttribute("pages", pages);
		if (queryArgs.getType() == 1) {
			return "admin/usealloct/alloct/list";
		}else if(queryArgs.getType() == 2){
			return "admin/usealloct/use/list";	
		}else if(queryArgs.getType() ==3){
			return "admin/departmentCenter/departStorage/list";	
		}
		return null;
	}

	/**
	 * 添加初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addInit")
	public String addInit(Integer type,Model model) {
		Integer count = useAlloctService.queryUseAlloct(type);
		if (type == 1) {
			 model.addAttribute("storageNo",MaterialNoUtil.getNo(MaterialOperate.DIAOBO.getName(), count+1));
			return "admin/usealloct/alloct/add";
		} else {
			 model.addAttribute("storageNo",MaterialNoUtil.getNo(MaterialOperate.LINGYONG.getName(), count+1));
			return "admin/usealloct/use/add";
		}

	}

	/**
	 * 添加领用/调拨
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/addUseAlloct")
	@ResponseBody
	public Map<String, Object> addUseAlloct(UseAlloctAddArgs addArgs, Model model) {
		List validInfo = ValidUtil.newInstance().valid(addArgs);
		Map<String, Object>map  = new HashMap<String, Object>();
		if (validInfo.size() > 0) {
			map.put("status", 200);
			map.put("msg", "参数为空");
			return map;
		}
		try {
			map = useAlloctService.addUseAlloct(addArgs);
		} catch (Exception e1) {
			map.put("status", 500);
			map.put("msg", e1.getMessage());
			e1.printStackTrace();
		}
		return map;
	}
	
	
	/**
	 * 根据编号查询商品
	 * @param useAlloctId
	 * @param operatNo
	 * @param sumMoney
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/queryGoodsByUseAlloctId")
	public String queryGoodsByUseAlloctId(Integer useAlloctId,String operatNo,Double sumMoney,String departName,Model model) throws UnsupportedEncodingException{
		List<GoodsInstallDto>goodsList = useAlloctService.queryGoodsList(useAlloctId);
		model.addAttribute("goodsList",goodsList);
		model.addAttribute("operatNo",operatNo);
		String formatMoney = BigDecimaUtil.formatMoney(sumMoney);
		model.addAttribute("sumMoney",formatMoney);
		if(StringUtils.isNotEmpty(departName)){
			departName = new String(departName.getBytes("ISO-8859-1"),"UTF-8");
			model.addAttribute("departName",departName);
		}
		return "admin/usealloct/useAlloct_goods";
	}
	
	/**
	 * 库存出库统计分页
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/statisUseAlloctPager")
	public String statisUseAlloctPager(StatisUseAlloctArgs queryArgs,Model model) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			queryArgs.setGoodsName(new String(queryArgs.getGoodsName().getBytes("ISO-8859-1"),"UTF-8"));
		}
	    Pager<StatisUseAlloctDto>pages = useAlloctService.statisUseAlloctPager(queryArgs);
	    model.addAttribute("pages",pages);
	    model.addAttribute("queryArgs",queryArgs);
	    model.addAttribute("categoryList",queryCategoryOne());
	    return "admin/tongji/useAlloct_statis";
	}
	
	
	
	/**
	 * 更新初始化
	 * @param storageId
	 * @param storageType 1.调拨  2.领用
	 * @return
	 */
	@RequestMapping(value="/updateUseAlloctInit")
	public String updateStorageInit(Integer useAlloctId,Integer useAlloctType,Model model){
		Map<String,Object>resultMap = useAlloctService.updateUseAlloctInit(useAlloctId);
		model.addAttribute("goodsList",resultMap.get("resultList"));
		UseAlloct useAlloct = (UseAlloct) resultMap.get("useAlloct");
		String time = new SimpleDateFormat("YYYY-MM-dd").format(useAlloct.getUseAlloctDate());
		model.addAttribute("time",time);
		String sumMoney  = "";
		if(useAlloct.getSumMoney() > 0){
			sumMoney = BigDecimaUtil.formatMoney(useAlloct.getSumMoney());
		}else{
			sumMoney = "0";
		}
		model.addAttribute("sumMoney",sumMoney);
		model.addAttribute("departId",useAlloct.getDepartmentId());
		model.addAttribute("useAlloct",useAlloct);
		if(useAlloctType == 1){
			return "admin/usealloct/alloct/updateAlloct";
		}else{
			return "admin/usealloct/use/updateUse";
		}
		
	}
	
	/**
	 * 根据编号查询调拨/领用信息
	 * @param operatNo
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/queryUseAlloctByNo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryUseAlloctByNo(String operatNo) throws ParseException{
        Map<String, Object>map = new HashMap<String,Object>();
        if(StringUtils.isEmpty(operatNo)){
        	map.put("status", 500);
        	map.put("msg","请求参数为空");
        	return map;
        }
        UseAlloct useAlloct = useAlloctService.queryUseAlloctNo(operatNo);
        String timeStr = new SimpleDateFormat("YYYY-MM-dd").format(useAlloct.getUseAlloctDate());
        map.put("useAlloctDate", timeStr);
        map.put("status", 200);
        map.put("msg", "请求成功");
        map.put("useAlloct",useAlloct);
        return map;
	}
	
	
	/**
	 * 修改入库
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateUseAlloct",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> updateUseAlloct(UseAlloctAddArgs updateArgs){
		Map<String, Object>map = new HashMap<String, Object>();
		List validInfo = ValidUtil.newInstance().valid(updateArgs);
		if (validInfo.size() > 0) {
			map.put("status", 500);
			map.put("msg", validInfo.get(0).toString());
			return map;
		}
		boolean  isTrue = useAlloctService.updateUseAlloct(updateArgs);
		if(isTrue){
			map.put("status", 200);
			map.put("msg", "修改成功");
		}else{
			map.put("status", 500);
			map.put("msg", "修改失败");
		}
		return map;
	}
	
	
	/**
	 * 将入库信息入账
	 * @param storageId
	 * @return
	 */
	@RequestMapping(value="/lockUseAlloct",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lockStorageInfo(Integer useAlloctId){
		Map<String,Object>map = new HashMap<String,Object>();
		if(useAlloctId == null){
			map.put("status", 500);
			map.put("msg", "请求参数为空");
			return map;
		}
		boolean isSuccess = useAlloctService.addLockUseAlloct(useAlloctId);
		if(isSuccess){
			map.put("status", 200);
			map.put("msg", "入账成功");
		}else{
			map.put("status", 500);
			map.put("msg", "入账失败");
		}
		return map;
	}
	
	/**
	 * 查询一级分类
	 * 
	 * @return
	 */
	public List<CategoryDto> queryCategoryOne() {
		List<CategoryDto> categoryList = categoryService.queryCategoryList(0);
		return categoryList;
	}
}
