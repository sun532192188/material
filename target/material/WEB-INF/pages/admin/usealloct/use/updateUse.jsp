<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>领用调拨修改</title>
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
	margin-left: 40px;
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
		queryAllDepart("depart","${ctx}/department/queryAllDepartment");
		var mytime=getNowFormatDate();     //获取当前时间
		$("#storageDate").text(mytime);
		var sumMoney = "${sumMoney}";
		var oldSunMoney = $("#sumMoney").text();
		if(sumMoney != null && sumMoney != "" && sumMoney != undefined){
			if(oldSunMoney == '0'){
				$("#sumMoney").text(sumMoney);
			}else{
				$("#sumMoney").text(sumMoney+oldSunMoney);
			}
		}
		//判断使用编号是是否为空如果为空则表示入库信息丢失马上根据使用编号请求出库信息
		var useAlloctId = "${useAlloct.id}";
		if(useAlloctId == null || useAlloctId == "" || useAlloctId == undefined){
			var operatNo = "${storageNo}";
			$.ajax({
				type:"POST",
				url:"${ctx}/useAlloct/queryUseAlloctByNo",
				data:{"operatNo":operatNo},
				success:function(result){
					var useAlloct = result.useAlloct;
					$("#updateId").val(useAlloct.id);
					$("#operatNo").text(useAlloct.operatNo);
					$("#storageDate").text(result.useAlloctDate);
					$("#useName").val(useAlloct.useName);
					$("#remarks").val(useAlloct.remarks);
					$("#updateId").val(useAlloct.id);
				},
				error:function(result){
					operaAlert("warning", "警告提示", "操作失败");
				}
			});
		}
		
		var departId = "${departId}";
		function selectedDepart(){
			$("#depart").val(departId)
		}
		setTimeout(selectedDepart, 100);
	});
	
	//加载全部领用库存商品
	function loadAllStock(){
		var operatNo = $("#operatNo").text();
		var departId = $("#depart option:selected").val();
		$("#FunctionContent").prop("src","${ctx}/stock/queryStockInit?type=2&operatNo="+operatNo+"&departId="+departId+"&operatType=4");
	}
	
	function closeTip(){
		 $(".tip").hide();
		 $("body").css("overflow", "auto");
	}
	
	 //添加物资领用信息
	function updateLY(){
		var departmentId = $("#depart option:selected").val();
		if(departmentId == null || departmentId == "" || departmentId == undefined){
			operaAlert("warning","警告提示","请选择领用部门");
			return;
		}
		var sumMoney = $("#sumMoney").text();
		if(sumMoney == null || sumMoney == "" || sumMoney == undefined ){
			operaAlert("warning","警告提示","请核对总金额");
			return;
		}else{
			sumMoney = sumMoney.split(",").join('');
		}
		var operatNo = $("#operatNo").text();
		if(operatNo == null || operatNo == "" || operatNo == undefined ){
			operaAlert("warning","警告提示","请核对领用编号");
			return;
		}
		var useName = $("#useName").val();
		if(useName == null || useName == "" || useName == undefined ){
			operaAlert("warning","警告提示","请填写领用人");
			return;
		}
		var remarks = $("#remarks").val();
		var type = 2;
		var goodsList = "${goodsList}";
		if(goodsList == null || goodsList == "" || goodsList == undefined ){
			operaAlert("warning","警告提示","请选择商品");
			return;
		}
		var updateId =$("#updateId").val();
		$.ajax({
			type:"POST",
			url:"${ctx}/useAlloct/updateUseAlloct",
			data:{"id":updateId,"departmentId":departmentId,"sumMoney":sumMoney,"operatNo":operatNo,"useName":useName,"remarks":remarks,"type":type},
		    success:function(result){
		    	if(result.status == 200){
		    		 operaAlert("success","成功提示","操作成功");
		    		 $("#chur").click(function() {
		    			 window.parent.location.reload();
		 			});
		    		 
		    	}else{
		    		 operaAlert("warning","警告提示",result.msg);
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
						 var operatNo = $("#operatNo").text();
						//location.href= "${ctx}/goods/queryAllTempGoods?operatNo="+operatNo+"&returnPage=usealloct/use/add";
					    window.location.reload();
					 });
		    	}else{
		    		 operaAlert("warning","警告提示",result.msg);
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
	
	//删除临时数据
	function delOldGoods(){
		console.log("领用修改窗口关闭");
	}
</script>
</head>
<body style="height: 100%; overflow-X: hidden;">  
    <input type="hidden" id="updateId" value="${useAlloct.id}">
	<div class="ru">
		<ul>
			<li style="margin-left: 10px;"><label
				style="font-weight: bold; font-size: 15px;">部门:</label>&nbsp;&nbsp;
				<select id="depart" class="courseinput" style="width: 100px;">
			    </select>
			</li>
			<li><label style="font-weight: bold; font-size: 15px;">日期:</label><b style="font-size: 15px;" id="storageDate"></b></li>
			<li><label style="font-weight: bold; font-size: 15px;" >合计金额:</label>
			   <b style="font-size: 15px;" id="sumMoney">0</b> <b style="font-size: 15px;">元</b>
			</li>
			<li><label style="font-weight: bold; font-size: 15px;">编号:</label><b style="font-size: 15px;" id="operatNo">${useAlloct.operatNo}</b></li>
		</ul>
	</div>
	<div class="operat_div">
	  <table class="table_ru">
		<tr style="background: #DCDCDC;">
			<td>序号</td>
			<td>编码</td>
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
				<td>${goods.goodsNo}</td>
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
				<td></td>
		    </tr>
	    </c:if>
	 </table>
	</div>
    <table class="table_ru">
       <tr>
			<td colspan="9" style="text-align: right; border: none;">
			<input id="addGoodsBtn" type="submit" style="background: #DCDCDC; color: #3C3C3C; border-radius: 5px; margin-top: 10px;" class="btn2 tclick" value="添加商品" onclick="loadAllStock();"/>
			</td>
		</tr>
    </table>
	<div style="margin-top: 30px; width: 100%; height: 50px;">
		<ul style="float: left; margin-left: 10px;">
			<li style="margin-top: 30px; float: left; margin-left: 10px;">
				<label><b style="color: red;">*</b>领用员:</label>&nbsp;&nbsp; <input type="text"
				class="courseinput" id="useName" value="${useAlloct.useName}">
			</li>
			<li style="clear: both; padding-top: 30px;">
				<table style="margin-left: 22px;">
					<tr>
						<td style="line-height: 20px;"><label><b style="color: red;">*</b>描述</label></td>
						<td style="padding-left: 10px;"><textarea id="remarks"
								style="resize: none;" name="description" cols="" rows=""
								class="textinput">${useAlloct.remarks}</textarea></td>
					</tr>
				</table> <!-- <textarea style="resize: none;" name="description" cols="" rows="" class="textinput"></textarea> -->
			</li>
			<li><label>&nbsp; </label><input type="submit" class="btn2"
				style="position: absolute; right: 3%; margin-top: 30px; border-radius: 5px; background: #DCDCDC; color: #3C3C3C;"
				value="保&nbsp;&nbsp;存"  onclick="updateLY();"/></li>
		</ul>
	</div>
	
	  <div class="tip alert_show_div">
    	<div class="tiptop"><span>库存列表</span><a></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>       
</body>
</html>