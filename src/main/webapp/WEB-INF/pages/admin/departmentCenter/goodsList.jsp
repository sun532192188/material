<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>商品列表</title>
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
	width: 50px;
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
<script type="text/javascript"
	src="${ctx}/resources/js/materialCommon.js"></script>
<script type="text/javascript">
     var operatType = "${operatType}";
	$(function() {
		var msg = "${msg}";
		var type = "{type}";
		var title = "${title}";
		if ($.trim(msg) != '' && $.trim(type) != '' && $.trim(title) != '') {
			operaAlert(type, title, errorInfo);
		}
		var stockType = "${stockType}";
		var returnPage = "";
		//1.月计划申请  2.部门出库  3.部门调拨
		var installPath = "";
		var requestUrl = "";
		if (operatType == 1) {
			requestUrl ="${ctx}/goods/queryAllGoods";
			returnPage = "departmentCenter/monthPlan/addPlan";
			installPath = "${ctx}/goods/installGoods";
		} else if (operatType == 2) {
			requestUrl ="${ctx}/goods/queryAllGoods";
			returnPage = "departmentCenter/monthPlan/plan_goods";
			installPath = "${ctx}/departmentCenter/installPlanGoods";
		}
		//查询商品信息
		queryAllGoods("goodsContent", requestUrl, "", "", installPath,returnPage, "","","");
		//分类操作
		var categoryOne = "${queryArgs.categoryOne}";
		if (categoryOne != null && categoryOne != ""
				&& categoryOne != undefined) {
			$("#categoryOne").val(categoryOne);
		}
		var categoryTwo = "${queryArgs.categoryTwo}";
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
	function loadGoods() {
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		if (operatType == 1) {
			requestUrl ="${ctx}/goods/queryAllGoods";
			returnPage = "departmentCenter/monthPlan/addPlan";
			installPath = "${ctx}/goods/installGoods";
		} else if (operatType == 2) {
			requestUrl ="${ctx}/goods/queryAllGoods";
			returnPage = "departmentCenter/monthPlan/plan_goods";
			installPath = "${ctx}/departmentCenter/installPlanGoods";
		}
		queryAllGoods("goodsContent", requestUrl, "goodsName","", installPath, returnPage, "", categoryOne,categoryTwo);
	}

	//删除商品
	function delGoods(goodsId) {
		if (goodsId == null || goodsId == "" || goodsId == undefined) {
			operaAlert("warning", "警告提示", "请选择删除商品");
			return;
		}
		$.ajax({
			type : "POST",
			data : {
				"goodsId" : goodsId
			},
			url : "${ctx}/goods/delGoods",
			success : function(result) {
				if (result == 'isNull') {
					operaAlert("warning", "警告提示", "参数为空");
					return;
				} else if (result == 'success') {
					operaAlert("success", "警告提示", "移除成功");
					$("#chur").click(function() {
						window.location.reload();
					});
				} else {
					operaAlert("danger", "警告提示", "移除失败");
					return;
				}
			},
			error : function(result) {
				operaAlert("danger", "错误提示", "删除失败");
				return;
			}
		});
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
</script>
</head>
<body style="overflow-x: hidden;">
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li>一级分类:&nbsp;&nbsp; <select id="categoryOne"
					name="categoryOne" style="width: 150px; height: 20px;"
					onchange="queryCategoryTwo('categoryOne','categoryTwo');">
						<option value="">全部</option>
						<c:forEach items="${categoryList}" var="category">
							<option value="${category.id}">${category.name}</option>
						</c:forEach>
				</select>
				</li>
				<li>二级分类:&nbsp;&nbsp; <select id="categoryTwo"
					name="categoryTwo" style="width: 150px; height: 20px;" onchange="">
						<option value="">全部</option>
				</select>
				</li>
			</ul>
			&nbsp;&nbsp; 商品名称: <input id="goodsName" name="goodsName" type="text"
				value="${queryArgs.goodsName}" class="courseinput"
				style="border-radius: 4px; width: 150px;" placeholder="商品名称" />&nbsp;&nbsp;
			<input type="button" style="text-align: center;" class="btn2"
				onclick="loadGoods();" value="检&nbsp;&nbsp;索" />
		</div>
		<div>
			<table class="tablelist" style="width:100%;" align="center">
				<thead>
					<tr>
						<th>选中</th>
						<th>序号</th>
						<th>编码</th>
						<th>商品名称</th>
						<th>规格</th>
						<th>单价</th>
						<th>数量</th>
						<th>单位</th>
					</tr>
				</thead>
				<tbody id="goodsContent">
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
