<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>部门月计划</title>                                                                                                                                                                                                    
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
	width: 130px;
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
	 
    //添加初始化
	function addInit(url){
		 $("#FunctionContent").prop("src",url);
	}
	 
	//检索商品信息
	function loadGoods(url){
		var planName = $("#planName").val();
		var status = $("#status option:selected").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		location.href=url+"?planName="+planName+"&startDate="+startDate+"&endDate="+endDate+"&status="+status;
	}
	
	//实现库存出库打印与导出
	function dataExport(planId,planName,departmentName,sumMoney,time,operatType){
	    sumMoney = sumMoney.replace(",","");
		var url ="${ctx}/dataOperatController/departMonthPlan?planId="+planId+"&title="+planName+"&departmentName="+departmentName+"&sumMoney="+sumMoney+"&time="+time+"&operatType="+operatType;
		if(operatType == 1){
			location.href = url;
		}else{
			 window.open(url);
		}
	}
	
	//加载计划商品
	function loadPlanGoods(url){
		$("#FunctionContent").prop("src",url);
	}
</script>                                                                                                                                                                                                              
</head>                                                                                                                                                                                                                
<body>                        
    <input type="hidden" name="selectId" >                                                                                                                                                                                         
    <div class="rightinfo">                                                                                                                                                                                            
	    <div class="tools"> 
	    	<ul class="toolbar">
	    	    <li> <span><img src="${ctx}/resources/platform/images/d04.png" /></span>
			       <a href="javascript:;" onclick="addInit('${ctx}/departmentCenter/addInit');" class="tclick">月计划申请&nbsp;&nbsp;</a>
			     </li> 
			     <li> <span><img src="${ctx}/resources/platform/images/d06.png" /></span>
		                           状态:&nbsp;&nbsp;
	              <select id="status"  name="status" class="courseinput" style="width:150px;">
                      <option value="">--请选择--</option>
                      <option value="0" <c:if test="${queryArgs.status eq 0}">selected</c:if>>未申请</option>
                      <option value="1" <c:if test="${queryArgs.status eq 0}">selected</c:if>>已申请</option>
		         </select>
		        </li>
			</ul>&nbsp;&nbsp;  
			   开始时间:                                                                                                                                                                                                       
        	 <input id="startDate" name="startDate" type="text" value="${queryArgs.startDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp; 
        	     结束时间:                                                                                                                                                                                                       
        	 <input id="endDate" name="endDate" type="text" value="${queryArgs.endDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp;                                                                                                                                                                                                                                
			       计划名称:                                                                                                                                                                                                       
        	<input id="planName" name="planName" type="text" value="${queryArgs.planName}"  class="courseinput"  style="border-radius:4px;" placeholder="计划名称"/>&nbsp;&nbsp;                                                                                                                                                               
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadGoods('${ctx}/departmentCenter/queryMonthPlanPager')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>                                                                                                                                                                                             
			    	<tr>   
				        <th>序号</th>                                                                                                                                                                                   
				        <th>计划名称</th>
				        <th>部门名称</th>
				        <th>创建日期</th>                                                                                                                                                                        
				        <th>总金额</th>
				        <th>申请状态</th>
				        <th>备注</th>
				        <th>操作</th>
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="plan" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td style="width:15%;white-space: nowrap;overflow: hidden;" title="${plan.planName}">${plan.planName}</td>                                                                                                                                                                       
		        		   <td style="width:8%;white-space: nowrap;overflow: hidden;" title="${plan.departmentName}">${plan.departmentName}</td>     
		        		   <td style="width:10%;white-space: nowrap;overflow: hidden;" title="${plan.createDate}">${plan.createDate}</td>     
		        		   <td style="width:10%;white-space: nowrap;overflow: hidden;" title="${plan.formatMoney}">${plan.formatMoney}</td>     
		        		   <td style="width:8%;white-space: nowrap;overflow: hidden;">
		        		      <c:if test="${plan.status eq 0}">
		        		                             未申请
		        		      </c:if>
		        		      <c:if test="${plan.status eq 1}">
		        		                       已申请
		        		      </c:if>
		        		   </td>
		        		    <td title="${plan.remarks}" style="width:20%;white-space: nowrap;overflow: hidden;">${plan.remarks}</td>          
		        		    <td style="width:20%;white-space: nowrap;overflow: hidden;">
	        		            <c:if test="${plan.status eq 0}">
	        		               <a style="color:blue;" href="javascript:;" class="tclick" onclick="loadPlanGoods('${ctx}/departmentCenter/queryMonthPlanGoods?planId=${plan.id}&departmentName=${plan.departmentName}&sumMoney=${plan.formatMoney}&type=0');">申请</a>&nbsp;&nbsp;
	        		           </c:if> 
	        		           <c:if test="${plan.status eq 1}">
	        		                <a style="color:blue;" href="javascript:;" class="tclick" onclick="loadPlanGoods('${ctx}/departmentCenter/queryMonthPlanGoods?planId=${plan.id}&departmentName=${plan.departmentName}&sumMoney=${plan.formatMoney}&type=1');">查看申请</a>&nbsp;&nbsp;
	        		           </c:if> 
	        		            <a style="color:blue;" href="javascript:void(0);" onclick="dataExport(${plan.id},'${plan.planName}','${plan.departmentName}','${plan.formatMoney}','${plan.createDate}',1);">打印</a>&nbsp;&nbsp;
	        		            <a style="color:blue;" href="javascript:void(0);" onclick="dataExport(${plan.id},'${plan.planName}','${plan.departmentName}','${plan.formatMoney}','${plan.createDate}',2);">导出</a>&nbsp;&nbsp;
		        		     </td> 
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">  
	    	<jsp:param value="queryMonthPlanPager?planName=${queryArgs.planName}&startDate=${queryArgs.startDate}&endDate=${queryArgs.endDate}&status=${queryArgs.status}" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
    <div class="tip alert_operat_div" >
    	<div class="tiptop"><span>添加月计划</span><a onclick="delAllTemp()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>                                                                                                                                                                                                             
</body>                                                                                                                                                                                                                
</html>                                                                                                                                                                                           