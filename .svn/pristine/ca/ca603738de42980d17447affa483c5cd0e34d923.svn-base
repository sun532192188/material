<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>角色列表</title>
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/ztree/css/zTreeStyle.css">
<script src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/ztree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>    
<script type="text/javascript" src="${ctx}/resources/js/myZtree.js"></script>  	
<script type="text/javascript">
</script>
</head>
<body>
    <input type="hidden" id="roleId">
	<div id="tree" class="ztree"
		style="width: 14%; height: 100%; float: left; border: 1px solid #C0C0C0; margin-top: 6px;"></div>
	<div style="width: 84%; height: 100%; float: left;">
		<iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
		</iframe>
	</div>
	<script type="text/javascript">
		$(function() {
			getRole(0);
			$("#FunctionContent").prop("src","${ctx}/role/queryRoleFunction?roleId=0");
			var height = $(window).height();
			$("#tree").height(height)
			$("#FunctionContent").height(height)
		});
	</script>
</html>