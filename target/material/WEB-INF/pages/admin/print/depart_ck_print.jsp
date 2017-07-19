<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>部门出库打印</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
* {
	font-size: 20px;
	font-family: arial, sans-serif;
}

table {
	border-collapse: collapse;
	margin: auto;
}

table tr {
	height: 38px;
}

tr td {
	width: 60px;
	border: 1px solid blue;
	text-align: center;
}

.content td{
  font-size: 15px;
}


.print_title td {
	font-family: SimHei;
	font-weight: bold;
}
 .header_ul li{
    float: left;
    list-style: none;
    margin-left:25%;
 }
</style>
<script src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
 $(function(){
	  var resultList =  eval('${resultList}');
	   var resultHtml = "";
	   var resultFoot1 = "";
	   var resultFoot2 = "";
	   var divContent = "";
	   $.each(resultList,function(i,obj){
		   if(i%10==0){
			  resultHtml += '<table  style="width: 98%;float:left;">'; 
			  resultHtml += '<tr style="height:70px; vertical-align: top;">'; 
			  resultHtml += '<td colspan="10" style="border: none;" align="center">'; 
			  resultHtml += '<span style="width:34%;height:50px; border-bottom:1px solid red;margin-left: 33%;">'; 
			  resultHtml += '<span style="width:100%;height:45px; border-bottom:1px solid red;font-size: 35px;text-align: center;">'; 
			  resultHtml += '部     门     物     资     出     库     单'; 
			  resultHtml += '</span>'; 
			  resultHtml += '</span>'; 
			  resultHtml += '</td>'; 
			  resultHtml += '</tr>';
			  resultHtml += '<tr>';
			  resultHtml += '<td colspan="10" style="border:none;">';
			  resultHtml += '<table style="width:100%;">';
			  resultHtml += '<tr>';
			  resultHtml += '<td style="35%;text-align: left; border: none;">&nbsp;部门名称:&nbsp;${departName}</td>'; 
			  resultHtml += '<td style="30%;text-align:right; border: none;">&nbsp;时间:&nbsp;${time}</td>'; 
			  resultHtml += '<td style="35%;text-align:right; border: none;">&nbsp;编号:&nbsp;${operatNo}&nbsp;</td>'; 
			  resultHtml += '</tr>';
			  resultHtml += '</table>';
			  resultHtml += '</td>';
              resultHtml += '</tr>';
              resultHtml += '<tr class="print_title">'; 
			  resultHtml += '<td style="font-family: SimHei; font-weight: bold;">序号</td>'; 
			  resultHtml += '<td>编码</td>'; 
			  resultHtml += '<td>物资名称</td>'; 
			  resultHtml += '<td>规格</td>'; 
			  resultHtml += '<td>单位</td>'; 
			  resultHtml += '<td>单价</td>'; 
			  resultHtml += '<td>数量</td>'; 
			  resultHtml += '<td>金额</td>'; 
			  resultHtml += '<td>质量状况</td>'; 
			  resultHtml += '<td>备注</td>'; 
			  resultHtml += '</tr>';
		   }
		   resultHtml += '<tr class="content">';
		   resultHtml += '<td style="text-align: center; width: 5%;">'+(i+1)+'</td>';
		   resultHtml += '<td style="text-align: left; width: 11%;">'+obj.goodsNo+'</td>';
		   resultHtml += '<td style="text-align: left; width: 12%;">'+obj.goodsName+'</td>';
		   resultHtml += '<td style="text-align: left; width: 26%;">'+obj.specModel+'</td>';
		   resultHtml += '<td style="text-align: center; width: 5%;">'+obj.spec+'</td>';
		   resultHtml += '<td style="text-align: right; width: 9%;">'+obj.formatPrice+'</td>';
		   if(obj.goodsNum == null){
			   resultHtml += '<td style="text-align: right; width: 6%;"></td>'; 
		   }else{
			   resultHtml += '<td style="text-align: right; width: 6%;">'+obj.goodsNum+'</td>';
		   }
		   resultHtml += '<td style="text-align: right; width: 9%;">'+obj.formatMoney+'</td>';
		   resultHtml += '<td style="width: 9%;"></td>';
		   resultHtml += '<td style="width: 6%;"></td>';
		   resultHtml += '</tr>'; 
		   if((i+1)%10==0){
				  resultHtml += '<tr>'; 
				  resultHtml += '<td colspan="6" style="text-align: left;">&nbsp;合计金额(大写):&nbsp;${CN}</td>'; 
				  resultHtml += '<td colspan="4" style="text-align: left;">&nbsp;(小写):&nbsp;${sumMoney}元</td>'; 
				  resultHtml += '</tr>'; 
				  resultHtml += '<tr style="height: 65px;">'; 
				  resultHtml += '<td colspan="10" style="text-align: left;">&nbsp;${type}出库用途:&nbsp;</td>'; 
				  resultHtml += '</tr>'; 
				  
				  resultFoot1 += '<tr style="border-bottom: 1px dashed black;height: 79px;">'; 
				  resultFoot1 += '<td colspan="3" style="text-align: left; border: none;">&nbsp;负责人:</td>'; 
				  resultFoot1 += '<td colspan="4" style="text-align: left; border: none;">保管员:</td>'; 
				  resultFoot1 += '<td colspan="3" style="text-align: left; border: none;">领用人:</td>'; 
				  resultFoot1 += '</tr>';  
				  resultFoot1 += '</table>';
				  resultFoot1 +='<div style="float: left;margin-top: 23%;">第<br/>一<br/>联<br/>部<br/>门<br/>留<br/>存</div>';
				  
				  resultFoot2 += '<tr>'; 
				  resultFoot2 += '<td colspan="3" style="text-align: left; border: none;">&nbsp;负责人:</td>'; 
				  resultFoot2 += '<td colspan="4" style="text-align: left; border: none;">保管员:</td>'; 
				  resultFoot2 += '<td colspan="3" style="text-align: left; border: none;">领用人:</td>'; 
				  resultFoot2 += '</tr>';  
				  resultFoot2 += '</table>';
				  resultFoot2 +='<div style="float: left;margin-top: 23%;">第<br/>二<br/>联<br/>交<br/>采<br/>购<br/>办</div>';
				  divContent += resultHtml+resultFoot1+"<div style='height:40px;clear: both;padding-top:2%;'>&nbsp;&nbsp;<div>"+resultHtml+resultFoot2;
				  resultHtml="";
				  resultFoot1="";
			      resultFoot2="";
		   }
	   });
	    $("#content").append(divContent); 
	  /*  $("#bottomContent").append(resultHtml+resultFoot2); */
		window.print();
		var url = "${ctx}/departmentCenter/materialConsumePager";
		location.href = url;
}); 
</script>
</head>
<body>
   <div id="content" style=""></div>
    <%--  <div id="topContent">
      <table  style="width: 98%;float:left;">
		<thead>
			<tr style="height:70px; vertical-align: top;">
				<td colspan="10" style="border: none;" align="center">
				    <span style="width:34%;height:50px; border-bottom:1px solid red;margin-left: 33%;">
				       <span style="width:100%;height:45px; border-bottom:1px solid red;font-size: 35px;text-align: center;">
				                            部     门     物     资     出     库     单
				       </span>
				    </span>
					<!-- <b style="height:150px;border:1px solid red;">
					部     门     物     资     出     库 
						<a href="#" style="font-size: 35px;border-bottom: 2px solid black;" >部     门     物     资     出     库     单</a>
				     </b> -->
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: left; border: none;">&nbsp;部门名称:&nbsp;${departName}</td>
				<td colspan="4" style="text-align: left; border: none;">&nbsp;时间:&nbsp;${time}</td>
			    <td colspan="3" style="text-align: left; border: none;">&nbsp;编号:&nbsp;${operatNo}</td>
			</tr>
			<tr class="print_title">
				<td style="font-family: SimHei; font-weight: bold;">序号</td>
				<td>编码</td>
				<td>物资名称</td>
				<td>规格型号</td>
				<td>单位</td>
				<td>单价</td>
				<td>数量</td>
				<td>金额</td>
				<td>质量状况</td>
				<td>备注</td>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="storage" varStatus="in">
				<tr class="content">
					<td style="text-align: center; width: 5%;">${in.count}</td>
					<td style="text-align: left; width: 12%;">${storage.goodsNo}</td>
					<td style="text-align: left; width: 18%;">${storage.goodsName}</td>
					<td style="text-align: left; width: 15%;">${storage.specModel}</td>
					<td style="text-align: center; width: 5%;">${storage.spec}</td>
					<td style="text-align: right; width: 7%;">${storage.formatPrice}</td>
					<td style="text-align: right; width: 7%;">${storage.goodsNum}</td>
					<td style="text-align: right; width: 10%;">${storage.formatMoney}</td>
					<td style="width: 10%;"></td>
					<td style="width: 8%;"></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6" style="text-align: left;">&nbsp;合计金额(大写):&nbsp;${CN}</td>
				<td colspan="4" style="text-align: left;">&nbsp;(小写):&nbsp;${sumMoney}元</td>
			</tr>
			<tr style="height: 65px;">
				<td colspan="10" style="text-align: left;">&nbsp;${type}出库用途:&nbsp;</td>
			</tr>
			<tr style="border-bottom: 1px dashed black;height: 79px;">
				<td colspan="3" style="text-align: left; border: none;">&nbsp;负责人:</td>
				<td colspan="4" style="text-align: left; border: none;">报关员:</td>
				<td colspan="3" style="text-align: left; border: none;">领用人:</td>
			</tr>
		</tfoot>
	</table>
	<div style="float: left;margin-top: 20%;">第<br/>一<br/>联<br/>部<br/>门<br/>留<br/>存</div> 
   </div> --%>
    <%--  <div style="position: absolute;top:53%;" id="bottomContent">
    <table  style="width: 98%;float:left;">
		<thead>
			<tr style="height: 70px; vertical-align: top;">
				<td colspan="10" style="border: none;">
			      <span style="width:34%;height:50px; border-bottom:1px solid red;margin-left: 33%;">
				       <span style="width:100%;height:45px; border-bottom:1px solid red;font-size: 35px;text-align: center;">
				                            部     门     物     资     出     库     单
				       </span>
				    </span>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: left; border: none;">&nbsp;部门名称:&nbsp;${departName}</td>
				<td colspan="4" style="text-align: left; border: none;">&nbsp;时间:&nbsp;${time}</td>
			    <td colspan="3" style="text-align: left; border: none;">&nbsp;编号:&nbsp;${operatNo}</td>
			</tr>
			<tr class="print_title">
				<td style="font-family: SimHei; font-weight: bold;">序号</td>
				<td>物资编码</td>
				<td>物资名称</td>
				<td>规格型号</td>
				<td>单位</td>
				<td>单价</td>
				<td>数量</td>
				<td>金额</td>
				<td>质量状况</td>
				<td>备注</td>
			</tr>

		</thead>
		<tbody>
			<c:forEach items="${resultList}" var="storage" varStatus="in">
				<tr class="content">
					<td style="text-align: center; width: 5%;">${in.count}</td>
					<td style="text-align: left; width: 12%;">${storage.goodsNo}</td>
					<td style="text-align: left; width: 18%;">${storage.goodsName}</td>
					<td style="text-align: left; width: 15%;">${storage.specModel}</td>
					<td style="text-align: center; width: 5%;">${storage.spec}</td>
					<td style="text-align: right; width: 7%;">${storage.formatPrice}</td>
					<td style="text-align: right; width: 7%;">${storage.goodsNum}</td>
					<td style="text-align: right; width: 10%;">${storage.formatMoney}</td>
					<td style="width: 10%;"></td>
					<td style="width: 8%;"></td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6" style="text-align: left;">&nbsp;合计金额(大写):&nbsp;${CN}</td>
				<td colspan="4" style="text-align: left;">&nbsp;(小写):&nbsp;${sumMoney}元</td>
			</tr>
			<tr style="height: 65px;">
				<td colspan="10" style="text-align: left;">&nbsp;${type}出库用途:&nbsp;</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: left; border: none;">&nbsp;负责人:</td>
				<td colspan="4" style="text-align: left; border: none;">报关员:</td>
				<td colspan="3" style="text-align: left; border: none;">领用人:</td>
			</tr>
		</tfoot>
	</table>
	<div style="float: left;margin-top: 20%;">第<br/>二<br/>联<br/>交<br/>采<br/>购<br/>办</div>
   </div> --%>
</body>
</html>
