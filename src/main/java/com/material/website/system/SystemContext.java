package com.material.website.system;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;

/**
 * @Description: 系统环境变量/暂时存储分页数据系统数据等
 * @author 张明虎 zhangminghu@yuntengzhiyong.com
 * @date 2014年12月4日 上午12:37:23
 */
public class SystemContext {
	/**
	 * 分页大小
	 */
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	/**
	 * 当前页
	 */
	private static ThreadLocal<Integer> currentPage = new ThreadLocal<Integer>();
	/**
	 * 分页的起始页
	 */
	private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();
	/**
	 * 以什么列表排序
	 */
	private static ThreadLocal<String> sort = new ThreadLocal<String>();
	/**
	 * 列表的排序方式 asc / desc
	 */
	private static ThreadLocal<String> order = new ThreadLocal<String>();
	/**
	 * response 与线程绑定
	 */
	private static ThreadLocal<HttpServletResponse> response = new ThreadLocal<HttpServletResponse>();
	/**
	 * request 与线程绑定
	 */
	private static ThreadLocal<HttpServletRequest> request = new ThreadLocal<HttpServletRequest>();
	/**
	 * servletContext 
	 */
	private static ServletContext servletContext;
	/**
	 * 存储Session
	 */
	private static Map<String,HttpSession> asc = new HashMap<String,HttpSession>();
	/**
	 * 存储ApplicationContext
	 */
	private static WebApplicationContext application;
	/**
	 * 保存静态资源  比如图片
	 */
	private static String saveStaticPath = System.getProperty("user.home");
	/**
	 * 保存动态资源/需要服务器处理 比如 apk 版权文件
	 */
	private static String saveDynamicPath = System.getProperty("user.home")+"/attachment";
	
	static {
		File file = new File(saveDynamicPath);
		if(file.isFile()) file.delete();
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	
	/**
	 * @return the savePath
	 */
	public static String getSaveStaticPath() {
		return saveStaticPath;
	}
	
	/**
	 * @return the currentPage
	 */
	public static int getCurrentPage() {
		return currentPage.get();
	}

	/**
	 * @param currentPage the currentPage to set
	 */
	public static void setCurrentPage(int _currentPage) {
		currentPage.set(_currentPage);
	}

	public static void removeCurrentPage() {
		currentPage.remove();
	}

	/**
	 * @param savePath the savePath to set
	 */
	public static void setSaveStaticPath(String saveStaticPath) {
		SystemContext.saveStaticPath = saveStaticPath;
	}

	public static Integer getPageSize() {
		return pageSize.get();
	}

	public static void setPageSize(Integer _pageSize) {
		pageSize.set(_pageSize);
	}

	public static Integer getPageOffset() {
		return pageOffset.get();
	}

	public static void setPageOffset(Integer _pageOffset) {
		pageOffset.set(_pageOffset);
	}

	public static String getSort() {
		return sort.get();
	}

	public static void setSort(String _sort) {
		sort.set(_sort);
	}

	public static String getOrder() {
		return order.get();
	}

	public static void setOrder(String _order) {
		order.set(_order);
	}

	public static void removePageSize() {
		pageSize.remove();
	}

	public static void removePageOffset() {
		pageOffset.remove();
	}

	public static void removeSort() {
		sort.remove();
	}

	public static void removeOrder() {
		order.remove();
	}

	public static HttpServletResponse getResponse() {
		return response.get();
	}

	public static void setResponse(HttpServletResponse _response) {
		response.set(_response);
	}

	public static void removeResponse() {
		response.remove();
	}

	public static HttpServletRequest getRequest() {
		return request.get();
	}

	public static void setRequest(HttpServletRequest _request) {
		request.set(_request);
	}

	public static void removeRequest() {
		request.remove();
	}

	/**
	 * @return the servletContext
	 */
	public static ServletContext getServletContext() {
		return servletContext;
	}

	/**
	 * @param servletContext the servletContext to set
	 */
	public static void setServletContext(ServletContext servletContext) {
		SystemContext.servletContext = servletContext;
	}

	public static void addSession(String sessionId,HttpSession session) {
		asc.put(sessionId, session);
	}
	
	public static void removeSession(String sessionId) {
		asc.remove(sessionId);
	}
	
	/**
	 * @return the session
	 */
	public static HttpSession getSession() {
		if(request.get() != null)
			return request.get().getSession();
		return null;
	}

	/**
	 * @return the application
	 */
	public static WebApplicationContext getApplication() {
		return application;
	}

	/**
	 * @param application the application to set
	 */
	public static void setApplication(WebApplicationContext application) {
		SystemContext.application = application;
	}

	/**
	 * @return the saveDynamicPath
	 */
	public static String getSaveDynamicPath() {
		return saveDynamicPath;
	}

	/**
	 * @param saveDynamicPath the saveDynamicPath to set
	 */
	public static void setSaveDynamicPath(String path) {
		File file = new File(path);
		if(file.isFile()) file.delete();
		if(!file.exists()) {
			file.mkdirs();
		}
		SystemContext.saveDynamicPath = path;
	}
}
