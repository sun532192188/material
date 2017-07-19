<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/include/commons.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>商品修改</title>
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
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>      
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
			  querySupplier("supplierId","${ctx}/supplier/queryAllSuppler");
			  var supplierId = "${goods.supplierId}";
			  function selectSupplier(){
				  $("#supplierId").val(supplierId);
			  }
			  if(supplierId != null && supplierId != "" && supplierId != undefined){
				  setTimeout(selectSupplier,50);
			  }
			  
			 $("#goodsForm").cmsvalidate({
				  rules:{
					  goodsName:"required",
					  goodsNo:"required",
					  price:{
						  required:true,
						  number:true 
					  },
					  specModel:"required",
					  isDecimal:"required",
					       spec:"required",
			        categoryOne:"required",
					categoryTwo:"required",
					 supplierId:"required",
					  goodsType:"required"
				  },
				  messages:{
					  goodsName:"商品名称不能为空",
					  goodsNo:"商品编号不能为空",
					  price:{
						  required:"价格不能为空",
						  number:"价格必须为数字" 
					  },
					  specModel:"规格参数不能为空",
					  isDecimal:"请选择规格参数选项",
					       spec:"单位不能为空",
			        categoryOne:"请选择一级分类",
					categoryTwo:"请选择二级分类",
					 supplierId:"请选择供应商",
					  goodsType:"请选择商品类型"
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
	 
	 //查询二级分类
	 function queryCategoryTwo(){
		 var categoryOneText = $("#categoryOne option:selected").text();
		 if(categoryOneText =='--请选择--'){
			 operaAlert("warning","警告提示","请选择一级分类");
			 return;
		 }
		 var categoryOneVal = $("#categoryOne option:selected").val();
		 $.ajax({
			 type:"POST",
			 url:"${ctx}/goods/queryCategoryByParentId",
			 data:{"parentId":categoryOneVal},
			 success:function(result){
				 if(result.status != 200){
					 operaAlert("warning","警告提示","查询失败"); 
					 return;
				 }
				 $("#categoryTwo").html("");
				 var resultHtml = "<option value=''>--请选择--</option>";
				 var resultList = result.resultList;
				 $.each(resultList,function(i,obj){
					 resultHtml += "<option value='"+obj.id+"'>"+obj.name+"</option>";
				 });
				 $("#categoryTwo").append(resultHtml);
			 },
			 error:function(result){
				 operaAlert("danger","错误提示","查询失败");
				 return;
			 }
		 });
	 }
	 //   data:{"parentId":categoryOneVal}
	 
</script>
</head>
<body style="height:100%;overflow-X:hidden;">
    <div class="formbody" style="height:100%;overflow: scroll;overflow-x:hidden;">
	 <div class="formtitle"><span>基本信息</span><b style="color: red;padding-left: 450px" id="errorInfo">${errorInfo}</b></div>
	  <form method="post" action="${ctx}/goods/updateGoods" id="goodsForm">
	        <input name="id" type="hidden"  value="${goods.id}"/>
	    	<div>
			    <ul class="forminfo" style="float: left;">
			        <li style="margin-top: 30px">
				       <input type="hidden" name="categoryOne"  value="${goods.categoryOne}" />
				      <label><b>*</b>一级分类</label><input style="background:#F0F0F0"  type="text" class="dfinput" value="${goods.categoryOneName}" readonly="readonly"/>
				   </li>
	   			    <li style="margin-top: 30px">
	   			      <input type="hidden" name="categoryTwo"  value="${goods.categoryTwo}" />
				      <label><b>*</b>二级分类</label><input style="background:#F0F0F0"  type="text" class="dfinput"  value="${goods.categoryTwoName}"  readonly="readonly"/>
				     </li>
	   			    <li><label><b>*</b>所属供应商</label>
	   			        <select id="supplierId"  name="supplierId" class="dfinput">
	   			             <%--  <c:forEach items="${supplierList}" var="supplier">
	   			                 <option value="${supplier.id}">${supplier.shortName}</option>
	   			             </c:forEach> --%>
	   			        </select>
	   			    </li>
				    <li style="margin-top: 30px">
				      <label><b>*</b>商品名称</label><input name="goodsName" type="text" class="dfinput" value="${goods.goodsName}"/>
				   </li>
				   <li style="margin-top: 30px">
				      <label><b>*</b>编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label><input style="background:#F0F0F0" name="goodsNo" type="text" class="dfinput" value="${goods.goodsNo}" readonly="readonly"/>
				   </li>
				   <li style="margin-top: 30px">
				      <label><b>*</b>单价</label><input id="price" name="price" type="text" class="dfinput"  onkeyup="value=value.replace(/[^\d.]/g,'')" value="${goods.price}"/>
				   </li>
				   <li style="margin-top: 30px">
				      <label><b>*</b>规格型号</label><input id="specModel" name="specModel" type="text" class="dfinput" value="${goods.specModel}"/>
				   </li>
				   <li><label><b>*</b>规格为小数</label>
			  			<cite>
				  			 <c:if test="${goods.isDecimal eq 0}">
				  			    <input name="isDecimal" type="radio" value="1" />&nbsp;&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
				  				<input name="isDecimal" type="radio" value="0" checked="checked" />&nbsp;&nbsp;否
				  			</c:if>
				  			 <c:if test="${goods.isDecimal eq 1}">
				  			    <input name="isDecimal" type="radio" value="1" checked="checked"/>&nbsp;&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
				  				<input name="isDecimal" type="radio" value="0"  />&nbsp;&nbsp;否
				  			</c:if>
			  			</cite>
	  			   </li>
				   <li style="margin-top: 30px">
				      <label><b>*</b>单位</label><input id="spec" name="spec" type="text" class="dfinput" value="${goods.spec}"/>
				   </li>
	   			    <li><label><b>*</b>商品类型</label>
			  			<cite>
			  			   <c:if test="${goods.goodsType eq 1}">
			  			    	<input name="goodsType" type="radio" value="1" checked="checked" />&nbsp;&nbsp;物资&nbsp;&nbsp;&nbsp;&nbsp;
			  				    <input name="goodsType" type="radio" value="2" />&nbsp;&nbsp;固定资产
			  			   </c:if>
			  			   <c:if test="${goods.goodsType eq 2}">
			  			    	<input name="goodsType" type="radio" value="1"  />&nbsp;&nbsp;物资&nbsp;&nbsp;&nbsp;&nbsp;
			  				    <input name="goodsType" type="radio" value="2" checked="checked"/>&nbsp;&nbsp;固定资产
			  			   </c:if>
			  			</cite>
	  			   </li>
				   <li><label>&nbsp;
				      </label><input type="submit"  class="btn2" value="修改商品"/>
				   </li>
			     </ul>
           </div>
   		</form>
    </div>
</body>
</html>