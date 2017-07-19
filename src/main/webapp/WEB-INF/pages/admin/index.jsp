<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>物资调拨管理系统</title>
<script language="JavaScript" src="${ctx}/resources/js/jquery.min.js"></script>
</head>
<script type="text/javascript">
	 $(function(){
		var parentId = "${parentId}";
		var parentFunctionName = "${parentFunctionName}";
		$("#leftFrame").attr("src","left?parentId="+parentId+"&parentFunctionName="+parentFunctionName);
	}); 
</script>
<html>
 
  <!-- 因为上一个页面已经加载了top顶部 所以此处不需要再次加载 -->
  <!-- <frame src="top" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" /> -->
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="main" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset> 
</html>