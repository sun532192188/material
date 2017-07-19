<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>库存列表</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/formui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/chur.css" />
<style type="text/css">
tr.check {
	cursor: pointer;
}

.checked {
	background: #bbb;
}

.courseinput {
	width: 150px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
}
</style>
<script src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.plugins.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.cp.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript">
	$(function() {
		var msg = "${msg}";
		var type = "{type}";
		var title = "${title}";
		if ($.trim(msg) != '' && $.trim(type) != '' && $.trim(title) != '') {
			operaAlert(type, title, errorInfo);
		}
		var categoryOne = "${stockArgs.categoryOne}";
		if (categoryOne != null && categoryOne != ""
				&& categoryOne != undefined) {
			$("#categoryOne").val(categoryOne);
		}
		var categoryTwo = "${stockArgs.categoryTwo}";
		function setTwoCategory() {
			$("#categoryTwo").val(categoryTwo);
		}
		if (categoryTwo != null && categoryTwo != ""
				&& categoryTwo != undefined) {
			queryCategoryTwo('categoryOne', 'categoryTwo');
			setTimeout(setTwoCategory, 50);
		}
	});

	//添加初始化
	function addInit(url) {
		$("#FunctionContent").prop("src", url);
	}

	//检索商品信息
	function loadStock(url) {
		var goodsName = $("#goodsName").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		var stockType = $("#stockType option:selected").val();
		location.href = url + "?goodsName=" + goodsName + "&categoryOne="
				+ categoryOne + "&categoryTwo=" + categoryTwo + "&type="
				+ stockType;
	}

	//更新初始化
	function updateInit(id) {
		$("#FunctionContent").prop("src",
				'${ctx}/goods/updateInit?goodsId=' + id);
	}

	//查询二级分类
	function queryCategoryTwo(sourceId, targetId) {
		var categoryOneText = $("#" + sourceId + " option:selected").text();
		if (categoryOneText == '--请选择--') {
			operaAlert("warning", "警告提示", "请选择一级分类");
			return;
		}
		var categoryOneVal = $("#" + sourceId + " option:selected").val();
		$.ajax({
			type : "POST",
			url : "${ctx}/goods/queryCategoryByParentId",
			data : {
				"parentId" : categoryOneVal
			},
			success : function(result) {
				if (result.status != 200) {
					operaAlert("warning", "警告提示", "查询失败");
					return;
				}
				$("#" + targetId).html("");
				var resultHtml = "<option value=''>--请选择--</option>";
				var resultList = result.resultList;
				$.each(resultList, function(i, obj) {
					resultHtml += "<option value='" + obj.id + "'>" + obj.name
							+ "</option>";
				});
				$("#" + targetId).append(resultHtml);
			},
			error : function(result) {
				operaAlert("danger", "错误提示", "查询失败");
				return;
			}
		});
	}

	//实现库存出库打印与导出
	function dataExport(operatType){
		var goodsName = $("#goodsName").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		var stockType = $("#stockType option:selected").val();
		var url = "${ctx}/dataOperatController/statisStockOperat?goodsName=" + goodsName + "&categoryOne="
				+ categoryOne + "&categoryTwo=" + categoryTwo + "&type="
				+ stockType+"&operatType="+operatType+"&rows="+10000000;
		if(operatType == 1){
			location.href = url;
		}else{
			 window.open(url);
		}
	}
</script>
</head>
<body>
	<div class="rightinfo">
	   <div class="queryArea">
		<table class="kucun">
	       <tr>
		        <td style="text-">
				         一级分类:&nbsp;&nbsp; 
				   <select id="categoryOne" name="categoryOne" class="courseinput" onchange="queryCategoryTwo('categoryOne','categoryTwo');">
						<option value="">全部</option>
						<c:forEach items="${categoryList}" var="category">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
					</select>
		        </td>
		        <td>
					二级分类:&nbsp;&nbsp; 
					<select id="categoryTwo" name="categoryTwo" class="courseinput" onchange="">
						<option value="">全部</option>
				    </select>
		       </td>
		        <td>
					库存状态:&nbsp;&nbsp; 
					<select id="stockType" name="stockType" style="width: 100px; height: 20px;">
						<option value="" selected="selected" <c:if test="${empty stockArgs.type}">selected</c:if>>--请选择--</option>
						<option value="1" <c:if test="${stockArgs.type eq 1}">selected</c:if>>验收</option>
						<option value="2" <c:if test="${stockArgs.type eq 2}">selected</c:if>>预存</option>
				   </select>
			   </td>
	       </tr>
	       <tr>
		        <td>
		                              商品名称:&nbsp;&nbsp; 
		           <input id="goodsName" name="goodsName" type="text" value="${stockArgs.goodsName}" class="courseinput" style="border-radius: 4px;" placeholder="商品名称" />&nbsp;&nbsp; 
		        </td>
		        <td>
		        </td>
		       <td>
		   	   </td>
	       </tr>
	    <tr>
	       <td colspan="3" style="text-align: center;">
	           <input type="button" style="text-align: center;" class="btn2" onclick="loadStock('${ctx}/stock/queryStockPage')" value="检&nbsp;&nbsp;索" />
	           &nbsp;&nbsp;
			   <input type="button" style="text-align: center;" class="btn2" onclick="dataExport('1')" value="打&nbsp;&nbsp;印" />
			   &nbsp;&nbsp;
			   <input type="button" style="text-align: center;" class="btn2" onclick="dataExport('2')" value="导&nbsp;&nbsp;出" />
	       </td>
	    </tr> 
	    </table>
      </div>
      
		<div>
			<table class="tablelist">
				<thead>
					<tr>
						<th>序号</th>
						<th>商品编码</th>
						<th>商品名称</th>
						<th>规格</th>
						<th>单位</th>
						<th>单价</th>
						<th>库存量</th>
						<th>商品类型</th>
						<th>所属供应商</th>
						<th>库存类型</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pages.rows}" var="stock" varStatus="in">
						<tr>
							<td>${in.count}</td>
							<td>${stock.goodsNo}</td>
							<td title="${stock.goodsName}" style="font-weight: bold; font-size: 14px; color: #8B4513;">${stock.goodsName}</td>
							<td>${stock.specModel}</td>
							<td>${stock.spec}</td>
							<td title="${stock.goodsPrice}">${stock.goodsPrice}</td>
							<td style="font-weight: bold; color: red; font-size: 13px;">${stock.stockNum}</td>
							<td><c:if test="${stock.goodsType eq 1}">
		        		                   物资 
		        		     </c:if> <c:if test="${stock.goodsType eq 2}">
		        		                   固定资产
		        		     </c:if></td>
							<td>${stock.supplierName}</td>
							<td><c:if test="${stock.stockType eq 1}">
		        		                     验收
		        		     </c:if> <c:if test="${stock.stockType eq 2}">
		        		                     预存
		        		     </c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<jsp:include page="/commons/pager.jsp">
			<jsp:param
				value="queryStockPage?goodsName=${stockArgs.goodsName}&type=${stockArgs.type}&categoryOne=${stockArgs.categoryOne}&categoryTwo=${stockArgs.categoryTwo}"
				name="url" />
		</jsp:include>
	</div>
</body>
</html>
