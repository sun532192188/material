<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>月计划商品</title>
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
<script type="text/javascript"
	src="${ctx}/resources/js/materialCommon.js"></script>
<style type="text/css">
.ru {
	margin-top: 10px;
}

.ru ul li {
	list-style: none;
	display: inline;
	margin-left: 27%;
	font-size: 15px;
}
.courseinput {
	width: 200px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
}

.textinput {
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	background: url(../images/inputbg.gif) repeat-x;
	padding: 10px;
	width: 745px;
	height: 135px;
	line-height: 20px;
	overflow: hidden;
}
</style>
<script type="text/javascript">
var sumMoney = "${sumMoney}";
var type = "${type}";
var departmentName = "${departmentName}";
$(function(){
	var mytime=getNowFormatDate();     //获取当前时间
	$("#storageDate").text(mytime);
});
//删除临时数据
function delPlanGoods(id){
	$.ajax({
		type:"POST",
		url:"${ctx}/departmentCenter/delPlanGoods",
		data:{"goodsId":id},
		success:function(result){
			if(result.status == 200){
	    		 operaAlert("success","成功提示","操作成功");
				 $("#chur").click(function() {
				    location.reload();
				 });
	    	}
		},
		error:function(result){
			operaAlert("warning","警告提示",result.msg);
		}
	});
}

//提交申请
function applyPlan(){
	$.ajax({
		type:"POST",
		url:"${ctx}/departmentCenter/updatePlanStatus",
		success:function(result){
			if(result.status == 200){
	    		 operaAlert("success","成功提示","操作成功");
				 $("#chur").click(function() {
					 window.parent.location.reload();
				});
	    	}
		},
		error:function(result){
			operaAlert("warning","警告提示",result.msg);
		}
	});
}

//加载全部商品
function loadAllGoods(){
	$("#FunctionContent").prop("src","${ctx}/departmentCenter/queryGoodsInit?operatType=2");
}
</script>
</head>
<body style="height: 100%; overflow-X: hidden;">
	<div class="ru">
			<ul>
			<li style="margin-left: 20px;">
			  <label style="font-weight: bold; font-size: 15px;">部门名称:</label>&nbsp;&nbsp;
			  <b style="font-size: 15px;" id="departmentName">${departmentName}</b>
			</li>
			<li><label style="font-weight: bold; font-size: 15px;">日期:</label><b style="font-size: 15px;" id="storageDate"></b></li>
			<li><label style="font-weight: bold; font-size: 15px;" >合计金额:</label>
			   <b style="font-size: 15px;" id="sumPrice">${sumMoney}</b> <b style="font-size: 15px;">元</b>
			</li>
		</ul>
	</div>
	<div class="operat_div" style="height:420px;">
	     <table class="table_ru">
		<tr style="background: #DCDCDC;">
			<td>序号</td>
			<td>名称</td>
			<td>型号</td>
			<td>单价</td>
			<td>数量</td>
			<td>单位</td>
			<td>金额</td>
			<c:if test="${type eq 0}">
			  <td>操作</td>
			</c:if>
		</tr>
		<c:forEach items="${goodsList}" var="goods" varStatus="in">
			<tr>
				<td>${in.count}</td>
				<td>${goods.goodsName}</td>
				<td>${goods.specModel}</td>
				<td>${goods.formatPrice}</td>
				<td>${goods.goodsNum}</td>
				<td>${goods.spec}</td>
				<td>${goods.formatMoney}</td>
				<c:if test="${type eq 0}">
				  <td><a href="javascript:;"  onclick="delPlanGoods(${goods.id});">删除</a></td>
				</c:if>
			</tr>
		</c:forEach>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<c:if test="${type eq 0}">
			  <td>操作</td>
			</c:if>
		</tr>
	  </table>
	 </div>
	 <table class="table_ru">
	     <c:if test="${type eq 0}">
			 <tr>
				<td colspan="8" style="text-align: right; border: none;">
				   <input id="addGoodsBtn" type="submit" style="background: #DCDCDC; color: #3C3C3C; border-radius: 5px; margin-top: 10px;" class="btn2 tclick" value="添加商品" onclick="loadAllGoods();"/>&nbsp;&nbsp;
				   <input id="addGoodsBtn" type="submit" style="background: #DCDCDC; color: #3C3C3C; border-radius: 5px; margin-top: 10px;" class="btn2" value="申请" onclick="applyPlan();"/>
				</td>
		     </tr>
	     </c:if>
	  </table>
	 <div class="tip alert_show_div">
    	<div class="tiptop"><span>商品列表</span><a></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>       
</body>
</html>