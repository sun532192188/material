package com.material.website.web.interceptor;

import com.material.website.entity.Admin;

/**
 * 登录上下文，登录的用户存ThreadLocal
 * 
 * @author sunxiaorong
 * 
 */
public class LoginContext {
	private LoginContext() {
	}

	private static ThreadLocal<ContextUserDto> userThreadLocal = new ThreadLocal<ContextUserDto>();

	/**
	 * 上下文中设置用户
	 * 
	 * @param contextUserDto
	 *            登录的用户信息
	 */
	public static void set(ContextUserDto contextUserDto) {
		userThreadLocal.set(contextUserDto);
	}

	/**
	 * 上下文设置是通过拦截器实现，如果当前没有登录，并且是需要用户登录的，则自动跳转到登录
	 * 因此如果是需要登录的模块，该方法肯定有返回值，如果没有返回值，请配置请求路径为认证即可 获取登录上下文的用户
	 * 
	 * @return 用户
	 */
	public static Admin get() {
		ContextUserDto contextUserDto = userThreadLocal.get();
		if (contextUserDto != null) {
			return contextUserDto.getUser();
		}
		return null;
	}

	/**
	 * 验证用户是否登录
	 * 
	 * @return 是否登录
	 */
	public static boolean isLogin() {
		Admin user = userThreadLocal.get().getUser();
		return user != null;
	}

	/**
	 * 清除上下文
	 */
	public static void clear() {
		userThreadLocal.remove();
	}
}
