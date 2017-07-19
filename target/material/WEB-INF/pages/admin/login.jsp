<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>物资调拨系统登录</title>
	<script language="JavaScript" src="${ctx}/resources/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/validate/main.css"/>
    <script type="text/javascript" src="${ctx}/resources/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${ctx}/resources/js/jquery.cms.validate.js"></script>
 <style type="text/css">
   .red_input{
       color: red;
       margin-left:5px;
   }
   html,body{
       margin:0px; 
       height:100%; 
   }
   
   .login_back{
        background-image: url('${ctx}/resources/platform/images/login_background.jpg');
        background-repeat:no-repeat; 
        background-position:center top;
        overflow:hidden;
        background-size:100% 100%; 
   }
   .system_name{
       width: 80%;
       height: 20%;
       position: absolute;
       top:17%;
       left:10%;
       font-size:95px;
       color:#FFFFFF;
       font-family:STKaiti;
       text-align: center;
       text-shadow:#FFFFFF 2px 2px 2px;
   }
   .loginbox{
     position: absolute;
     top:42%;
     right:11%;
   }
    .loginbox ul li{
      line-height: 40px;
      list-style: none;
      font-family: STSong;
      font-weight: bold;
   } 
    .loginbox ul li input{
     border-radius:5px;
     width: 200px;
     height:23px;
   } 
   .loginbtn {
	 font-weight: bold;
	 color: #fff;
	 cursor: pointer;
	 background:#4682B4;
}

  .banquan{
     position:absolute;
     bottom: 1%;
     right:1%;
     font-size: 20px;
     color:#FFFFFF;
     font-family:STFangsong;
     text-shadow:#696969 2px 2px 2px;
  }
 </style>
<script language="javascript">
	$(function(){
		/*  $("#userForm").cmsvalidate({errorElement:"b",errorClass:"red_input"});  */
	   /*  $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
		$(window).resize(function(){  
	      $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2}); 
	  });*/
	function replaceValidcode() {
		document.getElementById("changeImg").src = "${ctx}/login/validcode?r="+Math.random();
	}
});
</script> 

</head>
<!-- background-color:#1c77ac;background-image:url(${ctx}/resources/platform/images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden; -->

<body  class="login_back">
       <div class="system_name">${systemName}</div>
       <div class="loginbox">
       <form id="userForm" method="post">
	    <ul>
		    <li style="margin-left: 27%;"><label style="color:red;">${errors}</label></li>
		    <li><span>用户名：</span><input type="text" name="username" /></li>
		    <li><span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" name="password"  onclick="JavaScript:this.value=''"  /></li> 
		    <li style="line-height: 60px;margin-left: 27%;">
		       <input type="submit"  value="登&nbsp;&nbsp;录" class="loginbtn"  style=" width:55px;height:23px;" onclick="JavaScript:this.value=''"/>
		    </li>
	    </ul>
   	</form>
   </div>
   <div style="position: absolute;bottom: 2%;width: 100%;text-align: center;">
      <a href="${ctx}/dataOperatController/downloadBrowser" style="color: #EA7500;cursor: pointer;font-size: 15px;font-weight: bold;text-decoration: none;">推荐使用谷歌浏览器</a>
    </div> 
   <div class="banquan">版权所有:怀来县万联电子科技有限公司</div>
</body>
</html>
