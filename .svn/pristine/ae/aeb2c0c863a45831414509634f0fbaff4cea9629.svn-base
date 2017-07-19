<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>用户添加</title>
<link href="${ctx}/resources/uploadify/uploadify.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/formui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/chur.css" />
<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.plugins.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/validate/main.css" />
<script type="text/javascript"
	src="${ctx}/resources/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/jquery.cms.validate.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.cp.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/My97DatePicker/lang/zh-cn.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/cityselect/jquery.cityselect.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-form.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

tr {
	cursor: pointer;
}

.uploadCourse {
	padding: 20px;
}

.red_input {
	color: red;
	margin-left: 5px;
}
</style>
<script type="text/javascript">
	$(function() {
		var msg = "${msg}";
		var type = "${type}";
		var title = "${title}";
		if ($.trim(msg) != '' && $.trim(type) != '' && $.trim(title) != '') {
			operaAlert(type, title, msg);
			$("#chur").click(function() {
				if (type == 'success') {
					$(".tip").fadeOut(200);
					$("body").css("overflow", "auto");
					window.parent.location.reload();
				}
			});
		}
		queryAllDepart("departId","${ctx}/department/queryAllDepartment");
		queryAllRole("roleId","${ctx}/role/queryRoleTree");
		$("#userForm").cmsvalidate(
				{
					rules : {
						userName : {
							required : true
						},
						password :{
							required : true
						}, 
						rePassword:{
							required : true,
							vailRePassword:true
						},
						departId : "required",
						roleId : "required"
					},
					messages : {
						userName : "用户名不能为空",
						password :{
							required : "密码不能为空",
						},
						rePassword:{
							required : "确认密码不能为空",
							vailRePassword:"两次密码输入不正确"
						},
						departId : "所属部门不能为空",
						roleId : "所属角色不能为空"
					},
					errorClass : "red_input",
					errorPlacement : function(errorElement, element) {
						element.parent().append(
								"<div class='valid_error'></div>");
						element.parent().find("div.valid_error").css(
								"padding-left", "94px").html(errorElement);
					}
				});

	});
	
	
	//自定义 验证
	$.validator.addMethod("vailRePassword", function(value, element, param) {
		var password = $("#password").val();
		var repassword = $("#rePassword").val();
		 if(password != repassword){
		    	return false;
		  }
		return true;
	});
	
	//检测用户是否存在
	function checkUser(){
		var username = $("#userName").val();
		 if(username != "" && username != null && username != undefined){
		    	$.ajax({
		    	   type:"POST",
		    	   url:"${ctx}/user/checkUserExit",
		    	   data:{"username":username},
		    	   success:function(result){
		    		   if(result.status == 200){
		    		   }else if(result.status == 500){
		    			   $("#errorInfo").text(result.msg);
		    			   $("#userName").val("");
		    		   }
		    	   },
		    	   error:function(result){
		    		   return false;
		    	   }
		    	});
		 }
	}
</script>
</head>
<body style="height: 100%; overflow-X: hidden;">
	<div class="formbody"
		style="height: 100%; overflow: scroll; overflow-x: hidden;">
		<div class="formtitle">
			<span>基本信息</span><b style="color: red; padding-left:25%;"
				id="errorInfo">${errorInfo}</b>
		</div>
		<form method="post" action="${ctx}/user/addUser" id="userForm">
			<div>
				<ul class="forminfo" style="float: left;">
					<li style="margin-top: 30px"><label><b>*</b>用户名称</label><input
						id="userName" name="userName" type="text" class="dfinput" onblur="checkUser();"/></li>
					<li style="margin-top: 30px"><label><b>*</b>密码</label><input
						id="password" name="password" type="password" class="dfinput" /></li>
					<li style="margin-top: 30px"><label><b>*</b>确认密码</label><input
						id="rePassword" name="rePassword"   type="password" class="dfinput"/></li>
					<li><label><b>*</b>所属部门</label> <select id="departId"
						name="departId" class="dfinput">
					</select></li>
					<li><label><b>*</b>所属角色</label> <select id="roleId"
						name="roleId" class="dfinput">
					</select></li>
					<li><label>&nbsp; </label><input type="submit" class="btn2"
						value="添加用户" /></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>