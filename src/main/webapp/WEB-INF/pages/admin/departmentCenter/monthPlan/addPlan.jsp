<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>添加计划</title>
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
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>      	
<style type="text/css">
.ru {
	margin-top: 10px;
}
.ru ul li {
	list-style: none;
	display: inline;
	margin-left:27%;
	font-size: 15px;
}

.courseinput {
	width: 300px;
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
	width: 700px;
	height: 50px;
	line-height: 20px;
	overflow: hidden;
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
					window.parent.parent.getCategory(0);
				}
			});
		}
		queryAllDepart("signDepart","${ctx}/department/queryAllDepartment");
		var mytime=getNowFormatDate();     //获取当前时间
		$("#storageDate").text(mytime);
		var storageMoney = "${sumMoney}";
		var oldSunMoney = $("#sumPrice").text();
		if(storageMoney != null && storageMoney != "" && storageMoney != undefined){
			if(oldSunMoney == '0'){
				$("#sumPrice").text(storageMoney);
			}else{
				$("#sumPrice").text(storageMoney+oldSunMoney);
			}
		}
	});
	
	//加载全部商品
	function loadAllGoods(){
		$("#FunctionContent").prop("src","${ctx}/departmentCenter/queryGoodsInit?operatType=1");
	}
	
	function closeTip(){
		 $(".tip").hide();
		 $("body").css("overflow", "auto");
	}
	
	//删除临时数据
	function delOldGoods(){
		var supplierId = "${supplierId}";
		var operatNo = "${storageNo}";
		if(supplierId != null && supplierId != "" && supplierId != undefined){
			$.ajax({
				type:"POST",
				url:"${ctx}/goods/delAllOperatTemp",
				data:{"supplierId":supplierId,"operatNo":operatNo},
				success:function(result){
					if(result.status == 200){
						window.location.href ="${ctx}/goods/queryAllTempGoods?supplierId="+supplierId+"&operatNo="+operatNo+"&returnPage=storage/yanshou/addCheck";
					}
				},
				error:function(result){
					 operaAlert("warning","警告提示","操作错误");
				}
			});
	    }
	}
	
	//添加验收入库信息
	function addMonthPlan(type){
		var sumPrice = $("#sumPrice").text();
		sumPrice = sumPrice.replace(",","");
		if(sumPrice == null || sumPrice == "" || sumPrice == undefined){
			 operaAlert("warning","警告提示","请核对总价格");
			 return;
		}
		var planName1 = $("#planName1 option:selected").val();
		var planName2 =$("#planName2").val();
		if(planName1 == null || planName1 == "" || planName1 == undefined){
			 operaAlert("warning","警告提示","请填写计划名称");
			 return;
		}
		if(planName2 == null || planName2 == "" || planName2 == undefined){
			 operaAlert("warning","警告提示","请填写计划名称");
			 return;
		}
		var planName = planName1+"月份"+planName2+"费采购计划"
		var remarks = $("#remarks").val();
		var status = type;
		var goodsList = "${goodsList}";
		if(goodsList == null || goodsList == "" || goodsList == undefined){
			 operaAlert("warning","警告提示","请添加商品");
			 return;
		}
		$.ajax({
			type:"POST",
			url:"${ctx}/departmentCenter/addMonthPlan",
			data:{"sumPrice":sumPrice,"planName":planName,"remarks":remarks,"status":status}, 
		    success:function(result){
		    	if(result.status == 200){
		    		 operaAlert("success","成功提示","操作成功");
		    		 $("#chur").click(function() {
		    			 window.parent.location.reload();
					});
		    		 
		    	}
		    },
		    error:function(result){
		    	 operaAlert("warning","警告提示","操作失败");
		    }
		});
	}
	
	//删除临时数据
	function delTempById(id){
		$.ajax({
			type:"POST",
			url:"${ctx}/goods/delTempById",
			data:{"id":id},
			success:function(result){
				if(result.status == 200){
		    		 operaAlert("success","成功提示","操作成功");
					 $("#chur").click(function() {
						location.href= "${ctx}/goods/queryAllTempGoods?returnPage=departmentCenter/monthPlan/addPlan";
					});
		    	}
			},
			error:function(result){
				operaAlert("warning","警告提示",result.msg);
			}
		});
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
			   <b style="font-size: 15px;" id="sumPrice">0</b> <b style="font-size: 15px;">元</b>
			</li>
		</ul>
	</div>
	<div class="operat_div">
	   <table class="table_ru">
		<tr style="background: #DCDCDC;">
			<td>序号</td>
			<td>名称</td>
			<td>型号</td>
			<td>单价</td>
		    <td>数量</td>
			<td>单位</td>
			<td>金额</td>
			<td>操作</td>

		</tr>
		<c:if test="${empty goodsList}">
		   <tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
		   </tr>
		   <tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</c:if>
		<c:forEach items="${goodsList}" var="goods" varStatus="in">
		  	<tr>
				<td>${in.count}</td>
				<td>${goods.goodsName}</td>
				<td>${goods.specModel}</td>
				<td>${goods.formatPrice}</td>
				<td>${goods.goodsNum}</td>
				<td>${goods.spec}</td>
				<td>${goods.formatMoney}</td>
				<td><a href="javascript:;" onclick="delTempById(${goods.id});">删除</a></td>
		    </tr>
		</c:forEach>
	</table>
	</div>
    <table class="table_ru">
        <tr>
			<td colspan="8" style="text-align: right; border: none;">
			<input id="addGoodsBtn" type="submit"style="background: #DCDCDC; color: #3C3C3C; border-radius: 5px; margin-top: 10px;" class="btn2 tclick" value="添加商品" onclick="loadAllGoods();"/>
			</td>
		</tr>
    </table>
	<div style="margin-top:0px; width: 100%; height: 50px;">
		<ul style="float: left; margin-left: 10px;">
			<li style="margin-top: 30px; float: left; margin-left:10px;">
				<label><b style="color: red;">*</b>计划名称</label>&nbsp;&nbsp; 
				<select id="planName1"  class="dfinput" style="width:150px">
					<option value="">请选择</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
			    </select>
				月份
				<input type="text" class="courseinput" id="planName2" style="width: 150px;">
				费采购计划
			</li>
			<li style="clear: both; padding-top: 30px;">
				<table style="margin-left: 22px;">
					<tr>
						<td style="line-height: 20px;"><label><b style="color: red;">*</b>描述</label></td>
						<td style="padding-left: 20px;"><textarea id="remarks"
								style="resize: none;" name="remarks" cols="" rows=""
								class="textinput"></textarea></td>
					</tr>
				</table> 
			</li>
		   <li><label>&nbsp; </label>
		      <input type="submit" class="btn2"
				style="position: absolute; right:23%; margin-top: 30px; border-radius: 5px; background: #DCDCDC; color: #3C3C3C;"
				value="保&nbsp;&nbsp;存"  onclick="addMonthPlan(0);"/>&nbsp;&nbsp;&nbsp;&nbsp;
		      <input type="submit" class="btn2"
				style="position: absolute; right: 3%; margin-top: 30px; border-radius: 5px; background: #DCDCDC; color: #3C3C3C;"
				value="保存并申请"  onclick="addMonthPlan(1);"/></li>
		</ul>
	</div>
	
	  <div class="tip alert_show_div">
    	<div class="tiptop"><span>商品列表</span><a></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>       
</body>
</html>