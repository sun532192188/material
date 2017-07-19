<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>物资管理系统</title>
<style type="text/css">
body{
  background: #F5F5F5;
}
.content {
	width: 100%;
    vertical-align: middle;
    overflow: scroll;
}

.con_ul {
    width:96%;
	margin: 0 auto;
}

.con_li {
	list-style: none;
	display: inline-block;
	line-height: 40px; 
	/* border:1px  solid  blue; */
	margin:auto;
	width:300px; 
	height:300px; 
}

.con_li a {
	text-decoration: none;
	color: #000000;
}

.con_li img {
	width: 150px;
	height: 150px;
	margin-left: 30%;
	margin-top: 100px;
	border: 1px solid #C0C0C0;
	border-radius:5px;
} 

span {
	position: relative;
	top: 10px;
	margin-left: 43%;
	display: block;
}
</style>
<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<script>
  //加载左侧菜单
  var loadLeftMenu = function(parentId,parentFunctionName){
	  location.href="${ctx}/admin/module?parentId="+parentId+"&parentFunctionName="+parentFunctionName;
	 // location.href="${ctx}/departmentCenter/queryMonthPlanPager";
  }
</script>
</head>
<body>
	<div class="content">
		<ul class="con_ul" style="height: 900px;">
			<c:forEach items="${roleFunctionList}" var="userFunction">
			    <li class="con_li">
			        <a  onclick="loadLeftMenu(${userFunction.functionId},'${userFunction.functionName}')">
						<c:if test="${userFunction.functionName eq '部门管理'}">
						    <img src="${ctx}/resources/images/index/depart.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '角色管理'}">
						    <img src="${ctx}/resources/images/index/role.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '用户管理'}">
						    <img src="${ctx}/resources/images/index/user.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '供应商管理'}">
						    <img src="${ctx}/resources/images/index/supplier.png"/>
						</c:if>
						<c:if test="${userFunction.functionName eq '商品类型管理'}">
						    <img src="${ctx}/resources/images/index/category.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '商品管理'}">
						    <img src="${ctx}/resources/images/index/goods.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '入库管理'}">
						    <img src="${ctx}/resources/images/index/storage.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '调拨管理'}">
						    <img src="${ctx}/resources/images/index/diaobo.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '领用管理'}">
						    <img src="${ctx}/resources/images/index/lingyong.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '统计管理'}">
						    <img src="${ctx}/resources/images/index/tongji.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '数据中心'}">
						    <img src="${ctx}/resources/images/index/datacenter.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '商品信息'}">
						    <img src="${ctx}/resources/images/index/goodsInfo.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '月计划'}">
						    <img src="${ctx}/resources/images/index/monthplan.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '物资管理'}">
						    <img src="${ctx}/resources/images/index/departMaterial.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '部门库存'}">
						    <img src="${ctx}/resources/images/index/departStock.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '出库管理'}">
						    <img src="${ctx}/resources/images/index/materialCK.png" />
						</c:if>
						<c:if test="${userFunction.functionName eq '物资统计'}">
						    <img src="${ctx}/resources/images/index/depart_tongji.png" />
						</c:if>
						
						<c:if test="${userFunction.functionName eq '商品类型管理'}">
						   <span style="margin-left: 40%;">${userFunction.functionName}</span>
						</c:if>
						<c:if test="${userFunction.functionName ne '商品类型管理'}">
						   <span>${userFunction.functionName}</span>
						</c:if>
					 </a>
                </li>
			</c:forEach>
		</ul>
	</div>
</body>
<script type="text/javascript">
 $(function(){
	 var height = $(window).height()-10;
	 $(".content").css({"height":height});
 });
</script>
</html>