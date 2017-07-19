package com.material.website.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zh.validate.util.ValidUtil;

import com.material.website.args.StaticsStorageArgs;
import com.material.website.args.StorageAddArgs;
import com.material.website.args.StorageQueryArgs;
import com.material.website.dto.CategoryDto;
import com.material.website.dto.GoodsInstallDto;
import com.material.website.dto.StaticsStorageDto;
import com.material.website.dto.StorageDto;
import com.material.website.entity.Storage;
import com.material.website.service.ICategorySercice;
import com.material.website.service.IStorageService;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.MaterialOperate;
import com.material.website.system.Pager;
import com.material.website.util.BigDecimaUtil;
import com.material.website.util.MaterialNoUtil;

/**
 * 入库控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="/storage")
@Auth(ManagerType.EVERYONE)
public class StorageController {
	
	@Inject
	private IStorageService storageService;
	@Inject
	private ICategorySercice categoryService;
	
	
	/**
	 * 入库查询
	 * @param type
	 * @param model
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/queryStorage")
	public String queryStorage(StorageQueryArgs queryArgs,Model model,HttpServletRequest request) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(queryArgs.getOperatNo())){
			queryArgs.setOperatNo(new String(queryArgs.getOperatNo().getBytes("ISO-8859-1"),"UTF-8"));
		}
		Pager<StorageDto>pages = null;
		model.addAttribute("queryArgs",queryArgs);
		pages = storageService.queryStoragePager(queryArgs);
		model.addAttribute("pages",pages);
		if(queryArgs.getType() == 1){
			return "admin/storage/yanshou/checkList";
		}else if(queryArgs.getType() == 2){
			return  "admin/storage/yucun/yucunList";
		}
		return null;
	}
	
	/**
	 * 添加初始化
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/addInit")
	public String addInit(Integer type,Model model){
		Integer count = storageService.getStorageCount(type);
		if(type == 1){
			model.addAttribute("storageNo", MaterialNoUtil.getNo(MaterialOperate.YANSHOURUKU.getName(), count+1));
			return "admin/storage/yanshou/addCheck";
		}else if(type == 2){
			model.addAttribute("storageNo", MaterialNoUtil.getNo(MaterialOperate.YUCUNRUKU.getName(), count+1));
			return "admin/storage/yucun/addYucun";
		}
		return null;
	}
	
	/**
	 * 添加入库
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/addStoage",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> addStoage(StorageAddArgs stoageArgs){
		Map<String, Object>map = new HashMap<String, Object>();
		List validInfo = ValidUtil.newInstance().valid(stoageArgs);
		if (validInfo.size() > 0) {
			map.put("status", 500);
			map.put("msg", validInfo.get(0).toString());
			return map;
		}
		boolean  isTrue = storageService.addStorage(stoageArgs);
		if(isTrue){
			map.put("status", 200);
			map.put("msg", "添加成功");
		}else{
			map.put("status", 500);
			map.put("msg", "添加失败");
		}
		return map;
	}
	
	/**
	 * 将入库信息入账
	 * @param storageId
	 * @return
	 */
	@RequestMapping(value="/lockStorageInfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lockStorageInfo(Integer storageId){
		Map<String,Object>map = new HashMap<String,Object>();
		if(storageId == null){
			map.put("status", 500);
			map.put("msg", "请求参数为空");
			return map;
		}
		boolean isSuccess = storageService.addLockStorage(storageId);
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
	 * 更新初始化
	 * @param storageId
	 * @param storageType 1.验收  2预存
	 * @return
	 */
	@RequestMapping(value="/updateStorageInit")
	public String updateStorageInit(Integer storageId,Integer storageType,Model model){
		Map<String,Object>resultMap = storageService.updateStorageInit(storageId);
		model.addAttribute("goodsList",resultMap.get("resultList"));
		Storage storage = (Storage) resultMap.get("storage");
		String time = new SimpleDateFormat("YYYY-MM-dd").format(storage.getStorageDate());
		model.addAttribute("time",time);
		String storageMoney  = "";
		if(storage.getStorageMoney() > 0){
			storageMoney = BigDecimaUtil.formatMoney(storage.getStorageMoney());
		}else{
			storageMoney = "0";
		}
		model.addAttribute("sumMoney",storageMoney);
		model.addAttribute("supplierId",storage.getSupplierId());
		model.addAttribute("departId",storage.getSignDepart());
		model.addAttribute("storage",storage);
		if(storageType == 1){
			return "admin/storage/yanshou/updateYanshou";
		}else{
			return "admin/storage/yucun/updateYucun";
		}
		
	}
	
	/**
	 * 修改入库
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateStorage",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> updateStorage(StorageAddArgs updsateArgs){
		Map<String, Object>map = new HashMap<String, Object>();
		List validInfo = ValidUtil.newInstance().valid(updsateArgs);
		if (validInfo.size() > 0) {
			map.put("status", 500);
			map.put("msg", validInfo.get(0).toString());
			return map;
		}
		boolean  isTrue = storageService.updateStorageInfo(updsateArgs);
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
	 * 查询商品初始化
	 * @return
	 */
	@RequestMapping(value="/queryGoodsInit")
	public String queryGoodsInit(Integer supplierId,String operatNo,Integer type,Model model){
		model.addAttribute("supplierId",supplierId);
		model.addAttribute("operatNo",operatNo);
		model.addAttribute("operatType",type);
		model.addAttribute("categoryList",queryCategoryOne());
		return "admin/storage/goodsList";
	}
	
	/**
	 * 根据单号查询商品信息
	 * @param id
	 * @param supplierName
	 * @param sumMoney
	 * @param operatNo
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/queryStorageGoods")
	public String queryStorageGoods(Integer id,String supplierName,Double sumMoney,String operatNo,String returnPage,Model model) throws UnsupportedEncodingException{
		supplierName = new String(supplierName.getBytes("ISO-8859-1"),"UTF-8");
		List<GoodsInstallDto>resultList = storageService.queryGoodsById(id);
		model.addAttribute("goodsList",resultList);
		model.addAttribute("supplierName",supplierName);
		String formatMoney = BigDecimaUtil.formatMoney(sumMoney);
		model.addAttribute("sumMoney",formatMoney);
		model.addAttribute("operatNo",operatNo);
		return "admin/"+returnPage;
	}
	
	/**
	 * 库存入库统计(分页)
	 * @param queryArgs
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/staticsStoragePager")
	public String staticsStoragePager(StaticsStorageArgs queryArgs,Model model) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(queryArgs.getGoodsName())){
			queryArgs.setGoodsName(new String(queryArgs.getGoodsName().getBytes("ISO-8859-1"),"UTF-8"));
		}
		Pager<StaticsStorageDto>pages = storageService.staticsStoragePager(queryArgs);
		model.addAttribute("queryArgs",queryArgs);
	    model.addAttribute("pages",pages);
	    model.addAttribute("categoryList",queryCategoryOne());
		return "admin/tongji/storage_statis";
	}
	
	/**
	 * 根据编号查询入库信息
	 * @param operatNo
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/queryStorageByNo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryStorageByNo(String operatNo) throws ParseException{
        Map<String, Object>map = new HashMap<String,Object>();
        if(StringUtils.isEmpty(operatNo)){
        	map.put("status", 500);
        	map.put("msg","请求参数为空");
        	return map;
        }
        Storage storage = storageService.queryStorageByNo(operatNo);
        String timeStr = new SimpleDateFormat("YYYY-MM-dd").format(storage.getStorageDate());
        map.put("storageDate", timeStr);
        map.put("status", 200);
        map.put("msg", "请求成功");
        map.put("storage",storage);
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
