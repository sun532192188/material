package com.material.website.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.material.website.entity.Admin;
import com.material.website.system.Auth;
import com.material.website.system.ManagerType;

public class ManagerAuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	    HttpSession session = request.getSession();
	    String ctx = request.getContextPath();
		if(session == null){  
        	response.sendRedirect(ctx + "/");  
        	return false;
        }

		HandlerMethod hm = (HandlerMethod)handler;
		Admin loginManager = (Admin) session.getAttribute("loginManager");
		if(loginManager==null) {
			request.getSession().setAttribute("lastURL", request.getRequestURL().toString());
			response.sendRedirect(ctx+"/guest/login");
			return false;
		} else {
			Class<?> targetClass = hm.getBean().getClass();
//			Method targetMethod = hm.getMethod();
			Boolean isAdmin = (Boolean)session.getAttribute("admin");
			if((isAdmin == null || !isAdmin)) {
				if(!targetClass.isAnnotationPresent(Auth.class)) {
					response.sendRedirect(ctx+"/admin/index");
					return false;
				}
				Auth ahs = targetClass.getAnnotation(Auth.class);
				ManagerType[] values = ahs.value();
				boolean hasAuth = false;
				for(ManagerType mt:values) {
					if(mt.ordinal() == ManagerType.EVERYONE.ordinal() || mt.getId() == loginManager.getRoleId()) {
						hasAuth = true;
						break;
					}
				}
				if(!hasAuth) {
					response.sendRedirect(ctx+"/admin/index");
					return false;
				}
			}
		}
		return super.preHandle(request, response, handler);
	}
}
