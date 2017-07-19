<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>物资出库统计</title>
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

 .print_div{
        width: 1000px;
        height: 600px;
        /*border: 1px solid red;*/
        margin: 0 auto;
    }
 .print_div h2{
        text-align: center;
    }
 .print_div table{
        border-collapse: collapse;
        margin: auto;
    }
 .print_div tr td{
        width: 60px;
        height: 30px;
        border: 1px solid blue;
        text-align: center;
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
<script type="text/javascript" src="${ctx}/resources/My97DatePicker/WdatePicker.js"></script>   
<script type="text/javascript">
	$(function() {
		var msg = "${msg}";
		var type = "{type}";
		var title = "${title}";
		if ($.trim(msg) != '' && $.trim(type) != '' && $.trim(title) != '') {
			operaAlert(type, title, errorInfo);
		}
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
		queryAllDepart("departId","${ctx}/department/queryAllDepartment");
		
		var departId = "${queryArgs.departId}";
		function setDepartId() {
			$("#departId").val(departId);
		}
		if (departId != null && departId != ""
			&& departId != undefined) {
			queryAllDepart("departId","${ctx}/department/queryAllDepartment");
			setTimeout(setDepartId, 50);
	    }
	});

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

	
	//检索商品信息
	function loaduseAlloctGoods(url) {
		var goodsName = $("#goodsName").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		var departId = $("#departId option:selected").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var useAlloctType = $("#useAlloctType option:selected").val();
		location.href = url + "?goodsName=" + goodsName + "&categoryOne="+ categoryOne + "&categoryTwo=" + categoryTwo + "&departId="+ departId+"&startDate="+startDate+
				"&endDate="+endDate+"&useAlloctType="+useAlloctType;
	}

	
	//实现库存出库打印与导出
	function dataExport(operatType){
		var goodsName = $("#goodsName").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		var departId = $("#departId option:selected").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var useAlloctType = $("#useAlloctType option:selected").val();
		var url = "${ctx}/dataOperatController/useAlloctOpeart?goodsName=" + goodsName + "&categoryOne="+ categoryOne + "&categoryTwo=" + categoryTwo + "&departId="+ departId+"&startDate="+startDate+
		"&endDate="+endDate+"&opeartType="+operatType+"&useAlloctType="+useAlloctType+"&rows=1000000&printType=1&title=物资库存出库统计";
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
				   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 部门:&nbsp;&nbsp;
				   <select id="departId" name="departId"  class="courseinput">
					  <option value="">全部</option>
				   </select>
			   </td>
	       </tr>
	       <tr>
		        <td>开始时间:&nbsp;&nbsp;                                                                                                                                                                                                       
		        	<input id="startDate" name="startDate" type="text" value="${queryArgs.startDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker()"/></td>
		        <td>结束时间:&nbsp;&nbsp;                                                                                                                                                                                                        
		        	<input id="endDate" name="endDate" type="text" value="${queryArgs.endDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker()"/></td>
		        <td>商品名称:&nbsp;&nbsp;  <input id="goodsName" name="goodsName" type="text"
						value="${queryArgs.goodsName}" class="courseinput"
						style="border-radius: 4px;" placeholder="商品名称" />
				</td>
	       </tr>
	       <tr>
	          <td>
				出库类型:&nbsp;&nbsp; 
				<select id="useAlloctType" name="useAlloctType"  class="courseinput">
					<option value="" <c:if test="${empty queryArgs.useAlloctType}">selected</c:if>>全部</option>
					<option value="1" <c:if test="${queryArgs.useAlloctType eq 1}">selected</c:if>>调拨</option>
					<option value="2" <c:if test="${queryArgs.useAlloctType eq 2}">selected</c:if>>领用</option>
			    </select>
		   	 </td>
		   	 <td></td>
		   	 <td></td>
	    </tr> 
	    <tr>
	        <td colspan="3" style="text-align: center;">
	          <input type="button" style="text-align: center;" class="btn2" onclick="loaduseAlloctGoods('${ctx}/useAlloct/statisUseAlloctPager')" value="检&nbsp;&nbsp;索" />
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
						<th>商品编号</th>
						<th>商品名称</th>
						<th>规格</th>
						<th>单位</th>
						<th>单价</th>
						<th>数量</th>
						<th>金额</th>
						<th>商品类型</th>
						<th>部门</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pages.rows}" var="goods" varStatus="in">
					   <c:if test="${not empty goods.goodsId}">
					      <tr>
							<td>${in.count}</td>
							<td title="${goods.goodsNo}"
								style="font-weight: bold; font-size: 14px; color: #8B4513;">${goods.goodsNo}</td>
							<td title="${goods.goodsName}"
								style="font-weight: bold; font-size: 14px; color: #8B4513;">${goods.goodsName}</td>
							<td>${goods.specModel}</td>
							<td>${goods.spec}</td>
							<td style="font-weight: bold; color: red; font-size: 13px;" title="${goods.formatPrice}">${goods.formatPrice}</td>
							<td>${goods.goodsNum}</td>
							<td style="font-weight: bold; color: red; font-size: 13px;">${goods.formatMoney}</td>
							<td><c:if test="${goods.goodsType eq 1}">
		        		                     物资
		        		     </c:if> <c:if test="${goods.goodsType eq 2}">
		        		                     固定资产
		        		     </c:if></td>
		        		     <td style="font-weight: bold;font-size:14px;">
								  <c:if test="${empty queryArgs.departId}">
						           	所有部门
							       </c:if>
							       <c:if test="${not empty queryArgs.departId}">
						           	   ${goods.departmentName}
							       </c:if>
							</td>
						</tr>
					   </c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<jsp:include page="/commons/pager.jsp">
			<jsp:param
				value="statisUseAlloctPager?goodsName=${queryArgs.goodsName}&categoryOne=${queryArgs.categoryOne}&categoryTwo=${queryArgs.categoryTwo}&departId=${queryArgs.departId}&startDate=${queryArgs.startDate}&endDate=${queryArgs.endDate}"
				name="url" />
		</jsp:include>
	</div>
</body>
</html>
