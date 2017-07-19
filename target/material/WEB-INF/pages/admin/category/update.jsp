<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/include/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>类目修改</title>
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
 .courseinput {
	width: 260px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
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
				  		 window.parent.location.reload();
				  		 window.parent.parent.getCategory(0);
					 }else{
						  var parentId = "${categoryArgs.parentId}";
						  var parentName = "${categoryArgs.parentName}";
						  var categoryName = "${categoryArgs.categoryName}";
						  var categoryNo = "${categoryArgs.categoryNo}";
						  $("#parentId").val(parentId);
						  $("#parentName").val(parentName);
						  $("#categoryName").val(categoryName);
						  $("#categoryNo").val(categoryNo);
					 }
				 });
			 }
		  $("#categoryForm").cmsvalidate({
			  rules:{
				  parentId:"required",
				  categoryName:"required",
				  categoryNo:{
					  required:true,
					  valiCatregoryNo:true
				  }
			  },
			  messages:{
				  parentId:"父级分类不能为空",
				  categoryName:"分类名称不能为空",
				  categoryNo:{
					  required:"分类编号不能为空",
					  valiCatregoryNo:"分类编号格式不正确"
				  }
			  },
			  errorClass:"red_input",
			  errorPlacement:function(errorElement, element){
				  element.parent().append("<div class='valid_error'></div>");
				  element.parent().find("div.valid_error").css("padding-left","94px").html(errorElement);
			  }
		  });
	   });
	 
	//自定义 验证
	 $.validator.addMethod("valiCatregoryNo",function(value, element, param){
		 var categoryNo=$("#categoryNo").val();
		 var parentName = $("#parentName").val();
		 if(parentName == '类目树'){
			 if(categoryNo.length != 2){ 
				  return false;
			  }
		 }
		  return true;
	 });
</script>
</head>
<body style="height:100%;overflow-X:hidden;">
    <div class="formbody" style="height:100%;overflow: scroll;overflow-x:hidden;">
	 <div class="formtitle"><span>基本信息</span><b style="color: red;padding-left: 450px" id="errorInfo">${errorInfo}</b></div>
	  <form method="post" action="${ctx}/category/updateCategory" id="categoryForm">
	        <input type="hidden" name="id" value="${category.id}">
	    	<div>
			    <ul class="forminfo" style="float: left;">
			      <li style="margin-top: 30px">
				       <label><b>*</b>父级分类</label><input id="parentName" name="parentName"  type="text" class="courseinput" value="${parentName}" readonly="readonly" style="background:#F5F5F5;"/>
				       <input  type="hidden" id="parentId" name="parentId" class="dfinput" value="${category.parentId}"/>
				   </li>
				   <li style="margin-top: 30px">
				      <label><b>*</b>分类名称</label><input id="categoryName" name="categoryName" type="text" class="courseinput" value="${category.categoryName}"/>
				   </li>
				   <li style="margin-top: 30px">
				      <c:if test="${parentName eq '类目树'}">
				        <label><b>*</b>分类编号</label><input id="categoryNo" name="categoryNo" type="text" class="courseinput" value="${category.categoryNo}"/>
				      </c:if>
				       <c:if test="${parentName ne '类目树'}">
				           <label><b>*</b>分类编号</label><input id="categoryNo" name="categoryNo" type="text" class="courseinput" value="${category.categoryNo}" readonly="readonly"/>
				      </c:if>
				   </li>
				   <li><label>&nbsp;
				    </label><input type="submit"  class="btn2" value="修改类目"/>
				   </li>
			     </ul>
           </div>
   		</form>
    </div>
</body>
</html>