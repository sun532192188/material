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
<html>
   <body>
      <div style="width:50%;margin-left:25%;">
	    <!--autoplay如果出现该属性，则视频在就绪后马上播放。-->
		<!--preload  如果出现该属性，则视频在页面加载时进行加载，并预备播放。如果使用 "autoplay"，则忽略该属性。
          auto  
          metadata
          none
  		-->
		 <!--controls  	如果出现该属性，则向用户显示控件，比如播放按钮。-->
        <video width="100%" height="100%"  autoplay="autoplay"  preload="none" controls="controls">
		  <!--此处的路径如果视频跟页面在同级目录则直接写视频名称即可   如果不再可以使用../表示上一级 ../../表示上两级 以此类推  建议尽量使用绝对路径 -->
	      <source src="${ctx}/date/gqxx.mp4" />
	    </video>
	</div>
   </body>
</html>