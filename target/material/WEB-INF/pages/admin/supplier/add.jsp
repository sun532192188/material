<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/include/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>供应商添加</title>
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
					 }
				 });
			 }
		  $("#supplierForm").cmsvalidate({
			  rules:{
				  shortName:"required",
				  fullName:"required",
				  linkman:"required",
				  phone:{
					 required:true,
					/*  valiPone:true */
				  },
				  address:"required",
				  bank:"required",
				  cardholder:"required",
				  bankCard:{
					  required:true,
					 /*  valiBankcard:true */
				  },
				  bankAddr:"required"
			  },
			  messages:{
				  shortName:"简称不能为空",
				  fullName:"全称不能为空",
				  linkman:"联系人不能为空",
				  phone:{
					 required:"电话不能为空",
					/*  valiPone:"电话格式不正确" */
				   },
				  address:"地址不能为空",
				  bank:"开户行不能为空",
				  cardholder:"持卡人不能为空",
				  bankCard:{
					  required:"银行卡号不能为空",
					 /*  valiBankcard:"银行卡格式不正确" */
				  },
				  bankAddr:"开户行地址不能为空"
			  },
			  errorClass:"red_input",
			  errorPlacement:function(errorElement, element){
				  element.parent().append("<div class='valid_error'></div>");
				  element.parent().find("div.valid_error").css("padding-left","94px").html(errorElement);
			  }
		});
	   });
	 
	 //自定义 验证
	 $.validator.addMethod("valiPone",function(value, element, param){
		 var phone=$("#phone").val();
		  if(!(/^1[3|4|5|7|8][0-9]\d{4,8}$/.test(phone))){ 
			  return false;
		  }
		  return true;
	 });
	
     $.validator.addMethod("valiBankcard",function(value, element, param){
    	 var bankCard = $("#bankCard").val();
     	  if(!/^\d{16}|\d{19}$/.test(bankCard)){
   		    return false;
   	      }
     	  return true;
	 });
</script>
</head>
<body style="height:100%;overflow-X:hidden;">
    <div class="formbody" style="height:100%;overflow: scroll;">
	 <div class="formtitle"><span>基本信息</span><b style="color: red;padding-left: 450px" id="errorInfo">${errorInfo}</b></div>
	  <form method="post" action="${ctx}/supplier/addSupplier" id="supplierForm">
	    	<div>
			    <ul class="forminfo" style="float: left;">
				    <li style="margin-top: 30px">
				      <label><b>*</b>简&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label><input name="shortName" type="text" class="dfinput" />
				   </li>
				   <li style="margin-top: 30px">
				      <label><b>*</b>全&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label><input name="fullName" type="text" class="dfinput" />
				   </li>
				    <li style="margin-top: 30px">
				      <label><b>*</b>联&nbsp;&nbsp;系&nbsp;&nbsp;人</label><input name="linkman" type="text" class="dfinput" />
				   </li>
	   			   <li>
	   			      <label><b>*</b>联系电话</label><input name="phone" id="phone" type="text" class="dfinput"  onkeyup="value=value.replace(/[^\d]/g,'')">
	   			    </li>
	   			    <li style="margin-top: 30px">
				      <label><b>*</b>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</label><input name="address" type="text" class="dfinput" />
				   </li>
	   			    <li><label><b>*</b>开&nbsp;&nbsp;户&nbsp;&nbsp;行</label>
	   			        <input name="bank" type="bank" class="dfinput" />
	   			    </li>
	   			    <li style="margin-top: 30px">
				      <label><b>*</b>账户全称</label><input name="cardholder" type="text" class="dfinput" />
				   </li>
				    <li style="margin-top: 30px">
				      <label><b>*</b>帐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</label><input  id="bankCard" name="bankCard" type="text" class="dfinput" onkeyup="value=value.replace(/[^\d]/g,'')"/>
				   </li>
				    <li style="margin-top: 30px">
				      <label><b>*</b>银行所在地</label><input name="bankAddr" type="text" class="dfinput" />
				   </li>
				   <li><label>&nbsp;
				    </label><input type="submit"  class="btn2" value="添加供应商"/>
				   </li>
			     </ul>
           </div>
   		</form>
    </div>
</body>
</html>