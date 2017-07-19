<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>库存入库统计</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
   *{
     font-size:20px;
     font-family: arial,sans-serif;
   }
    table{
        border-collapse: collapse;
        margin: auto;
    }
    table tr{
      height: 42px;
    }
    tr td{
        width: 60px;
        border: 1px solid blue;
        text-align: center;
    }
     .content td{
	  font-size: 15px;
	}
</style>
<script src="${ctx}/resources/js/jquery.min.js"></script>
<!--  <script type="text/javascript">
   $(function(){
	   var goodsList =  eval('${goodsList}');
	   var resultHtml = "";
	   var title = "${title}";
	   $.each(goodsList,function(i,obj){
		   if(i%50==0){
			  resultHtml += ' <tr style="height: 60px;">'; 
			  resultHtml += '<td colspan="7" style="font-size:35px;border: none;vertical-align:top;">'; 
			  resultHtml += '${title}'; 
			  resultHtml += '</td>'; 
			  resultHtml += '</tr>'; 
			  resultHtml += '<tr>'; 
			  resultHtml += ' <td colspan="3" style="text-align: left;border: none;">&nbsp;商品名称:&nbsp;${goodsName}</td>'; 
			  resultHtml += '<td colspan="2" style="text-align: left;border: none;">&nbsp;类别:&nbsp;${categoryOneName}</td>'; 
			  resultHtml += '<td colspan="=2" style="text-align: left;border: none;">&nbsp;子类:&nbsp;${categoryTwoName}</td>'; 
			  resultHtml += '</tr>'; 
			  resultHtml += '<tr style="font-family: SimHei;font-size: 16px;">'; 
			  resultHtml += '<td>序号</td>'; 
			  resultHtml += '<td>编码</td>'; 
			  resultHtml += '<td>物资名称</td>'; 
			  resultHtml += '<td>规格型号</td>'; 
			  resultHtml += '<td>单位</td>'; 
			  resultHtml += '<td>单价</td>'; 
			  resultHtml += '<td>备注</td>'; 
			  resultHtml += '</tr>'; 
		   }
		   resultHtml += '<tr>';
		   resultHtml += '<td style="width: 8%;">'+(i+1)+'</td>';
		   resultHtml += '<td style="width: 20%;text-align: left;">'+obj.goodsNo+'</td>';
		   resultHtml += '<td style="width: 20%;text-align: left;">'+obj.goodsName+'</td>';
		   resultHtml += '<td style="width: 20%;text-align: left;">'+obj.specModel+'</td>';
		   resultHtml += ' <td style="width: 15%;text-align: center;">'+obj.spec+'</td>';
		   if(obj.price == null){
			   resultHtml += '<td style="width: 10%;text-align: right;"></td>';
		   }else{
			   resultHtml += '<td style="width: 10%;text-align: right;">'+obj.price+'</td>';
		   }
		   resultHtml += '<td style="width: 7%;"></td>';
		   resultHtml += '</tr>';
		   if((i+1)%50==0){
			      var CN = "${CN}";
			      var sumMoney = "${sumMoney}";
				  /* resultHtml += '<tfoot>';  */
				/*   resultHtml += '<tr>'; 
				  resultHtml += '<td colspan="4" style="text-align: left;">&nbsp;合计金额(大写):&nbsp;'+CN+'</td>'; 
				  resultHtml += '<td colspan="3" style="text-align: left;">&nbsp;(小写):&nbsp;'+sumMoney+'元</td>'; 
				  resultHtml += '</tr>';  */
				  resultHtml += '<tr style="height: 65px;">'; 
				  resultHtml += '<td colspan="7" style="text-align: left;">&nbsp;说明:&nbsp;</td>'; 
				  resultHtml += '</tr>'; 
				/*   resultHtml += '<tr>'; 
				  resultHtml += '<td colspan="5" style="text-align: left;border:none;">&nbsp;部门领导:</td>'; 
				  resultHtml += '<td colspan="2" style="text-align: left;border:none;">经办人:</td>'; 
				  resultHtml += '</tr>';  */
				 /*  resultHtml += '</tfoot>';  */
		 }
	   });
	  $("#goodsContent").append(resultHtml);
	  window.print();
	  var url = "${ctx}/goods/queryGoodsPager";
	  location.href= url;
   });
</script>  -->
</head>
<body>
    <table align="center" style="width: 95%;">
        <thead>
           <tr style="height: 70px;vertical-align:top;">
              <td colspan="9" style="border: none;">
             <!--  font-size:50px;border:1px solid red;height:60px;margin-top: 5px;border-bottom:1px solid black; -->
                 <b style=" font-size:35px;text-decoration:underline; padding-bottom:5px;border-bottom:3px solid black;">${statisTime}库    存    物    资    出    库    统    计</b>
             
              </td>
           </tr>
           <tr>
             <td colspan="4" style="text-align: left;border: none;">&nbsp;部门名称:&nbsp;${departmentName}</td>
             <td colspan="4" style="text-align: left;border: none;">&nbsp;${nowTime}</td>
             <td colspan="1" style="text-align: left;border: none;">&nbsp;金额:&nbsp;${sumMoney}元</td>
           </tr>
           <tr>
	            <td>序号</td>
	            <td>编码</td>
	            <td>物资名称</td>
	            <td>规格型号</td>
	            <td>单位</td>
	            <td>单价</td>
	            <td>数量</td>
	            <td>金额</td>
	            <td>备注</td>
           </tr>
           
        </thead>
        <tbody>
           <c:forEach items="${resultList}" var ="plan" varStatus="in">
	            <tr class="content">
	            
		            <td>${in.count}</td>
		            <td>${plan.goodsNo}</td>
		            <td>${plan.goodsName}</td>
		            <td>${plan.specModel}</td>
		            <td>${plan.spec}</td>
		            <td>${plan.goodsPrice}</td>
		            <td>${plan.goodsNum}</td>
		            <td>${plan.singleMoney}</td>
		            <td></td>
	           </tr>
           </c:forEach>
        </tbody>
        <tfoot>
           <tr>
              <td colspan="6" style="text-align: left;">&nbsp;合计金额(大写):&nbsp;${CN}</td>
              <td colspan="3" style="text-align: left;">&nbsp;(小写):&nbsp;${sumMoney}元</td>
           </tr>
           <tr style="height: 65px;">
              <td colspan="9" style="text-align: left;">&nbsp;统计记录:&nbsp;</td>
           </tr>
           <tr>
             <td colspan="7" style="text-align: left;border:none;">&nbsp;部门领导:</td>
             <td colspan="2" style="text-align: left;border:none;">经办人:</td>
           </tr>
        </tfoot>
    </table>
</body>
<script type="text/javascript">
	$(function() {
	    window.print();
	    var goodsName = "${queryArgs.goodsName}";
	    var categoryOne = "${queryArgs.categoryOne}";
	    var categoryTwo = "${queryArgs.categoryTwo}";
	    var departId = "${queryArgs.departId}";
	    var startDate ="${queryArgs.startDate}";
	    var endDate ="${queryArgs.endDate}";
	    var useAlloctType ="${queryArgs.useAlloctType}";
	    var title = "${queryArgs.title}";
	    var url = "";
	    if(title == null || title == "" || title == undefined){
	    	url = "${ctx}/storage/staticsStoragePager";
	    }else{
	    	url = "${ctx}/departmentCenter/statisDepartStorage";
	    }
	    location.href=url+"?goodsName="+goodsName+"&categoryOne="+categoryOne+"&categoryTwo="+categoryTwo+"&departId="+departId+"&startDate="+startDate
	    		+"&endDate="+endDate+"&useAlloctType="+useAlloctType;
	});
</script>
</html>
