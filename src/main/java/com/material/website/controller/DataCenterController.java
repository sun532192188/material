package com.material.website.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.material.website.service.IAdminService;
import com.material.website.util.PropertiesUtil;
import com.material.website.web.MySqlImportAndExport;

/**
 * 数据中心控制类
 * 
 * @author sunxiaorong
 *
 */
@RequestMapping(value = "dataCenterController")
@Controller
public class DataCenterController {
	
	@Inject
	private IAdminService  adminService;

	/**
	 * 数据操作
	 * 
	 * @param operatType
	 * @return
	 */
	@RequestMapping(value = "/dataOperat")
	@ResponseBody
	public Map<String, Object> dataOperat(Integer operatType) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			InputStream is = MySqlImportAndExport.class.getClassLoader()
					.getResourceAsStream("jdbc.properties");
			Properties properties = new Properties();
			properties.load(is);
			// 数据备份
			if (operatType == 1) {
				MySqlImportAndExport.export(properties);
				map.put("msg","数据备份成功");
		    //数据还原
			}else if(operatType == 2){
				MySqlImportAndExport.importSql(properties);
				map.put("msg","数据还原成功");
			}else if(operatType ==3){
				String tables = PropertiesUtil.newInstance().loadValue("data_tables", "jdbc.properties");
			    if(StringUtils.isNotEmpty(tables)){
			    	String[]tableArray = tables.split(";");
			    	for(String str:tableArray){
			    		adminService.deleteAllData(str);
			    		System.out.println("数据表【"+str+"】清除成功...");
			    	}
			    	System.out.println("数据库清除完毕...");
			    	map.put("msg","数据清除成功");
			    }
			}
			map.put("status",200);
		} catch (IOException e) {
			e.printStackTrace();
			map.put("status",500);
			map.put("msg", "数据操作失败");
		}
		return map;
	}
	
	/**
	 * 数据初始化
	 * @return
	 */
	@RequestMapping(value="/dataInit")
	public String dataInit(){
		return "admin/datacenter/data";
	}
	
	/**
	 * 系统名称初始化
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value="/systemNameInit")
	public String systemNameInit(Model model) throws UnsupportedEncodingException{
		String systemName = PropertiesUtil.newInstance().loadValue("system_name", "system_config.properties");
	   // systemName = new String(systemName.getBytes("ISo-8859-1"),"UTF-8");
		model.addAttribute("systemName",systemName);
	    return "admin/datacenter/system_name";
	}
	
	/**
	 * 更改系统名称
	 * @param systemName
	 * @return
	 */
	@RequestMapping(value="/updateSystemName",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSystemName(String systemName){
	    Map<String, Object>map = new HashMap<String,Object>();
		PropertiesUtil.writeProperties("system_config.properties", "system_name", systemName);
		map.put("status", 200);
		map.put("msg","更改成功,重新登录后生效");
		map.put("systemName",systemName);
		return map;
	}
	
	
	
}
