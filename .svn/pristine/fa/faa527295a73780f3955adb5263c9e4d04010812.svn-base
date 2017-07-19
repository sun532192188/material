<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>分类列表</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/formui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/chur.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/ztree/css/zTreeStyle.css">
<style type="text/css">
tr.check {
	cursor: pointer;
}

.checked {
	background: #bbb;
}

.courseinput {
	width: 150px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
}
</style>
<script src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.plugins.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.cp.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/ztree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/myZtree.js"></script>
<script type="text/javascript">                                                                                                                                                                                        
	 $(function(){
		 var msg="${msg}";
		 var type="{type}";
		 var title = "${title}";
		 if($.trim(msg)!=''&& $.trim(type)!='' && $.trim(title)!=''){
			 operaAlert(type,title,errorInfo);
		 }
	 });
	 
    //添加初始化
	function roleAddInit(url){
		 $("#FunctionContent").prop("src",url);
	}
	function closeTip(){
		 $(".tip").hide();
		 $("body").css("overflow", "auto");
	}
	
    function roleUpdateInit(url){
    	var roleId = $("#roleId",window.parent.document).val();
    	if(roleId == 0){
    		setTimeout(closeTip,20);
    		 operaAlert("warning","操作提示","请选择修改角色");
    		return;
    	}
    	 $("#FunctionContent").prop("src",url+"?roleId="+roleId);
    }
	 
   function loadInit(roleId){
	    location.href = "${ctx}/role/queryRoleFunction?roleId="+roleId;
   }
	
	//移除角色功能
	function delRoleFunction(roleFunctionId){
		$.ajax({
		    url:"${ctx}/role/delRoleFunction",
		    type:"POST",
		    data:{"id":roleFunctionId},
		    success:function(data){
		    	if(data.status != 200){
		    		operaAlert("danger","错误提示",data.msg);
			    	return;
		    	}else{
		    		operaAlert("success","操作成功","移除成功");
		    		$("#chur").click(function(){
		    			location.reload();
		    		});
		    	}
		    },
		    error:function(data){
		    	operaAlert("danger","错误提示","移除失败");
		    	return;
		    }
		});
	}
</script>
</head>
<body>
	<div class="rightinfo">
		<div class="tools">
				<ul class="toolbar">
					<li>
					   <span><img src="${ctx}/resources/platform/images/d04.png" /></span> 
					   <a href="javascript:;" onclick="roleAddInit('${ctx}/role/addInit');" class="tclick">添加角色</a>
					</li>
					<li>
					   <span><img src="${ctx}/resources/platform/images/d05.png" /></span> 
					   <a href="javascript:;" onclick="roleUpdateInit('${ctx}/role/updateInit');" class="tclick">修改角色</a>
					</li>
				</ul>
		</div>
		<div>
			<table class="tablelist">
				<thead>
					<tr>
						<th style="width: 10%;">序号</th>
						<th style="width: 20%;">功能名称</th>
						<th style="width: 20%;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resultList}" var="role" varStatus="in">
						<tr>
							<td>${in.count}</td>
							<td title="${role.functionName}">${role.functionName}</td>
							<td>
							    <a href="javascript:void(0);" onclick="delRoleFunction(${role.id});">移除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="tip" style="width:62%;height:450px;left: 19%;">
		<div class="tiptop">
			<span>角色操作</span><a></a>
		</div>
		<div style="height: 90%;">
			<iframe height="100%" width="100%" src="" scrolling="auto"
				frameborder="0" vspale="0" marginWidth="0" marginHeight="0"
				frameSpacing="0" name="FunctionContent" id="FunctionContent">
			</iframe>
		</div>
	</div>
</html>