<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>出库列表</title>                                                                                                                                                                                                    
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
	 
	//检索出库信息
	function loadConsume(url){
	    var operatNo = $("#operatNo").val();
	    var type = $("#type option:selected").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		location.href=url+"?operatNo="+operatNo+"&startDate="+startDate+"&endDate="+endDate+"&type="+type;
	}
	
	//加载计划商品
	function addInit(url){
		$("#FunctionContent").prop("src",url+"?returnPage=departmentCenter/outStock/outstock");
	}
	
	function loadCKGoods(ckNo,operatNo,ckDate,sumMoney){
		sumMoney = sumMoney.replace(",","");
		var url ="${ctx}/departmentCenter/queryCkGoodsList?ckNo="+ckNo+"&operatNo="+operatNo+"&ckDate="+ckDate+"&sumMoney="+sumMoney;
		$("#FunctionContent").prop("src",url);
	}
	
	 //更新初始化
	function updateInit(id){
		 $("#FunctionContent").prop("src",'${ctx}/departmentCenter/updateConsumeInit?consumeId='+id);
	} 
	 
	//实现库存出库打印与导出
	function dataExport(operatType,ckId){
	  /*   var operatNo = $("#operatNo").val();
	    var type = $("#type option:selected").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val(); */
		var url ="${ctx}/dataOperatController/departCKOperat?title=部门物资出库单&ckId="+ckId+"&operatType="+operatType;
		if(operatType == 1){
			location.href = url;
		}else{
			 window.open(url);
		}
	}
	
	//入账
	function lockOperat(operatId){
		$.ajax({
			type:"POST",
			url:"${ctx}/departmentCenter/lockConsumeInfo",
			data:{"consumeId":operatId},
			success:function(result){
				if(result.status == 200){
					operaAlert("success","成功提示","入账成功");
					 $("#chur").click(function() {
		    			 window.location.reload();
		 			});
				}else{
					operaAlert("warning","警告提示","入账失败");
					return;
				}
			},
			error:function(result){
				operaAlert("warning","警告提示","入账失败");
			}
		});
	}
</script>                                                                                                                                                                                                              
</head>                                                                                                                                                                                                                
<body>                        
    <input type="hidden" name="selectId" >                                                                                                                                                                                         
    <div class="rightinfo">                                                                                                                                                                                            
	    <div class="tools"> 
	    	<ul class="toolbar">
	    	    <li> <span><img src="${ctx}/resources/platform/images/d04.png" /></span>
			       <a href="javascript:;" onclick="addInit('${ctx}/departmentCenter/addInit');" class="tclick">物资出库&nbsp;&nbsp;</a>
			     </li> 
			     <li> <span><img src="${ctx}/resources/platform/images/d06.png" /></span>
		                           类型:&nbsp;&nbsp;
	              <select id="type"  name="type" class="courseinput" style="width:150px;">
                      <option value="">--全部--</option>
                      <option value="1" <c:if test="${queryArgs.type eq 1}">selected</c:if>>本部门使用</option>
                      <option value="2" <c:if test="${queryArgs.type eq 2}">selected</c:if>>调拨给其他部门</option>
		         </select>
		        </li>
			</ul>&nbsp;&nbsp;  
			   开始时间:                                                                                                                                                                                                       
        	 <input id="startDate" name="startDate" type="text" value="${queryArgs.startDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp; 
        	     结束时间:                                                                                                                                                                                                       
        	 <input id="endDate" name="endDate" type="text" value="${queryArgs.endDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp;                                                                                                                                                                                                                                
			     出库编号:                                                                                                                                                                                                       
        	<input id="operatNo" name="operatNo" type="text" value="${queryArgs.operatNo}"  class="courseinput"  style="border-radius:4px;" placeholder="出库编号"/>&nbsp;&nbsp;                                                                                                                                                               
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadConsume('${ctx}/departmentCenter/materialConsumePager')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>      
			    	<tr>   
				        <th>序号</th>                                                                                                                                                                                   
				        <th>出库编号</th>
				        <th>出库日期</th>
				        <th>总金额</th>                                                                                                                                                                        
				        <th>出库类型</th>
				        <th>使用部门</th>
				        <th style="width: 320px;white-space: nowrap;overflow: hidden;">备注</th>
				        <th>操作</th>
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="consume" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${consume.operatNo}">${consume.operatNo}</td>                                                                                                                                                                       
		        		   <td title="${consume.consumeDate}">${consume.consumeDate}</td>     
		        		   <td title="${consume.consumeMoney}">${consume.consumeMoney}</td>     
		        		   <td>
		        		      <c:if test="${consume.type eq 1}">
		        		                             本部门使用
		        		      </c:if>
		        		      <c:if test="${consume.type eq 2}">
		        		                       调拨其他部门
		        		      </c:if>
		        		   </td>
		        		   <td title="${consume.tartgetDepartName}">${consume.tartgetDepartName}</td>  
		        		   <td title="${consume.remarks}">${consume.remarks}</td>   
		        		   <td>
		        		      <c:if test="${consume.status eq 0}">
		        		            <a href="javascript:void(0);" onclick="updateInit(${consume.id});" class="tclick">修改</a>&nbsp;&nbsp;
		        		             <a href="javascript:void(0);" onclick="lockOperat(${consume.id});">入账</a>&nbsp;&nbsp;
		        		        </c:if>
		        		        <c:if test="${consume.status eq 1}">
		        		           <a style="color:blue;" href="javascript:;" class="tclick" onclick="loadCKGoods(${consume.id},'${consume.operatNo}','${consume.consumeDate}','${consume.consumeMoney}');">查看出库物资</a>&nbsp;&nbsp;
		        		        </c:if>
		        		         <a href="javascript:void(0);" onclick="dataExport(1,${consume.id});">打印</a>&nbsp;&nbsp;
		        		         <a href="javascript:void(0);" onclick="dataExport(2,${consume.id});">导出</a>
		        		   </td>
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="materialConsumePager?operatNo=${queryArgs.operatNo}&startDate=${queryArgs.startDate}&endDate=${queryArgs.endDate}&type=${queryArgs.type}" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
    <div class="tip alert_operat_div">
    	<div class="tiptop"><span>部门物资出库</span><a onclick="delAllTemp()"></a></div>
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
</script>                                                                                                                                                                                                          
</html>                                                                                                                                                                                           