package com.material.website.web;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.lang.StringUtils;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.material.website.mail.MailUtil;
import com.material.website.mail.SendMailThread;
import com.material.website.system.SystemContext;
import com.material.website.util.PropertiesUtil;
import com.material.website.util.TextFilter;


/**
 *  系统初始化类 
 * @author sunxiaorong
 *
 */

@SuppressWarnings("serial")
public class SystemLoader extends HttpServlet {

	/* (non-Javadoc)
	 * @see javax.servlet.GenericServlet#init(javax.servlet.ServletConfig)
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		//配置ServletContext
		SystemContext.setServletContext(config.getServletContext());
		
		//配置spring工厂
		SystemContext.setApplication(WebApplicationContextUtils.getWebApplicationContext(config.getServletContext()));
		
		//设置静态附件保存地址
		String statis = PropertiesUtil.newInstance().loadValue("static.path","system.properties");
		String imgHost = PropertiesUtil.newInstance().loadValue("img.host","cloud-se.properties");
		if(StringUtils.isBlank(statis)) {
			statis = "/upload";
		}
		if(StringUtils.isBlank(imgHost)) {
			imgHost = "http://localhost";
		}
		config.getServletContext().setAttribute("SystemUploadPath",imgHost);
		SystemContext.setSaveStaticPath(config.getServletContext().getRealPath(statis));
		
		//设置动态文件保存地址
		String dynamic = PropertiesUtil.newInstance().loadValue("dynamic.path","system.properties");
		if(StringUtils.isBlank(dynamic)) {
			dynamic = System.getProperty("user.home")+"/temp";
		}
		SystemContext.setSaveDynamicPath(dynamic);
		
		//初始化邮箱发送
		MailUtil.getInstance().init((JavaMailSender)SystemContext.getApplication().getBean("mailSender"));
		Thread mailThread = new Thread(new SendMailThread());
		mailThread.start();
		
		//初始化过滤器
		TextFilter.newInstance().init();
	}
}
