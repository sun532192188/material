package com.material.website.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zh.validate.util.ValidUtil;

import com.material.website.args.GoodsAddArgs;
import com.material.website.args.GoodsQueryArgs;
import com.material.website.dto.CategoryDto;
import com.material.website.dto.GoodsDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.entity.Admin;
import com.material.website.entity.Category;
import com.material.website.entity.Department;
import com.material.website.entity.Goods;
import com.material.website.entity.OperatTemp;
import com.material.website.service.ICategorySercice;
import com.material.website.service.IDepartmentService;
import com.material.website.service.IGoodsService;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.Pager;
import com.material.website.util.BigDecimaUtil;
import com.material.website.util.MaterialNoUtil;

/**
 * 商品控制类
 * 
 * @author sunxiaorong
 * 
 */
@Controller
@RequestMapping(value = "goods")
@Auth(ManagerType.EVERYONE)
public class GoodsController {

	@Inject
	private IGoodsService goodsService;
	@Inject
	private ICategorySercice categoryService;
	@Inject
	private IDepartmentService departmentService;

	/**
	 * 商品查询(分页)
	 * 
	 * @param queryArgs
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/queryGoodsPager")
	public String queryGoodsPager(GoodsQueryArgs queryArgs, Model model) throws UnsupportedEncodingException {
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			queryArgs.setGoodsName(new String(queryArgs.getGoodsName().getBytes("ISO-8859-1"),"UTF-8"));
		}
		Pager<GoodsDto> pages = goodsService.queryGoodsPager(queryArgs);
		model.addAttribute("queryArgs", queryArgs);
		model.addAttribute("pages", pages);
		model.addAttribute("categoryList", queryCategoryOne());
		if(queryArgs.getReturnType() == 1){
			return "admin/goods/list";
		}else if(queryArgs.getReturnType() ==2){
			return "admin/departmentCenter/goodsInfo/list";
		}
		return null;
		
	}

	/**
	 * 添加商品初始化
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addInit", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String addInit(Model model) {
		model.addAttribute("categoryList", queryCategoryOne());
		/*
		 * List<Supplier> supplierList = supplierService.queryAllSupplier();
		 * model.addAttribute("supplierList", supplierList);
		 */
		return "admin/goods/add";
	}

	/**
	 * 添加商品
	 * 
	 * @param supplierAddArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/addGoods", method = { RequestMethod.POST })
	public String addSupplier(GoodsAddArgs goodsAddArgs, Model model) {
		List validInfo = ValidUtil.newInstance().valid(goodsAddArgs);
		if (validInfo.size() > 0) {
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", validInfo.get(0).toString());
			return "admin/goods/add";
		}
		boolean isSuccess = goodsService.addGoods(goodsAddArgs);
		if (!isSuccess) {
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", "添加商品失败");
			return "admin/goods/add";
		} else {
			model.addAttribute("type", "success");
			model.addAttribute("title", "操作成功");
			model.addAttribute("msg", "添加商品成功");
			return "admin/goods/add";
		}
	}

	/**
	 * 更新初始化
	 * 
	 * @param supplierId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/updateInit")
	public String updateInit(Integer goodsId, Model model) {
		if (goodsId == null) {
			model.addAttribute("errorInfo", "查询参数为空");
			return "admin/goods/update";
		}
		Goods goods = goodsService.loadGoods(goodsId);
		if (goods == null) {
			model.addAttribute("errorInfo", "初始化出错！");
			return "admin/goods/update";
		}
		GoodsDto dto = new GoodsDto();
	    dto.setId(goods.getId());
	    dto.setGoodsName(goods.getGoodsName());
	    dto.setIsDecimal(goods.getIsDecimal());
	    dto.setPrice(goods.getPrice().toString());
	    dto.setSpec(goods.getSpec());
	    dto.setSpecModel(goods.getSpecModel());
	    dto.setStatus(goods.getStatus());
	    dto.setSupplierId(goods.getSupplierId());
	    dto.setGoodsType(goods.getGoodsType());
	    dto.setGoodsNo(goods.getGoodsNo());
		Category category = categoryService
				.loadCategory(goods.getCategoryOne());
		dto.setCategoryOneName(category.getCategoryName());
		dto.setCategoryOne(category.getId());
		category = categoryService.loadCategory(goods.getCategoryTwo());
		dto.setCategoryTwoName(category.getCategoryName());
		dto.setCategoryTwo(category.getId());
		model.addAttribute("goods", dto);
		/*
		 * List<Supplier> supplierList = supplierService.queryAllSupplier();
		 * model.addAttribute("supplierList", supplierList);
		 */
		return "admin/goods/update";
	}

	/**
	 * 修改商品信息
	 * 
	 * @param updateArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/updateGoods", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String updateSupplier(GoodsAddArgs goodsArgs, Model model) {
		List validInfo = ValidUtil.newInstance().valid(goodsArgs);
		if (validInfo.size() > 0) {
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", validInfo.get(0).toString());
			return "admin/goods/update";
		}
		try {
			goodsService.updateGoods(goodsArgs);
			model.addAttribute("type", "success");
			model.addAttribute("title", "操作成功");
			model.addAttribute("msg", "修改商品成功");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("type", "danger");
			model.addAttribute("title", "错误提示");
			model.addAttribute("msg", "修改商品失败");
		}
		return "admin/goods/update";
	}

	/**
	 * 删除商品
	 * 
	 * @param goodsId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/delGoods", method = RequestMethod.POST)
	@ResponseBody
	public String delGoods(Integer goodsId, Model model) {
		if (goodsId == null) {
			return "isNull";
		}
		boolean isTrue = goodsService.delGoods(goodsId);
		if (isTrue) {
			return "success";
		} else {
			return "fail";
		}
	}

	/**
	 * 根据parentId 查询二级分类
	 * 
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value = "/queryCategoryByParentId", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCategoryByParentId(Integer parentId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<CategoryDto> list = categoryService
					.queryCategoryList(parentId);
			resultMap.put("status", "200");
			resultMap.put("msg", "成功");
			resultMap.put("resultList", list);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("status", "500");
			resultMap.put("msg", "失败");
		}
		return resultMap;
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

	/**
	 * 查询所有的商品
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryAllGoods", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryAllGoods(GoodsQueryArgs queryArgs) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<GoodsDto> resultList = goodsService.queryAllGoods(queryArgs);
		resultMap.put("status", 200);
		resultMap.put("msg", "查询成功");
		resultMap.put("resultList", resultList);
		return resultMap;
	}

	/**
	 * 组装选中的商品
	 * 
	 * @param returnPage
	 * @return
	 */
	@RequestMapping(value = "/installGoods")
	public String installGoods(String returnPage, String goodsStr,
			String supplierId, String operatNo,String departId,String isReturn,Integer stockType, Model model,HttpSession session) {
		Integer suppId = null;
		if (StringUtils.isNotEmpty(goodsStr)) {
			String[] goodsArray = goodsStr.split(";");
			OperatTemp temp =  null;
			for(String str :goodsArray){
				String[]goodsObj = str.split(",");
				Integer goodsId =  Integer.valueOf(goodsObj[0]);
				Double goodsNum = Double.valueOf(goodsObj[1]);
				Double goodsPrice = 0.0;
				if(goodsObj.length == 3){
					 goodsPrice = Double.valueOf(goodsObj[2]);
					 goodsPrice = BigDecimaUtil.formatDouble(goodsPrice);
				}
				if(StringUtils.isNotEmpty(supplierId) && supplierId != null &&!supplierId.equals("null")){
					suppId = Integer.valueOf(supplierId);
				}
				//部门月计划申请、出库、部门调拨使用该操作号
				if(StringUtils.isEmpty(operatNo)){
					operatNo = (String) session.getAttribute("md5Str");
					Admin admin = (Admin) session.getAttribute("loginManager");
					Department department = departmentService.loadDepartment(admin.getDepartId());
					model.addAttribute("departmentName",department.getDepartmentName());
				}
				 temp = goodsService.loadTemp(goodsId, suppId, operatNo,goodsPrice);
				if(temp != null){
					temp.setGoodsNum(goodsNum+temp.getGoodsNum());
					Double singleMoney = temp.getGoodsNum()*temp.getPrice();
					singleMoney = BigDecimaUtil.formatDouble(singleMoney);
					temp.setSingleMoney(singleMoney);
					goodsService.updateTempGoodsNum(temp);
				}else{
					Goods goods = goodsService.loadGoods(goodsId); 
					if(goods != null){
						temp = new OperatTemp();
						BeanUtils.copyProperties(goods, temp);
						temp.setGoodsNum(goodsNum);
						temp.setPrice(goodsPrice);
						Double singleMoney = goodsPrice * goodsNum;
						singleMoney = BigDecimaUtil.formatDouble(singleMoney);
						temp.setSingleMoney(singleMoney);
						temp.setOperatNo(operatNo);
						temp.setGoodsId(goodsId);
						temp.setSupplierId(suppId);
						temp.setGoodsNo(goods.getGoodsNo());
						goodsService.addOperatTemp(temp);
					}
				}
			}
			List<GoodsInstallDto> goodsList = goodsService.queryAllTemp(suppId, operatNo); 
			Double sumMoney = 0.0;
			for(GoodsInstallDto dto: goodsList){
				sumMoney += dto.getPrice()*dto.getGoodsNum();
			}
			sumMoney = BigDecimaUtil.formatDouble(sumMoney);
			model.addAttribute("goodsList",goodsList);
			model.addAttribute("storageNo",operatNo);
			String formatSunMoney =  BigDecimaUtil.formatMoney(sumMoney);
			model.addAttribute("sumMoney",formatSunMoney);
			model.addAttribute("supplierId",supplierId);
			model.addAttribute("departId",departId);
			model.addAttribute("stockType",stockType);
		}
		return "admin/" + returnPage;
	}

	/**
	 * 查询所有的临时数据
	 * 
	 * @param supplierId
	 * @param operatNo
	 * @return
	 */
	@RequestMapping(value = "/queryAllTempGoods")
	public String queryAllTempGoods(Integer supplierId, String operatNo,
			String returnPage, Model model,HttpSession session) {
		if(StringUtils.isEmpty(operatNo)){
			operatNo = (String) session.getAttribute("md5Str");
			Admin admin = (Admin) session.getAttribute("loginManager");
			Department department = departmentService.loadDepartment(admin.getDepartId());
			model.addAttribute("departmentName",department.getDepartmentName());
		}
		List<GoodsInstallDto> goodsList = goodsService.queryAllTemp(supplierId,
				operatNo);
		Double sumMoney = 0.0;
		for (GoodsInstallDto dto : goodsList) {
			sumMoney += dto.getSingleMoney();
		}
		String formatSunMoney =  BigDecimaUtil.formatMoney(sumMoney);
		model.addAttribute("sumMoney", formatSunMoney);
		model.addAttribute("supplierId", supplierId);
		model.addAttribute("storageNo", operatNo);
		model.addAttribute("goodsList", goodsList);
		
		return "admin/" + returnPage;
	}

	/**
	 * 删除所有的临时数据
	 * 
	 * @param supplierId
	 * @param operatNo
	 * @return
	 */
	@RequestMapping(value = "/delAllOperatTemp")
	@ResponseBody
	public Map<String, Object> delAllOperatTemp(Integer supplierId,
			String operatNo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		goodsService.delAllTemp(supplierId, operatNo);
		resultMap.put("status", 200);
		resultMap.put("msg", "删除成功");
		return resultMap;
	}
	
	/**
	 * 根据编号删除临时数据
	 * @param id
	 * @return
	 */
	@RequestMapping(value="delTempById",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object>delTempById(Integer id){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		goodsService.delOperaTemp(id);
		resultMap.put("status", 200);
		resultMap.put("msg", "删除成功");
		return resultMap;
	}
	
	/**
	 * 生成商品编号 
	 * @param categoryTwo
	 * @return
	 */
	@RequestMapping(value="/createGoodsNo",method=RequestMethod.POST)
	@ResponseBody
	public String createGoodsNo(Integer categoryTwo){
		Category category = categoryService.loadCategory(categoryTwo);
		List<Goods>list = goodsService.queryGoodsByCategoryId(categoryTwo);
		String goodsNo = "";
		if(list == null || list.size() <= 0){
			goodsNo = category.getCategoryNo()+"00001";
		}else{
			goodsNo = category.getCategoryNo()+MaterialNoUtil.getNo(5, list.size()+1);
		}
		return goodsNo;
	}
}
