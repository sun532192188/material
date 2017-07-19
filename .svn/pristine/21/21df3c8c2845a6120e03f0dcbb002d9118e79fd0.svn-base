<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>商品添加</title>
<link href="${ctx}/resources/uploadify/uploadify.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/formui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/chur.css" />
<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.plugins.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/validate/main.css" />
<script type="text/javascript"
	src="${ctx}/resources/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/jquery.cms.validate.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.cp.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/My97DatePicker/lang/zh-cn.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/cityselect/jquery.cityselect.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-form.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

tr {
	cursor: pointer;
}

.uploadCourse {
	padding: 20px;
}

.red_input {
	color: red;
	margin-left: 5px;
}
.dfinput {
	width: 345px;
	height:20px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	background: url(../images/inputbg.gif) repeat-x;
	text-indent: 10px;
}
.forminfo {
	padding-left: 8px;
	position: absolute;
	top:13%;
}
</style>
<script type="text/javascript">
	$(function() {
		var msg = "${msg}";
		var type = "${type}";
		var title = "${title}";
		if ($.trim(msg) != '' && $.trim(type) != '' && $.trim(title) != '') {
			operaAlert(type, title, msg);
			$("#chur").click(function() {
				if (type == 'success') {
					$(".tip").fadeOut(200);
					$("body").css("overflow", "auto");
					window.parent.location.reload();
				}
			});
		}
		querySupplier("supplierId","${ctx}/supplier/queryAllSuppler");
		$("#goodsForm").cmsvalidate(
				{
					rules : {
						goodsName : "required",
						goodsNo : "required",
						price : {
							required : true,
							number : true
						},
						specModel : "required",
						isDecimal : "required",
						spec : "required",
						categoryOne : "required",
						categoryTwo : "required",
						supplierId : "required",
						goodsType : "required"
					},
					messages : {
						goodsName : "商品名称不能为空",
						goodsNo : "商品编号不能为空",
						price : {
							required : "价格不能为空",
							number : "价格必须为数字"
						},
						specModel : "规格参数不能为空",
						isDecimal : "请选择规格参数选项",
						spec : "单位不能为空",
						categoryOne : "请选择一级分类",
						categoryTwo : "请选择二级分类",
						supplierId : "请选择供应商",
						goodsType : "请选择商品类型"
					},
					errorClass : "red_input",
					errorPlacement : function(errorElement, element) {
						element.parent().append(
								"<div class='valid_error'></div>");
						element.parent().find("div.valid_error").css(
								"padding-left", "94px").html(errorElement);
					}
				});
		
		$("#categoryTwo").change(function(){
			var categoryTwoId = $("#categoryTwo option:selected").val();
			  if(categoryTwoId != null && categoryTwoId != "" && categoryTwoId != undefined){
				 $.ajax({
					type:"POST",
					url:"${ctx}/goods/createGoodsNo",
					data:{"categoryTwo":categoryTwoId},
					success:function(result){
						$("#goodsNo").val(result);
					},
					error:function(result){
						operaAlert("warning", "警告提示","获取商品编号失败");
						return;
					}
				}); 
			}  
		});
	});
	
</script>
</head>
<body style="height: 100%; overflow-X: hidden;">
	<div class="formbody"
		style="height: 100%; overflow: scroll; overflow-x: hidden;">
		<div class="formtitle">
			<span>基本信息</span><b style="color: red; padding-left: 450px"
				id="errorInfo">${errorInfo}</b>
		</div>
		<form method="post" action="${ctx}/goods/addGoods" id="goodsForm">
			<div>
				<ul class="forminfo" style="float: left;">
				   <li><label><b>*</b>一级分类</label> <select id="categoryOne"
						name="categoryOne" class="dfinput"
						onchange="queryCategoryTwo('categoryOne','categoryTwo');">
							<option value="">--请选择--</option>
							<c:forEach items="${categoryList}" var="category">
								<option value="${category.id}">${category.name}</option>
							</c:forEach>
					</select></li>
					<li><label><b>*</b>二级分类</label> <select id="categoryTwo"
						name="categoryTwo" class="dfinput">
							<option value="">--请选择--</option>
					</select></li>
					<li><label><b>*</b>供&nbsp;&nbsp;应&nbsp;&nbsp;商</label> <select id="supplierId"
						name="supplierId" class="dfinput">
							<%--  <c:forEach items="${supplierList}" var="supplier">
	   			                <option value="${supplier.id}">${supplier.shortName}</option>
	   			             </c:forEach> --%>
					</select></li>
					<li><label><b>*</b>商品类型</label> <cite style="color: red";> <input
							name="goodsType" type="radio" value="1" checked="checked" />&nbsp;&nbsp;物资&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="goodsType" type="radio" value="2"/>&nbsp;&nbsp;固定资产
					</cite></li>
					<li><label><b>*</b>编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label><input id="goodsNo"
						name="goodsNo" type="text" class="dfinput" readonly="readonly" style="background:#E0E0E0;"/></li>
					<li><label><b>*</b>商品名称</label><input
						name="goodsName" type="text" class="dfinput" /></li>
				   <li><label><b>*</b>规格型号</label><input
						id="specModel" name="specModel" type="text" class="dfinput" /></li>
				    <li><label><b>*</b>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</label><input
						id="spec" name="spec" type="text" class="dfinput" /></li>
					<li><label><b>*</b>单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</label><input
						id="price" name="price" type="text" class="dfinput"
						onkeyup="value=value.replace(/[^\d.]/g,'')" /></li>
					<li><label><b>*</b>数量为小数</label> <cite style="color:red;"> <input
							name="isDecimal" type="radio" value="1" />&nbsp;&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
							<input name="isDecimal" type="radio" value="0"  checked="checked"/>&nbsp;&nbsp;否
					</cite></li>
					<li><label>&nbsp; </label><input type="submit" class="btn2"
						value="添加商品" /></li>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>