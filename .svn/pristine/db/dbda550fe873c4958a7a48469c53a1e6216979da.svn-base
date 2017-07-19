/*
 * Copyright (c) 2014.
 * 北京云腾致用科技有限公司
 */
package com.material.website.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonFactory;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**  
 * @Description: json转换工具类(功能描述) 
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月4日 上午12:37:23  
 */
public class JsonUtil {
	private JsonFactory jf = new JsonFactory();
	private static JsonUtil ju;
	private static ObjectMapper mapper;
	private JsonUtil(){}
	
	public static JsonUtil newInstance() {
		if(ju==null) ju = new JsonUtil();
		return ju;
	}
	
	private ObjectMapper getMapper() {
		if(mapper==null) {
			mapper = new ObjectMapper();
		}
		return mapper;
	}
	
	public String obj2json(Object obj) {
		JsonGenerator jg = null;
		try {
			mapper = getMapper();
			StringWriter out = new StringWriter();
			jg = jf.createGenerator(out);
			mapper.writeValue(jg, obj);
			return out.toString();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(jg!=null) jg.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public Object json2obj(String json,Class<?> clz) {
		try {
			mapper = getMapper();
			return mapper.readValue(json,clz);
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @param response
	 * @param fos
	 */
	public void writeJson(HttpServletResponse response, Object obj) {
		response.setContentType("application/json;charset=UTF-8");
        response.setHeader("Cache-Control", "no-store, max-age=0, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        try {
            PrintWriter out = response.getWriter();
            out.write(obj2json(obj));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
	
	/**
	 * @param response
	 * @param fos
	 */
	public void writeTextJson(HttpServletResponse response, Object obj) {
		response.setContentType("text/html;charset=UTF-8");
        response.setHeader("Cache-Control", "no-store, max-age=0, no-cache, must-revalidate");
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");
        response.setHeader("Pragma", "no-cache");
        try {
            PrintWriter out = response.getWriter();
            out.write(obj2json(obj));
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
	}
}
