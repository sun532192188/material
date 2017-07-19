package com.material.website.web;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.material.website.system.SystemContext;

/**
 * @Description: 通用的系统拦截器/用来配置系统变量
 * @author 张明虎 zhangminghu@yuntengzhiyong.com
 * @date 2014年12月4日 上午12:37:23
 */
public class SystemFilter implements Filter {
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			HttpSession session = req.getSession();
			SystemContext.setServletContext(session.getServletContext());
			SystemContext.setRequest(req);
			SystemContext.setResponse(res);
			String page = req.getParameter("page");
			if(StringUtils.isBlank(page)) page = "1";
			String rows = req.getParameter("rows");
			if(StringUtils.isBlank(rows)) rows = "10";
			String sort = req.getParameter("sort");
			String order = req.getParameter("order");
			if(StringUtils.isBlank(sort)) sort = "id";
			if(StringUtils.isBlank(order)) order = "desc";
			
			int currentPage = Integer.parseInt(page); 
			int pageSize = Integer.parseInt(rows);
			SystemContext.setPageOffset((currentPage-1)*pageSize);
			SystemContext.setPageSize(pageSize);
			SystemContext.setCurrentPage(currentPage);
		} catch (Exception e) {
			SystemContext.setPageOffset(0);
			SystemContext.setPageSize(10);
			SystemContext.setCurrentPage(1);
		} finally {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void destroy() {
		
	}

}
