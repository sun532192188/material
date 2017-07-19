<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>顶部栏</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	});
});

/* //第二种方式 
document.cookie = "operation=reload";
function getCookie(cookie_name){
   var allcookies = document.cookie;
   var cookie_pos = allcookies.indexOf(cookie_name);   //索引的长度
 
   // 如果找到了索引，就代表cookie存在，
   // 反之，就说明不存在。
   if (cookie_pos != -1) {
       // 把cookie_pos放在值的开始，只要给值加1即可。
       cookie_pos += cookie_name.length + 1;      //这里容易出问题，所以请大家参考的时候自己好好研究一下
       var cookie_end = allcookies.indexOf(";", cookie_pos);
 
       if (cookie_end == -1)
       {
           cookie_end = allcookies.length;
       }
 
       var value = unescape(allcookies.substring(cookie_pos, cookie_end));         //这里就可以得到你想要的cookie的值了。。。
   }
   return value;
}

 window.onbeforeunload  = function(){
	 debugger
	 var str = getCookie("operation");
	 if(str != "reload"){
		 $.ajax({
				url:"${ctx}/guest/logout",
				success:function(data){
					
				},
				error:function(){
					
				}
			});
	 }else{
		// alert("这只是刷新页面");
	 }
	
}; */ 

   window.onbeforeunload = function(){   
    if(event.clientX>document.body.clientWidth&&event.clientY<0||event.altKey){   
        window.event.returnValue="确定要退出本页吗？";   
    }   
   };   
</script>

</head>
<%-- #4778c7; --%>
<body style="background:url(${ctx}/resources/platform/images/topbg.gif) repeat-x;">

    <div class="topleft">
    	<a href="index" target="_parent"><img src="${ctx}/resources/platform/images/dp.png" title="系统首页" style="position: absolute;top:8%;"/>
    	   <b style="font-size:25px;color: #FFFFFF;position: absolute;left:3%;top:20%;">${systemName}</b>
    	</a>
    </div>
    <div class="topright"> 
	    <ul>
		    <li><span><img src="${ctx}/resources/platform/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
		    <li><a href="#">关于</a></li>
		    <li>
			    <a href="#">${loginManager.userName}</a>
	    	</li>
	    	<li><a href="${ctx}/admin/index" target="_parent">返回</a></li>
		    <li><a href="${ctx}/guest/logout" target="_parent">退出</a></li>
	    </ul>
    </div>
</body>
</html>