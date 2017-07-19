<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>部门月计划打印</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
   *{
     font-size:16px;
     font-family: Microsoft YaHei  /* arial,sans-serif */;
   }
    table{
        border-collapse: collapse;
        margin: auto;
    }
    table tr{
      height: 33px;
    }
    tr td{
        width: 60px;
        border: 1px solid blue;
        text-align: center;
    }
    .thCon{
      font-family: SimHei;
    }
   .header_ul li{
      float: left;
      list-style: none;
      margin-left:25%;
    }
    .content td{
	  font-size: 15px;
	}
    
</style>
<script src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	   var resultList =  eval('${resultList}');
	   var resultHtml = "";
	   $.each(resultList,function(i,obj){
		   if(i%35==0){
			  resultHtml += '<tr style="height: 60px;">'; 
			  resultHtml += '<td colspan="9" style="font-size:35px;border: none;vertical-align:top;">'; 
			  resultHtml += '${title}'; 
			  resultHtml += '</td>'; 
			  resultHtml += '</tr>'; 
			  resultHtml += '<tr>'; 
			  resultHtml += '<td style="text-align: left;border: none;width: 100%;" colspan="9">'; 
			  resultHtml += ' <ul class="header_ul">'; 
			  resultHtml += '<li style="margin-left:0%;">&nbsp;编制部门:&nbsp;${departmentName}</li>';
			  resultHtml += '<li>&nbsp;${time}</li>';
			  resultHtml += '<li>金额:&nbsp;元</li>';
              resultHtml += '</ul>';
              resultHtml += '</td>';
              resultHtml += '</tr>';
			  resultHtml += '<tr class="thCon">'; 
			  resultHtml += '<td>序号</td>'; 
			  resultHtml += '<td>编码</td>'; 
			  resultHtml += '<td>物资名称</td>'; 
			  resultHtml += '<td>规格</td>'; 
			  resultHtml += '<td>单位</td>'; 
			  resultHtml += '<td>单价</td>'; 
			  resultHtml += '<td>数量</td>'; 
			  resultHtml += '<td>金额</td>'; 
			  resultHtml += '<td>备注</td>'; 
			  resultHtml += '</tr>'; 
		   }
		   resultHtml += '<tr classs="content">';
		   resultHtml += '<td style="width: 5%;">'+(i+1)+'</td>';
		   resultHtml += '<td style="text-align: left; width: 13%;">'+obj.goodsNo+'</td>';
		   resultHtml += '<td style="text-align: left; width: 12%;">'+obj.goodsName+'</td>';
		   resultHtml += '<td style="text-align: left; width: 25%;">'+obj.specModel+'</td>';
		   resultHtml += '<td style="text-align: center; width: 5%;">'+obj.spec+'</td>';
		   resultHtml += '<td style="text-align: right; width: 10%;">'+obj.formatPrice+'</td>';
		   if(obj.goodsNum == null){
			   resultHtml += '<td style="text-align: right; width: 10%;"></td>'; 
		   }else{
			   resultHtml += '<td style="text-align: right; width: 7%;">'+obj.goodsNum+'</td>';
		   }
		   resultHtml += '<td style="text-align: right; width: 13%;">'+obj.formatMoney+'</td>';
		   resultHtml += '<td style="width: 8%;"></td>';
		   resultHtml += '</tr>'; 
		   
		   if((i+1)%35==0){
				  resultHtml += '<tr>'; 
				  resultHtml += '<td colspan="6" style="text-align: left;">&nbsp;合计金额(大写):&nbsp;${CN}</td>'; 
				  resultHtml += '<td colspan="3" style="text-align: left;">&nbsp;(小写):&nbsp;${sumMoney}元</td>'; 
				  resultHtml += '</tr>'; 
				  resultHtml += '<tr style="height: 65px;">'; 
				  resultHtml += '<td colspan="9" style="text-align: left;">&nbsp;${type}说明:&nbsp;</td>'; 
				  resultHtml += '</tr>'; 
				  resultHtml += '<tr>'; 
				  resultHtml += '<td colspan="7" style="text-align: left;border:none;">&nbsp;部门领导:</td>'; 
				  resultHtml += ' <td colspan="2" style="text-align: left;border:none;">经办人:</td>'; 
				  resultHtml += '</tr>';  
		   }
	   });
	   $("#goodsContent").append(resultHtml);
	   window.print();
	   location.href="${ctx}/departmentCenter/queryMonthPlanPager";
});
</script>
</head>
<body>

    <table align="center" style="width:98%;" id="goodsContent">
       <%--  <thead>
           <tr style="height: 60px;">
              <td colspan="9" style="font-size:35px;border: none;vertical-align:top;">
                  ${title}
              </td>
           </tr>
           <tr>
             <td style="text-align: left;border: none;width: 100%;" colspan="9">
                <ul class="header_ul">
                    <li style="margin-left:0%;">&nbsp;编制部门:&nbsp;${departmentName}</li>
                    <li>&nbsp;${time}</li>
                    <li>金额:&nbsp;元</li>
                 </ul>
             </td>
           </tr>
        </thead>
        <tbody>
           <tr class="thCon">
            <td style="width:6%;">序号</td>
            <td>编码</td>
            <td>物资名称</td>
            <td>规格</td>
            <td>单位</td>
            <td>单价</td>
            <td>数量</td>
            <td>金额</td>
            <td>备注</td>
           </tr>
           <c:forEach items="${resultList}" var ="plan" varStatus="in">
	            <tr>
		            <td style="text-align: center; width: 5%;">${in.count}</td>
		            <td style="text-align: left; width: 15%;">${plan.goodsNo}</td>
		            <td style="text-align: left; width: 15%;">${plan.goodsName}</td>
		            <td style="text-align: left; width: 15%;">${plan.specModel}</td>
		            <td style="text-align: center; width: 5%;">${plan.spec}</td>
		            <td style="text-align: right; width:12%;">${plan.formatPrice}</td>
		            <td style="text-align: right; width: 10%;">${plan.goodsNum}</td>
		            <td style="text-align: right; width: 13%;">${plan.formatMoney}</td>
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
              <td colspan="9" style="text-align: left;">&nbsp;说明:&nbsp;${remarks}</td>
           </tr>
           <tr>
             <td colspan="7" style="text-align: left;border:none;">&nbsp;部门领导:</td>
             <td colspan="2" style="text-align: left;border:none;">经办人:</td>
           </tr>
        </tfoot> --%>
    </table>
</body>
<script type="text/javascript">
	$(function() {
	    window.print();
	    location.href="${ctx}/departmentCenter/queryMonthPlanPager";
	});
</script>
</html>
