<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>验收入库</title>
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
	margin-left:10%;
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
					window.parent.parent.getCategory(0);
				}
			});
		}
		querySupplier("supplierId","${ctx}/supplier/queryAllSuppler");
		queryAllDepart("signDepart","${ctx}/department/queryAllDepartment");
		setTimeout(selectedSupplier,100);
		var mytime=getNowFormatDate();     //获取当前时间
		$("#storageDate").text(mytime);
		var storageMoney = "${sumMoney}";
		var oldSumMoney = $("#storageMoney").text();
		if(storageMoney != null && storageMoney != "" && storageMoney != undefined){
			if(oldSumMoney == '0'){
				$("#storageMoney").text(storageMoney);
			}else{
				$("#storageMoney").text(storageMoney+oldSumMoney);
			}
		}
		function selectedSupplier(){
			var supplierId = "${supplierId}";
			if(supplierId != null && supplierId != "" && supplierId != undefined){
				$("#supplierId").val(supplierId);
			}
			var storageNo = "${storageNo}";
			if(storageNo != null && storageNo != "" && storageNo != undefined){
				$("#storageNo").text(storageNo);
			}
		}
	});
	
	//加载全部商品
	function loadAllGoods(){
		$("body,html").animate({'scrollTop':0},20);
	    var supplierId = $("#supplierId option:selected").val();
	    if(supplierId == null || supplierId == "" || supplierId == undefined){
	    	 setTimeout(closeTip,20);
	    	 operaAlert("warning","警告提示","请选择供应商");
	    	 return;
	    }
	    var operatNo = $("#storageNo").text();
	    oldSupplierId = supplierId; 
		$("#FunctionContent").prop("src","${ctx}/storage/queryGoodsInit?supplierId="+supplierId+"&operatNo="+operatNo+"&type=1");
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
						var newSupplierId = $("#supplierId option:selected").val();
						window.location.href ="${ctx}/goods/queryAllTempGoods?supplierId="+newSupplierId+"&operatNo="+operatNo+"&returnPage=storage/yanshou/addCheck";
					}
				},
				error:function(result){
					 operaAlert("warning","警告提示","操作错误");
				}
			});
	    }
	}
	
	//添加验收入库信息
	function addYSRk(){
		var supplierId = $("#supplierId option:selected").val();
		if(supplierId == null || supplierId == "" || supplierId == undefined){
			 operaAlert("warning","警告提示","请选择供应商	");
			 return;
		}
		var storageMoney = $("#storageMoney").text();
		if(storageMoney == null || storageMoney == "" || storageMoney == undefined){
			 operaAlert("warning","警告提示","请核对价格");
			 return;
		}else{
			storageMoney = storageMoney.split(",").join('');
		}
		
		var storageNo = $("#storageNo").text();
		if(storageNo == null || storageNo == "" || storageNo == undefined){
			 operaAlert("warning","警告提示","请核对验收编号");
			 return;
		}
		var signDepart = $("#signDepart option:selected").val();
		if(signDepart == null || signDepart == "" || signDepart == undefined){
			 operaAlert("warning","警告提示","请选验收部门");
			 return;
		}
		var signName = $("#signName").val();
		if(signName == null || signName == "" || signName == undefined){
			 operaAlert("warning","警告提示","请填写验收员");
			 return;
		}
		var remarks = $("#remarks").val();
		var storageType = 1;
		var  goodsList = "${goodsList}";
		if(goodsList == null || goodsList == "" || goodsList == undefined){
			 operaAlert("warning","警告提示","请选择商品");
			 return;
		}
		$.ajax({
			type:"POST",
			url:"${ctx}/storage/addStoage",
			data:{"supplierId":supplierId,"storageMoney":storageMoney,"storageNo":storageNo,"signDepart":signDepart,"signName":signName,"remarks":remarks,"storageType":storageType},  
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
					 var newSupplierId = $("#supplierId option:selected").val();
		    		 operaAlert("success","成功提示","操作成功");
					 $("#chur").click(function() {
						  var supplierId = $("#supplierId option:selected").val();
						 var operatNo = $("#storageNo").text();
						location.href= "${ctx}/goods/queryAllTempGoods?supplierId="+newSupplierId+"&operatNo="+operatNo+"&returnPage=storage/yanshou/addCheck";
					   /*  window.location.reload(); */
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
			<li style="margin-left: 10px;"><label
				style="font-weight: bold; font-size: 15px;">供应商:</label>&nbsp;&nbsp;
				<select id="supplierId" class="courseinput" style="width: 100px;" onchange="delOldGoods();">
			    </select>
			</li>
			<li><label style="font-weight: bold; font-size: 15px;">日期:</label><b style="font-size: 15px;" id="storageDate"></b></li>
			<li><label style="font-weight: bold; font-size: 15px;" >合计金额:</label>
			   <b style="font-size: 15px;" id="storageMoney">0</b> <b style="font-size: 15px;" id="storageMoney">元</b>
			</li>
			<li><label style="font-weight: bold; font-size: 15px;">编号:</label><b style="font-size: 15px;" id="storageNo">${storageNo}</b></li>
		</ul>
	</div>
	<div class="operat_div">
	   <table class="table_ru">
		<tr style="background: #DCDCDC;">
			<td>序号</td>
			<td>编码</td>
			<td>名称</td>
			<td>规格</td>
			<td>单位</td>
			<td>单价</td>
		    <td>数量</td>
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
		<c:forEach items="${goodsList}" var="goods" varStatus="in">
		  	<tr>
				<td>${in.count}</td>
				<td>${goods.goodsNo}</td>
				<td>${goods.goodsName}</td>
				<td>${goods.specModel}</td>
				<td>${goods.spec}</td>
				<td>${goods.formatPrice}</td>
				<td>${goods.goodsNum}</td>
				<td>${goods.formatMoney}</td>
				<td><a href="javascript:;" onclick="delTempById(${goods.id});">删除</a></td>
		    </tr>
		</c:forEach>
	</table>
	</div>
	 <table class="table_ru">
       <tr>
			<td colspan="9" style="text-align: right; border: none;">
			<input id="addGoodsBtn" type="submit"style="background: #DCDCDC; color: #3C3C3C; border-radius: 5px; margin-top: 10px;" class="btn2 tclick" value="添加商品" onclick="loadAllGoods();"/>
			</td>
		</tr>
    </table>
	<div style="margin-top: 30px; width: 100%; height: 50px;">
		<ul style="float: left; margin-left: 10px;">
			<li style="margin-top: 30px; float: left;"><label><b style="color: red;">*</b>验收部门</label>&nbsp;&nbsp;
				<select id="signDepart" class="courseinput">
 			    </select>
 			</li>
			<li style="margin-top: 30px; float: left; margin-left: 215px;">
				<label><b style="color: red;">*</b>验收员</label>&nbsp;&nbsp; <input type="text"
				class="courseinput" id="signName">
			</li>
			<li style="clear: both; padding-top: 30px;">
				<table style="margin-left: 22px;">
					<tr>
						<td style="line-height: 20px;"><label><b style="color: red;">*</b>描述</label></td>
						<td style="padding-left: 10px;"><textarea id="remarks"
								style="resize: none;" name="description" cols="" rows=""
								class="textinput"></textarea></td>
					</tr>
				</table> <!-- <textarea style="resize: none;" name="description" cols="" rows="" class="textinput"></textarea> -->
			</li>
			<li><label>&nbsp; </label><input type="submit" class="btn2"
				style="position: absolute; right: 3%; margin-top: 30px; border-radius: 5px; background: #DCDCDC; color: #3C3C3C;"
				value="保    存"  onclick="addYSRk();"/></li>
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