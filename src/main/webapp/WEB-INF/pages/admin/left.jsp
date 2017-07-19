<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>菜单栏</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	dd div.title {
		margin-left:10px;
	}
</style>
<script language="JavaScript" src="${ctx}/resources/js/jquery.min.js"></script>
<script language="JavaScript" src="${ctx}/resources/js/org.zh.plugins.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active");
		$(this).addClass("active");
	});
	
	$("dd").according({
		header:"div",
		body:"ul",
		current:"current"
	});
	
	
	function  checkBrowser(){
		var u = navigator.userAgent, app = navigator.appVersion;
		var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Linux') > -1; //android终端或者uc浏览器
		var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端

		//安卓终端
		if(isAndroid){
			//alert('安卓终端：'+isAndroid);
			return;
		}
		//Ios终端
		if(isiOS){
			//alert('Ios终端'+isiOS);
			return;
		}
		//ie
		if( u.indexOf('Trident') > -1){
			//alert("ie 内核");
			return;
		}
		//苹果、谷歌内
		if( u.indexOf('AppleWebKit') > -1){
			//alert("苹果、谷歌内核");
			$(".menuson li cite").css({"marginLeft":"30px"});
		}
		//火狐内核
		if(u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1){
			//alert("火狐内核");
			$(".menuson li cite").css({"marginLeft":"30px"});
			return 3;
		}
	}
	
	 checkBrowser();
});	
</script>

</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>菜单栏</div>
    <dl class="leftmenu">
      <dd>
	     <div class="title current">
	    	<span><img src="${ctx}/resources/platform/images/leftico03.png" alt="" /></span>${parentFunctionName}
	     </div>
	    <!--   -->
	    <ul class="menuson">
	        <c:forEach items="${functionList}" var="function">
	          <c:if test="${function.functionName eq '部门查询'}">
	               <li><cite></cite><a href="${ctx}/department/queryDepartList"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '角色查询'}">
	               <li><cite></cite><a href="${ctx}/role/queryInit"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '用户查询'}">
	               <li><cite></cite><a href="${ctx}/user/queryUserPager"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '查询供应商'}">
	               <li><cite></cite><a href="${ctx}/supplier/querySupplierList"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '类目查询'}">
	               <li><cite></cite><a href="${ctx}/category/queryInit"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '商品查询'}">
	               <li><cite></cite><a href="${ctx}/goods/queryGoodsPager?returnType=1"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '验收入库'}">
	               <li><cite></cite><a href="${ctx}/storage/queryStorage?type=1"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '预存入库'}">
	               <li><cite></cite><a href="${ctx}/storage/queryStorage?type=2"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '调拨查询'}">
	               <li><cite></cite><a href="${ctx}/useAlloct/queryUseAlloctPager?type=1"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '领用查询'}">
	               <li><cite></cite><a href="${ctx}/useAlloct/queryUseAlloctPager?type=2"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '商品查看'}">
	               <li><cite></cite><a href="${ctx}/goods/queryGoodsPager?returnType=2"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '部门月计划统计'}">
	               <li><cite></cite><a href="${ctx}/departmentCenter/staticsDepartPlan"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '库存管理'}">
	               <li><cite></cite><a href="${ctx}/stock/queryStockPage"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '库存入库统计'}">
	               <li><cite></cite><a href="${ctx}/storage/staticsStoragePager"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
              <c:if test="${function.functionName eq '库存出库统计'}">
                <li><cite></cite><a href="${ctx}/useAlloct/statisUseAlloctPager"  target="rightFrame">${function.functionName}</a><i></i></li>
              </c:if>
	          <c:if test="${function.functionName eq '数据操作'}">
                <li><cite></cite><a href="${ctx}/dataCenterController/dataInit"  target="rightFrame">${function.functionName}</a><i></i></li>
              </c:if>
              <c:if test="${function.functionName eq '系统名称'}">
                <li><cite></cite><a href="${ctx}/dataCenterController/systemNameInit"  target="rightFrame">${function.functionName}</a><i></i></li>
              </c:if>
	          <c:if test="${function.functionName eq '月计划查询'}">
	               <li><cite></cite><a href="${ctx}/departmentCenter/queryMonthPlanPager"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '入库单查看'}">
	               <li><cite></cite><a href="${ctx}/useAlloct/queryUseAlloctPager?type=3"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	         <c:if test="${function.functionName eq '物资出库'}">
	               <li><cite></cite><a href="${ctx}/departmentCenter/materialConsumePager"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '物资库存'}">
	               <li><cite></cite><a href="${ctx}/departmentCenter/departStockPager?goodsType=1&returnPage=departmentCenter/departStock/list"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '固定资产库存'}">
	               <li><cite></cite><a href="${ctx}/departmentCenter/departStockPager?goodsType=2&returnPage=departmentCenter/departStock/fixedList"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          <c:if test="${function.functionName eq '部门入库统计'}">
                <li><cite></cite><a href="${ctx}/departmentCenter/statisDepartStorage"  target="rightFrame">${function.functionName}</a><i></i></li>
              </c:if>
	          <c:if test="${function.functionName eq '部门出库统计'}">
	               <li><cite></cite><a href="${ctx}/departmentCenter/statisDepartConsumePager"  target="rightFrame">${function.functionName}</a><i></i></li>
	          </c:if>
	          
	        </c:forEach>
         </ul>  
      </dd>
    </dl>
</body>
</html>