<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>物资领用汇总表</title> -->
<style type="text/css">
   .head{
      margin: auto;
   }
   .head li{
      float: left;
      list-style: none;
      margin-left: 150px;
   }
   
   .con{
     clear:both;
     width: 100%;
     border-collapse:collapse;
   }
   .con tr{
     height: 30px;
   }
   .con tr td {
      text-align: center;
      border: 1px solid black; 
   }
   .con tr th{
   border: 1px solid black; 
   }
</style>


</head>
<body>
  
  <h2 align="center">物资领用汇总表</h2>
  <ul class="head">
     <li style="margin-left: -30px;">供应商:${supplier}</li>
     <li>时间:${time}</li>
     <li>金额单位:元</li>
  </ul>
  <table align="center" class="con">
     <tr>
        <th>序号</th>
        <th>部门</th>
        <th>金额</th>
        <th>备注</th>
     </tr>
     <c:forEach items="${resultList}" var="department" varStatus="in">        
	      <tr>
	        <td>${in.count}</td>
	        <td>${department.departmentName}</td>
	        <td>${department.phone}</td>
	        <td>${idepartment.description}</td>
	     </tr>
     </c:forEach>
  </table>
</body>
<script type="text/javascript">
    window.onload = function(){
	   window.print();
   };
   window.close = function(){
	   alert(11111);
   }
</script>
</html>