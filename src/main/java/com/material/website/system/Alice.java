package com.material.website.system;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**  
 * @Description: 在属性上使用 获取配置的真名
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2014年12月8日 下午2:39:54  
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD})
public @interface Alice {
	public String value();
}
