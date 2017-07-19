<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>供应商打印</title>
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
</head>
<body>

    <table align="center" style="width: 95%;">
        <thead>
           <tr style="height: 70px;vertical-align:top;">
               <td colspan="10" style="font-size:35px;border: none;vertical-align:top;">
                                                 供   应   商   信   息
              </td>
           </tr>
           <tr>
             <td colspan="4" style="text-align: left;border: none;">&nbsp;供应商:&nbsp;${supplierName}</td>
             <td colspan="4" style="text-align: left;border: none;">&nbsp;电话:&nbsp;${phone}</td>
             <td colspan="2" style="text-align: left;border: none;">&nbsp;地址:&nbsp;${address}</td>
           </tr>
           <tr>
	            <td>序号</td>
	            <td>简称</td>
	            <td>全称</td>
	            <td>联系人</td>
	            <td>联系电话</td>
	            <td>地址</td>
	            <td>开户行</td>
	            <td>持卡人姓名</td>
	            <td>开户行所在地</td>
	            <td>银行卡帐号</td>
	            <td>备注</td>
           </tr>
           
        </thead>
        <tbody>
           <c:forEach items="${resultList}" var ="supplier" varStatus="in">
	            <tr class="content">
		            <td>${in.count}</td>
		            <td>${supplier.shortName}</td>
		            <td>${supplier.fullName}</td>
		            <td>${supplier.linkman}</td>
		            <td>${supplier.phone}</td>
		            <td>${supplier.address}</td>
		            <td>${supplier.bank}</td>
		            <td>${supplier.cardholder}</td>
		            <td>${supplier.bankAddr}</td>
		            <td>${supplier.bankCard}</td>
		            <td></td>
	           </tr>
           </c:forEach>
        </tbody>
    </table>
</body>
<script type="text/javascript">
	$(function() {
	    window.print();
	   /*  var supplierName = $("#supplierName").val();
		var phone = $("#phone").val();
		var address = $("#address").val(); */
	    var url = "${ctx}/supplier/querySupplierList";
	    //+"?supplierName="+supplierName+"&phone="+phone+"&address="+address
	    location.href=url;
	});
</script>
</html>
