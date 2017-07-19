package com.material.website.system;

/**  
 * @Description: 消息类型
 * @author 张明虎 zhangminghu@yuntengzhiyong.com  
 * @date 2015年5月25日 下午7:31:06  
 */

public class MessageCode {
	/**
	 * 用户提问的消息（标签）（type=1，nickname=用户昵称、sex=用户性别、qwId=问题对象）
	 */
	public final static Integer M1 = 1;
	/**
	 * 专家回答的消息（账号）（type=2，realname=专家姓名、rank=专家头衔、qwId=回答对象）
	 */
	public final static Integer M2 = 2;
	/**
	 * 用户追加的提问（账号）（type=3，nickname=用户昵称、sex=用户性别、qwId=追加问题对象）
	 */
	public final static Integer M3 = 3;
	/**
	 * 用户采纳了答案（账号）（type=4，nickname=用户昵称、sex=用户性别、qwId=提问的问题对象）
	 */
	public final static Integer M4 = 4;
	/**
	 * 专家认证失败（账号）（type=5，realname=专家真实姓名，msg=失败原因）
	 */
	public final static Integer M5 = 5;
	/**
	 * 专家认证成功（账号）（type=6，realname=专家真实姓名）
	 */
	public final static Integer M6 = 6;
	/**
	 * 系统消息(标签) (type=101，msg=消息内容，不跳转)
	 */
	public final static Integer S101 = 101;
	/**
	 * 系统消息(标签) (type=102，msg=消息内容，跳转到聊天室列表的消息)
	 */
	public final static Integer S102 = 102;
}
