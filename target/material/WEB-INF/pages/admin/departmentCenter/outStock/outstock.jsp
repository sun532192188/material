<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>添加出库</title>
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
	margin-left: 140px;
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
	width: 650px;
	height: 135px;
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
				}
			});
		}
		queryAllDepart("targetDepartId","${ctx}/department/queryAllDepartment");
		var operatNo = "${storageNo}";
		if(operatNo != null && operatNo != "" && operatNo != undefined){
			$("#operatNo").text(operatNo);
		}
		var mytime=getNowFormatDate();     //获取当前时间
		$("#storageDate").text(mytime);
		var consumeMoney = "${sumMoney}";
		var oldSumMoney = $("#consumeMoney").text();
		if(consumeMoney != null && consumeMoney != "" && consumeMoney != undefined){
			if(oldSumMoney == '0'){
				$("#consumeMoney").text(consumeMoney);
			}else{
				$("#consumeMoney").text(consumeMoney+oldSumMoney);
			}
		}
	});
	
	//加载全部商品
	function loadAllGoods(){
		var operatNo = $("#operatNo").text();
		$("#FunctionContent").prop("src","${ctx}/departmentCenter/queryGoodsInit?operatType=3&operatNo="+operatNo);
	}
	
	function closeTip(){
		 $(".tip").hide();
		 $("body").css("overflow", "auto");
	}
	
	
	//删除临时数据
	function delTempById(id){
		var operatNo = $("#operatNo").text();
		$.ajax({
			type:"POST",
			url:"${ctx}/goods/delTempById",
			data:{"id":id},
			success:function(result){
				if(result.status == 200){
		    		 operaAlert("success","成功提示","操作成功");
					 $("#chur").click(function() {
							window.location.href ="${ctx}/goods/queryAllTempGoods?operatNo="+operatNo+"&returnPage=departmentCenter/outStock/outstock";
					});
		    	}
			},
			error:function(result){
				operaAlert("warning","警告提示",result.msg);
			}
		});
	}
	
	//出库  此处需要添加非空验证
	function addCK(){
		var ck = {};
		var consumeMoney =  $("#consumeMoney").text();
		consumeMoney = consumeMoney.replace(",","");
        ck.consumeMoney = consumeMoney;
        ck.operatNo = $("#operatNo").text();
        ck.remarks = $("#remarks").val();
        ck.type = $("#type option:selected").val();
        ck.targetDepartId = $("#targetDepartId option:selected").val();
        $.ajax({
			type:"POST",
			url:"${ctx}/departmentCenter/departCK",
			 data:ck, 
		    success:function(result){
		    	if(result.status == 200){
		    		 operaAlert("success","成功提示","操作成功");
		    		 $("#chur").click(function() {
		    			 window.parent.location.reload();
		 			});
		    	}else{
		    		operaAlert("warning","警告提示",result.msg);
		    		return;
		    	}
		    },
		    error:function(result){
		    	 operaAlert("warning","警告提示","操作失败");
		    }
		});
	}
	
	function changeTargetDepart(){
		var isShow = $("#type option:selected").val();
		if(isShow ==1){
			$("#targetDepart").hide();
			$("#ckValue").val("提交出库");
		}else if(isShow == 2){
			$("#targetDepart").show();
			$("#ckValue").val("调拨");
		}
	}
	
	//删除临时数据
	function delOldGoods(){
		var operatNo = $("#operatNo").text();
		$.ajax({
			type:"POST",
			url:"${ctx}/goods/delAllOperatTemp",
			data:{"operatNo":operatNo},
			success:function(result){
				/* if(result.status == 200){
					window.parent.reload();
				} */
			},
			error:function(result){
				 operaAlert("warning","警告提示","操作错误");
			}
		});
	}
</script>
</head>
<body style="height: 100%; overflow-X: hidden;">
	<div class="ru">
		<ul>
			<li style="margin-left: 30px;"><label style="font-weight: bold; font-size: 15px;">日期:</label><b style="font-size: 15px;" id="storageDate"></b></li>
			<li><label style="font-weight: bold; font-size: 15px;" >合计金额:</label>
			   <b style="font-size: 15px;" id="consumeMoney">0</b> <b style="font-size: 15px;">元</b>
			</li>
			<li><label style="font-weight: bold; font-size: 15px;">编号:</label><b style="font-size: 15px;" id="operatNo">${operatNo}</b></li>
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
		<c:forEach items="${goodsList}" var="goods" varStatus="in">
		  	<tr>
				<td>${in.count}</td>
				<td>${goods.goodsName}</td>
				<td>${goods.specModel}</td>
				<td>${goods.price}</td>
				<td>${goods.goodsNum}</td>
				<td>${goods.spec}</td>
				<td>${goods.singleMoney}</td>
				<td><a href="javascript:;" onclick="delTempById(${goods.id});">删除</a></td>
		    </tr>
		</c:forEach>
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
	  </table>
	</div>
    <table class="table_ru">
      <tr>
			<td colspan="8" style="text-align: right; border: none;">
			<input id="addGoodsBtn" type="submit"style="background: #DCDCDC; color: #3C3C3C; border-radius: 5px; margin-top: 10px;" class="btn2 tclick" value="添加商品" onclick="loadAllGoods();"/>
			</td>
		</tr>
    </table>

	<div style="margin-top: 30px; width: 100%; height: 50px;">
		<ul style="float: left; margin-left: 10px;">
		     <li style="margin-top: 30px; float: left;">
		        <label><b style="color: red;">*</b>是否调拨</label>&nbsp;&nbsp;
				<select id="type"  class="courseinput" onchange="changeTargetDepart();">
				   <option value="1">本部门使用</option>
				   <option value="2">调拨其他部门</option>
 			    </select>
 			</li>
			<li style="margin-top: 30px; float: left; margin-left: 210px;display: none;" id="targetDepart">
				<label><b style="color: red;">*</b>调拨部门</label>&nbsp;&nbsp;
			    <select id="targetDepartId" class="courseinput">
 			    </select>
			</li>
			<li style="clear: both; padding-top: 30px;">
				<table style="margin-left: 22px;">
					<tr>
						<td style="line-height: 20px;"><label><b style="color: red;">*</b>描述</label></td>
						<td style="padding-left: 10px;"><textarea id="remarks"
								style="resize: none;" name="remarks" cols="" rows=""
								class="textinput"></textarea></td>
					</tr>
				</table> <!-- <textarea style="resize: none;" name="description" cols="" rows="" class="textinput"></textarea> -->
			</li>
		  <li><label>&nbsp; </label><input id="ckValue" type="submit" class="btn2"
				style="position: absolute; right: 3%; margin-top: 30px; border-radius: 5px; background: #DCDCDC; color: #3C3C3C;"
				value="保&nbsp;&nbsp;存"  onclick="addCK();"/></li>
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