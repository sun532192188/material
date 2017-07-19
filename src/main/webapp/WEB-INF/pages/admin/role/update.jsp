<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/include/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>角色修改</title>
<link href="${ctx}/resources/uploadify/uploadify.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/chuchur/css/formui.css" />
 <link rel="stylesheet" type="text/css" href="${ctx}/resources/chuchur/css/chur.css" /> 
<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/org.zh.plugins.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/validate/main.css"/>
<script type="text/javascript" src="${ctx}/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery.cms.validate.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/org.cp.common.js"></script>  
<script type="text/javascript" src="${ctx}/resources/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/resources/My97DatePicker/lang/zh-cn.js"></script>
<script type="text/javascript" src="${ctx}/resources/cityselect/jquery.cityselect.js"></script>
<script type="text/javascript" src="${ctx}/resources/chuchur/js/churCommon.js"></script> 
<script type="text/javascript" src="${ctx}/resources/js/jquery-form.js"></script>  
<script type="text/javascript" src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>        
<script type="text/javascript" src="${ctx}/resources/chuchur/js/churCommon.js"></script>     
<style type="text/css">
	* {
		padding:0px;
		margin:0px;
	}
	tr {
		cursor: pointer;
	}
	.uploadCourse{
	    padding: 20px;
	   
	}
	  .red_input{
       color: red;
       margin-left:5px;
   }
   
    .textinput {
	  border-top: solid 1px #a7b5bc;
	  border-left: solid 1px #a7b5bc;
	  border-right: solid 1px #ced9df;
	  border-bottom: solid 1px #ced9df;
	  background: url(../images/inputbg.gif) repeat-x;
	  padding: 10px;
	  width: 420px;
	  height:130px; 
	  line-height: 20px;
	  overflow: auto;
  }
  
  .jiao li{
    list-style:none;
    display:inline-block;
    width:103px;
    height:30px;
    line-heliht:30px;
   /*  border:1px  solid  red; */
    margin-left:17px;
  }
</style>
<script type="text/javascript">
	 $(function(){
			 var msg="${msg}";
			 var type="${type}";
			 var title = "${title}";
			 if($.trim(msg)!=''&& $.trim(type)!='' && $.trim(title)!=''){
				 operaAlert(type,title,msg);
				 $("#chur").click(function(){
					 if(type == 'success'){
						 $(".tip").fadeOut(200);
				  		 $("body").css("overflow","auto"); 
				  		 var updateRoleId = "${updateRoleId}";
				  		 window.parent.loadInit(updateRoleId);
				  		 window.parent.parent.getRole(0);
					 }
				 });
			 }
		  $("#roleForm").cmsvalidate({
			  rules:{
				  roleName:"required",
			  },
			  messages:{
				  roleName:"角色名称不能为空",
			  },
			  errorClass:"red_input",
			  errorPlacement:function(errorElement, element){
				  element.parent().append("<div class='valid_error'></div>");
				  element.parent().find("div.valid_error").css("padding-left","94px").html(errorElement);
			  }
		  });
		  
		  var parentId = "${parentId}";
		  var parentName = "${parentName}";
		  $("#parentId").val(parentId);
		  $("#parentName").val(parentName);
		  var roleId = "${role.id}";
		  function queryRoleFunctionByRoleId(){
			  $.ajax({
				  type:"POST",
				  url:"${ctx}/role/queryRoleFunctionByRoleId",
				  data:{"roleId":roleId},
				  success:function(data){
					  var roleFunctionList = data;
					  var checkedStr = document.getElementsByName("functions"); 
					   $.each(roleFunctionList,function(i,obj){
						  for(var i = 0;i<checkedStr.length;i++){
							var value = checkedStr[i].value
						    if(value == obj.functionId){ 
							  checkedStr[i].checked=true;
						    } 
						  }
					  }); 
				  }
			  });
		  }
		  queryRoleFunctionByRoleId();
	   });
	 
	 
	 //检测角色名称是否存在
	 function checkRoleName(){
	    var roleName = $("#roleName").val();
	    var reRoleName = "${role.roleName}";
	    if(roleName != reRoleName){
	    	 if(roleName != null && roleName != "" && roleName != undefined ){
	 			$.ajax({
	 				type:"POST",
	 				url:"${ctx}/role/checkRoleExit",
	 				data:{"roleName":roleName},
	 				success:function(result){
	 					if(result == "isExit"){
	 					   $("#errorInfo").text("该角色名称已存在");
	 					   $("#roleName").val("");
	 					   return;
	 					}
	 				},
	 				error:function(result){
	 				   operaAlert("warning","警告提示","检测失败");	
	 				}
	 			}); 
	 		 } 
	    }
	 }
	 
	 function sunbmitForm(){
		 var num = 0;
		 $('input[name="functions"]:checked').each(function() {
				num++;
		 });
		 if(num == 0){
			 operaAlert("warning","警告提示","请选择权限功能");	
		 }else{
			 $("#roleForm").prop("action","${ctx}/role/updateRole");
		 }
	 }
</script>
</head>
<body style="height:100%;overflow-X:hidden;">
    <div class="formbody" style="height:100%;overflow: scroll;overflow-x:hidden;">
	 <div class="formtitle"><span>基本信息</span><b style="color: red;padding-left: 240px" id="errorInfo"></b></div>
	  <form method="post" action="" id="roleForm">
	        <input type="hidden" name="id" value="${role.id}">
	    	<div>
			    <ul class="forminfo" style="float: left;">
			      <li style="margin-top: 30px">
				       <label><b>*</b>角色名称</label><input id="roleName" name="roleName"  type="text" class="dfinput" value="${role.roleName}" onblur="checkRoleName();"/>
				   </li>
				    <li style="margin-top: 30px">
				      <label><b>*</b>权限分配</label> 
				      <div class="textinput">
				         <ul class="jiao">
				         <c:forEach items="${functionList}" var="roleFunction">
				              <li> <input type="checkbox" name="functions" value="${roleFunction.id}">&nbsp;&nbsp;${roleFunction.functionName}</li>
				         </c:forEach>
				         </ul>
				      </div>
				      <b style="color: red;" id="functionsError"></b>
				   </li>
				   <li><label>&nbsp;
				    </label><input type="submit"  class="btn2" value="添加角色" onclick="sunbmitForm();"/>
				   </li>
			     </ul>
           </div>
   		</form>
    </div>
</body>
</html>