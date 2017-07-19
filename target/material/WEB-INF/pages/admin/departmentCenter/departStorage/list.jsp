<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>部门入库列表</title>                                                                                                                                                                                                    
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet" type="text/css" />   
<link rel="stylesheet" type="text/css" href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/chuchur/css/formui.css" />
 <link rel="stylesheet" type="text/css" href="${ctx}/resources/chuchur/css/chur.css" />                                                                                                                            
<style type="text/css">                                                                                                                                                                                                
	tr.check {                                                                                                                                                                                                         
		cursor: pointer;   
	}                                                                                                                                                                                                                  
	.checked {                                                                                                                                                                                                         
		background: #bbb;                                                                                                                                                                                              
	}
    .courseinput {
	width: 180px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
}    
</style>                                                                                                                                                                                                               
<script src="${ctx}/resources/js/jquery.min.js"></script> 
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>                                                                                                                                                                  
<script type="text/javascript" src="${ctx}/resources/js/org.zh.plugins.js"></script>   
<script type="text/javascript" src="${ctx}/resources/js/org.cp.common.js"></script>   
<script type="text/javascript" src="${ctx}/resources/js/org.zh.common.js"></script>      
<script type="text/javascript" src="${ctx}/resources/chuchur/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>        
<script type="text/javascript" src="${ctx}/resources/chuchur/js/churCommon.js"></script>  
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>     
<script type="text/javascript" src="${ctx}/resources/My97DatePicker/WdatePicker.js"></script>       
<script type="text/javascript">                                                                                                                                                                                        
	 $(function(){
		 var msg="${msg}";
		 var type="{type}";
		 var title = "${title}";
		 if($.trim(msg)!=''&& $.trim(type)!='' && $.trim(title)!=''){
			 operaAlert(type,title,errorInfo);
		 }
	 });
	//检索领用单
	function loadRK(url){
		var operatNo = $("#operatNo").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		location.href=url+"?&operatNo="+operatNo+"&startDate="+startDate+"&endDate="+endDate+"&type=3";
	}
	
	 
</script>                                                                                                                                                                                                              
</head>                                                                                                                                                                                                                
<body>                        
    <input type="hidden" name="selectId" >                                                                                                                                                                                         
    <div class="rightinfo">                                                                                                                                                                                            
	    <div class="tools"> 
			    调拨编号:                                                                                                                                                                                                       
        	<input id="operatNo" name="operatNo" type="text" value="${queryArgs.operatNo}"  class="courseinput"  style="border-radius:4px;" placeholder="领用/调拨编码"/>&nbsp;&nbsp;  
        	   开始时间:                                                                                                                                                                                                       
        	<input id="startDate" name="startDate" type="text" value="${queryArgs.startDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp; 
        	    结束时间:                                                                                                                                                                                                       
        	<input id="endDate" name="endDate" type="text" value="${queryArgs.endDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp;                                                                                                                                                                                                                                                                    
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadRK('${ctx}/useAlloct/queryUseAlloctPager')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		     <table class="tablelist">                                                                                                                                                                                  
		    	<thead>    
			    	<tr>   
				        <th>序号</th>                                                                                                                                                                                   
				        <th>编号</th>
				        <th>部门</th>
				        <th>接收员</th>  
				        <th>物资金额</th>    
				        <th>日期</th>                                                                                                                                                                   
				        <th>类型</th>
				        <th>操作</th>
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="useAlloct" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${useAlloct.operatNo}">${useAlloct.operatNo}</td>                                                                                                                                                                       
		        		   <td title=">${useAlloct.departName}">${useAlloct.departName}</td>     
		        		   <td title="${useAlloct.useName}">${useAlloct.useName}</td>     
		        		   <td title="${useAlloct.sumMoney}">${useAlloct.sumMoney}</td>    
		        		   <td title="${useAlloct.useAlloctDate}">${useAlloct.useAlloctDate}</td>      
		        		   <td>
		        		      <c:if test="${useAlloct.type eq 1}">
		        		                      调拨
		        		      </c:if>
		        		       <c:if test="${useAlloct.type eq 2}">
		        		                         领用            
		        		      </c:if>
		        		       <c:if test="${useAlloct.type eq 3}">
		        		                         部门调拨
		        		      </c:if>
		        		   </td>   
		        		   <td><a href="javascript:void(0);" class="tclick" onclick="queryUseAlloctGoods(${useAlloct.id},'${useAlloct.departName}','${useAlloct.operatNo}','${useAlloct.sumMoney}');">查看商品</a></td>  
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                     
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="queryUseAlloctPager?departId=${queryArgs.departId}&operatNo=${queryArgs.operatNo}&startDate=${queryArgs.startDate}&endDate=${queryArgs.endDate}&type=3" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    <div class="tip alert_operat_div">
    	<div class="tiptop"><span>物资列表</span><a onclick="delAllTemp()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
   </div>                                                                                                                                                                                                                
</body>    
<script type="text/javascript">
  function delAllTemp(){
	  window.frames["FunctionContent"].delOldGoods();
  }
  
  //根据单号查询商品信息
  function queryUseAlloctGoods(useAlloctId,departName,operatNo,sumMoney){
	 sumMoney = sumMoney.replace(",","");
	 $("#FunctionContent").prop("src","${ctx}/useAlloct/queryGoodsByUseAlloctId?useAlloctId="+useAlloctId+"&departName="+departName+"&operatNo="+operatNo+"&sumMoney="+sumMoney);
  }
</script>                                                                                                                                                                                                            
</html>                                                                                                                                                                                           