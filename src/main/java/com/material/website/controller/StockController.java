package com.material.website.controller;

import java.io.UnsupportedEncodingException;
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

import com.material.website.args.StockArgs;
import com.material.website.dto.CategoryDto;
import com.material.website.dto.StockDto;
import com.material.website.service.ICategorySercice;
import com.material.website.service.IStockService;
import com.material.website.system.Pager;

/**
 * 库存控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="/stock")
public class StockController {
  
	@Inject
	private IStockService stockService;
	
	@Inject
	private ICategorySercice categoryService;
	
	/**
	 * 查询库存信息分页
	 * @param stockArgs
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/queryStockPage")
	public String queryStockPage(StockArgs stockArgs,Model model) throws UnsupportedEncodingException{
		if(StringUtils.isNotBlank(stockArgs.getGoodsName())){
			String goodsName = new String(stockArgs.getGoodsName().getBytes("ISO-8859-1"),"UTF-8");
			stockArgs.setGoodsName(goodsName);
		}
		Pager<StockDto> pages = stockService.queryStockPager(stockArgs);
		model.addAttribute("categoryList", queryCategoryOne());
		model.addAttribute("stockArgs",stockArgs);
		model.addAttribute("pages",pages);
		return "admin/tongji/stockList";
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
	 *查询库存商品初始化
	 *type  库存类型    1.验收  2 预存 
	 *operatType 操作类型   1.调拨   2.领用    3.调拨修改  4.领用修改
	 * @return
	 */
	@RequestMapping(value="/queryStockInit")
	public String queryStockInit(Integer type,String operatNo,Integer departId,Integer operatType,Model model){
		model.addAttribute("stockType",type);
		model.addAttribute("operatNo",operatNo);
		model.addAttribute("departId",departId);
		model.addAttribute("operatType",operatType);
		model.addAttribute("categoryList", queryCategoryOne());
		return "admin/usealloct/stockGoodsList";
	}
	 
	/**
	 * 查询库存商品列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/queryStockList", method = {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> queryStockList(StockArgs stockArgs) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<StockDto> resultList = stockService.queryStockList(stockArgs);
		resultMap.put("status", 200);
		resultMap.put("msg", "查询成功");
		resultMap.put("resultList", resultList);
		return resultMap;
	}

}
