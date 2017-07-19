package com.material.website.controller;

import java.io.UnsupportedEncodingException;
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

import com.material.website.args.CategoryArgs;
import com.material.website.dto.CategoryDto;
import com.material.website.entity.Admin;
import com.material.website.entity.Category;
import com.material.website.service.ICategorySercice;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;
import com.material.website.system.Pager;
import com.material.website.util.MaterialNoUtil;
import com.material.website.util.PinYin2Abbreviation;

/**
 * 商品分类控制类
 * @author sunxiaorong
 *
 */
@Controller
@RequestMapping(value="/category")
@Auth(ManagerType.EVERYONE)
public class CategoryController {
	
	@Inject
	private ICategorySercice categoryService;
	
	/**
	 * 分类初始化
	 * @param parentId
	 * @param model
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/queryInit")
	public String queryInit(Integer parentId,Model model,HttpSession session){
		Admin admin = (Admin) session.getAttribute("loginManager");
		return "admin/category/init";
	}
     
	
	/**
	 * 查询分类列表(分类树使用)
	 * @param parentId
	 * @return
	 */
	@RequestMapping(value="/queryCategoryList",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<CategoryDto> queryCategoryList(Integer pid){
		List<CategoryDto> resultList = null;
		try {
			resultList = categoryService.queryCategoryList(pid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	/**
	 * 查询分类列表(右边列表使用)
	 * @param parentId
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/queryCategoryPager",method={RequestMethod.POST,RequestMethod.GET})
	public String queryCategoryPager(Integer parentId,String categoryName,Integer status,Model model) throws UnsupportedEncodingException{
		if(StringUtils.isNotEmpty(categoryName)){
			categoryName = new String(categoryName.getBytes("ISO-8859-1"),"UTF-8");
		}
		Pager<CategoryDto>pages = categoryService.queryCategoryPager(categoryName, parentId,status);
		model.addAttribute("pages",pages);
		model.addAttribute("categoryName",categoryName);
		model.addAttribute("status",status);
		model.addAttribute("parentId",parentId);
		return "admin/category/list";
	}
	
	/**
	 * 添加分类初始化
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/addInit",method={RequestMethod.GET,RequestMethod.POST})
	public String addInit(String parentId,String parentName,Model model) throws UnsupportedEncodingException{
		model.addAttribute("parentId",parentId);
		model.addAttribute("parentName",new String(parentName.getBytes("ISO-8859-1"),"UTF-8"));
		return "admin/category/add";
	}
	
	
	/**
	 * 添加分类
	 * @param supplierAddArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/addCategory",method={RequestMethod.POST})
	public String addSupplier(CategoryArgs categoryArgs,Model model){
		model.addAttribute("categoryArgs",categoryArgs);
		List validInfo=ValidUtil.newInstance().valid(categoryArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/category/add";
		}
		String categoryNo = "";
		if(categoryArgs.getParentName().equals("类目树")){
			//categoryNo = PinYin2Abbreviation.cn2py(categoryArgs.getCategoryName());
		    categoryNo = categoryArgs.getCategoryNo().toUpperCase();
		    categoryArgs.setCategoryNo(categoryNo);
		}else{
		   List<CategoryDto>  list = categoryService.queryCategoryList(categoryArgs.getParentId());
		   Category category = categoryService.loadCategory(categoryArgs.getParentId());
		   if(list == null || list.size() <= 0){
			   categoryNo = category.getCategoryNo()+"01";
			   
		   }else{
			  categoryNo = category.getCategoryNo()+MaterialNoUtil.getNo(2, list.size()+1); 
		   }
		   categoryArgs.setCategoryNo(categoryNo);
		}
		/*if(!categoryNo.equals(categoryArgs.getCategoryNo())){
			model.addAttribute("type","warning");
			model.addAttribute("title","警告提示");
			model.addAttribute("msg","分类编号与分类名称不符");
			return "admin/category/add";
		}*/
		boolean isSuccess = categoryService.addCategory(categoryArgs);
		if(!isSuccess){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","添加分类失败");
			return "admin/category/add";
		}else{
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","添加分类成功");
			return "admin/category/add";
		}
	}
	
	/**
	 * 更新初始化
	 * @param supplierId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/updateInit")
	public String updateInit(Integer categoryId,Model model){
		if(categoryId == null){
			model.addAttribute("errorInfo","查询参数为空");
			return "admin/category/update";
		}
		Category category = categoryService.loadCategory(categoryId);
		if(category == null){
			model.addAttribute("errorInfo","初始化出错！");
			return "admin/category/update";
		}
		model.addAttribute("category",category);
		Category parentCategory = categoryService.loadCategory(category.getParentId());
		if(parentCategory == null){
			parentCategory = new Category();
			parentCategory.setCategoryName("类目树");
		}
		model.addAttribute("parentName",parentCategory.getCategoryName());
		return "admin/category/update";
	}
	
	/**
	 * 修改分类信息
	 * @param updateArgs
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/updateCategory",method={RequestMethod.GET,RequestMethod.POST})
	public String updateSupplier(CategoryArgs categoryArgs,Model model){
		List validInfo=ValidUtil.newInstance().valid(categoryArgs);
		if(validInfo.size()>0){
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg",validInfo.get(0).toString());
			return "admin/category/update";
		}
		try {
		    categoryService.updateCategory(categoryArgs);
			model.addAttribute("type","success");
			model.addAttribute("title","操作成功");
			model.addAttribute("msg","修改分类成功");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("type","danger");
			model.addAttribute("title","错误提示");
			model.addAttribute("msg","修改分类失败");
		}
		return "admin/category/update";
	}
	
	
	/**
	 * 移除分类信息
	 * @param categoryId
	 * @return
	 */
	@RequestMapping(value="/delCategory",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delCategory(Integer categoryId){
		Map<String, Object>map = categoryService.delCategory(categoryId);
		return map;
	}
	
	/**
	 * 生成分类编号
	 * @param parentName
	 * @param categoryName
	 * @return
	 */
	@RequestMapping(value="/createCategoryNo",method=RequestMethod.POST)
	@ResponseBody
	public String createCategoryNo(Integer parentId,String parentName,String categoryName){
		try {
			String categoryNo = "";
			if(parentName.equals("类目树")){
				categoryNo = PinYin2Abbreviation.cn2py(categoryName);
			}else{
				Category category = categoryService.loadCategory(parentId);
			   List<CategoryDto>  list = categoryService.queryCategoryList(parentId);
			   if(list == null || list.size() <= 0){
				   categoryNo = category.getCategoryNo()+"01";
			   }else{
				  categoryNo = category.getCategoryNo()+MaterialNoUtil.getNo(2, list.size()+1); 
			   }
			}
			 return categoryNo;
		} catch (Exception e) {
			e.printStackTrace();
		}
       return null;
	}
}
