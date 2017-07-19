<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>预存列表</title>                                                                                                                                                                                                    
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
	width: 140px;
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
		 querySupplier("supplierId","${ctx}/supplier/queryAllSuppler");
		 function yanshiSupplier(){
			 var supplierId = "${queryArgs.supplierId}";
			 if(supplierId != null && supplierId != "" && supplierId != undefined){
				 $("#supplierId").val(supplierId);
			 }
		 }
		 setTimeout(yanshiSupplier,80);
	 });
	 
    //添加初始化
	function addInit(url){
		 $("#FunctionContent").prop("src",url);
	}
	 
	//检索商品信息
	function loadYSRK(url){
		var supplierId = $("#supplierId option:selected").val();
		var operatNo = $("#operatNo").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		location.href=url+"?supplierId="+supplierId+"&operatNo="+operatNo+"&startDate="+startDate+"&endDate="+endDate+"&type=2";
	}
	
	//实现库存出库打印与导出
	function dataExport(operatType,storageId,supplierId){
		var url ="${ctx}/dataOperatController/yanshouAndYucunOperat?storageId="+storageId+"&type=2&operatType="+operatType+"&title=物资预存入库单&supplierId="+supplierId;
		if(operatType == 1){
			location.href = url;
		}else{
			 window.open(url);
		}
	}
	
	 //更新初始化
	function updateInit(id){
		 $("#FunctionContent").prop("src",'${ctx}/storage/updateStorageInit?storageId='+id+"&storageType=2");
	} 
	
	//入账
	function lockOperat(operatId){
		$.ajax({
			type:"POST",
			url:"${ctx}/storage/lockStorageInfo",
			data:{"storageId":operatId},
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
	
	 //删除商品
	 function delGoods(goodsId){
		 if(goodsId == null || goodsId == "" || goodsId == undefined){
			 operaAlert("warning","警告提示","请选择删除商品");
			 return;
		 }
		 $.ajax({
			 type:"POST",
			 data:{"goodsId":goodsId},
			 url:"${ctx}/goods/delGoods",
			 success:function(result){
				 if(result == 'isNull'){
					 operaAlert("warning","警告提示","参数为空"); 
					 return;
				 }else if(result=='success'){
					 operaAlert("success","警告提示","移除成功"); 
					 $("#chur").click(function(){
						 window.location.reload();
					 });
				 }else{
					 operaAlert("danger","警告提示","移除失败"); 
					 return;
				 }
			 },
			 error:function(result){
				 operaAlert("danger","错误提示","删除失败");
				 return;
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
			       <a href="javascript:;" onclick="addInit('${ctx}/storage/addInit?type=2');" class="tclick">预存入库&nbsp;&nbsp;</a>
			     </li> 
		       <li> <span><img src="${ctx}/resources/platform/images/d06.png" /></span>
		                      供应商:&nbsp;&nbsp;
	            <select id="supplierId"  name="supplierId" class="courseinput" style="width:150px;">
		       </select>
		     </li>
			</ul>&nbsp;&nbsp;                                                                                                                                                                                           
			    预存编号:                                                                                                                                                                                                       
        	<input id="operatNo" name="operatNo" type="text" value="${queryArgs.operatNo}"  class="courseinput"  style="border-radius:4px;" placeholder="预存编号"/>&nbsp;&nbsp;  
        	   开始时间:                                                                                                                                                                                                       
        	<input id="startDate" name="startDate" type="text" value="${queryArgs.startDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp; 
        	    结束时间:                                                                                                                                                                                                       
        	<input id="endDate" name="endDate" type="text" value="${queryArgs.endDate}"   class="courseinput" readonly="readonly"  onclick="WdatePicker();"/>&nbsp;&nbsp;                                                                                                                                                                                                                                                                    
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadYSRK('${ctx}/storage/queryStorage')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		     <table class="tablelist">                                                                                                                                                                                  
		    	<thead>                                                                                                                                                                                             
			    	<tr>   
				        <th>序号</th>                                                                                                                                                                                   
				        <th>入库编号</th>
				        <th>入库类型</th>
				        <th>供应商</th>                                                                                                                                                                        
				        <th>物资金额</th> 
				        <th>入库日期</th>
				        <th>操作部门</th>
				        <th>操作员</th>
				        <th style="width:20%;">操作</th> 
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="storage" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${storage.storageNo}">${storage.storageNo}</td>                                                                                                                                                                       
		        		   <td title="${storage.storageType}">
		        		      <c:if test="${storage.storageType eq 1}">
		        		                     验收
		        		      </c:if>
		        		      <c:if test="${storage.storageType eq 2}">
		        		                    预存
		        		      </c:if>
		        		   </td>     
		        		   <td title="${storage.supplierName}">${storage.supplierName}</td>     
		        		   <td title="${storage.storageMoney}">${storage.storageMoney}</td>     
		        		   <td title="${storage.storageDate}">${storage.storageDate}</td>     
		        		   <td title="${storage.department}">${storage.department}</td>     
		        		   <td title="${storage.signName}">${storage.signName}</td>   
		        		   <td>
		        		        <c:if test="${storage.status eq 0}">
		        		            <a href="javascript:void(0);" onclick="updateInit(${storage.id});" class="tclick">修改</a>&nbsp;&nbsp;
		        		             <a href="javascript:void(0);" onclick="lockOperat(${storage.id});">入账</a>&nbsp;&nbsp;
		        		        </c:if>
		        		        <c:if test="${storage.status eq 1}">
		        		           <a href="javascript:void(0);" onclick="queryStorageGoods(${storage.id},'${storage.supplierName}','${storage.storageNo}','${storage.storageMoney}');" class="tclick">查看商品</a>&nbsp;&nbsp;
		        		        </c:if>
		        		         <a href="javascript:void(0);" onclick="dataExport(1,${storage.id},${storage.supplierId});">打印</a>&nbsp;&nbsp;
		        		         <a href="javascript:void(0);" onclick="dataExport(2,${storage.id},${storage.supplierId});">导出</a>
		        		   </td>  
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                     
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="queryStorage?supplierId=${queryArgs.supplierId}&operatNo=${queryArgs.operatNo}&startDate=${queryArgs.startDate}&endDate=${queryArgs.endDate}&type=1" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
     <div class="tip alert_operat_div">
    	<div class="tiptop"><span>入库商品</span><a></a></div>
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
  function queryStorageGoods(id,supplierName,operatNo,sumMoney){
	  sumMoney = sumMoney.replace(",","");
	 $("#FunctionContent").prop("src","${ctx}/storage/queryStorageGoods?id="+id+"&supplierName="+supplierName+"&operatNo="+operatNo+"&sumMoney="+sumMoney+"&returnPage=storage/storage_goods");
  }
</script>                                                                                                                                                                                                            
</html>                                                                                                                                                                                           