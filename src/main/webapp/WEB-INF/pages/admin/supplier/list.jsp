<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>供应商列表</title>                                                                                                                                                                                                    
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
	width: 150px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
}  
   .supplier_tbody tr{
      border: 1px dashed #d0d0d0;
   }  
</style>                                                                                                                                                                                                               
<script src="${ctx}/resources/js/jquery.min.js"></script>                                                                                                                                                              
<script type="text/javascript" src="${ctx}/resources/js/org.zh.plugins.js"></script>   
<script type="text/javascript" src="${ctx}/resources/js/org.cp.common.js"></script>   
<script type="text/javascript" src="${ctx}/resources/js/org.zh.common.js"></script>      
<script type="text/javascript" src="${ctx}/resources/chuchur/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>        
<script type="text/javascript" src="${ctx}/resources/chuchur/js/churCommon.js"></script>                                                                                                                                                     
<script type="text/javascript">                                                                                                                                                                                        
	 $(function(){
		 var msg="${msg}";
		 var type="{type}";
		 var title = "${title}";
		 if($.trim(msg)!=''&& $.trim(type)!='' && $.trim(title)!=''){
			 operaAlert(type,title,errorInfo);
		 }
	 });
	 
	//供应商操作
	/*   'success': '成功提示',
       'info': '询问提示',
       'warning': '警告提示',
       'primary': '权限提示',
       'danger': '出错提示' */
    //添加初始化
	function supplierOpera(url){
		 $("#FunctionContent").prop("src",url);
	}
	 
	//检索供应商
	function loadSupplier(url){
		var supplierName = $("#supplierName").val();
		var phone = $("#phone").val();
		var address = $("#address").val();
		location.href=url+"?supplierName="+supplierName+"&phone="+phone+"&address="+address;
	}
	
	//实现库存出库打印与导出
	function dataExport(operatType){
		var supplierName = $("#supplierName").val();
		var phone = $("#phone").val();
		var address = $("#address").val();
		var url ="${ctx}/dataOperatController/supplierOperat?supplierName="+supplierName+"&phone="+phone+"&address="+address+"&rows="+1000000+"&operatType="+operatType;
		if(operatType == 1){
			location.href = url;
		}else{
			 window.open(url);
		}
	}
	
	//更新初始化
	function updateInit(id){
		 $("#FunctionContent").prop("src",'${ctx}/supplier/updateInit?supplierId='+id);
	}

</script>                                                                                                                                                                                                              
</head>                                                                                                                                                                                                                
<body>                        
    <input type="hidden" name="selectId" >                                                                                                                                                                                         
    <div class="rightinfo">                                                                                                                                                                                            
	    <div class="tools"> 
	    	<ul class="toolbar">
	    	    <li> <span><img src="${ctx}/resources/platform/images/d04.png" /></span>
			       <a href="javascript:;" onclick="supplierOpera('${ctx}/supplier/addInit');" class="tclick"> 添加供应商</a>
			     </li> 
			</ul>&nbsp;&nbsp;                                                                                                                                                                                           
			 名称:                                                                                                                                                                                                       
        	<input id=supplierName name="supplierName" type="text" value="${supplierArgs.supplierName}"  class="courseinput"  style="border-radius:4px;" placeholder="请输入简称/全称"/>&nbsp;&nbsp;                                                                                                                                                               
        	   电话:                                                                                                                                                                                                       
        	<input id="phone" onkeyup="value=value.replace(/[^\d]/g,'')" name="phone" type="text" value="${supplierArgs.phone}"  class="courseinput" style="border-radius:4px;" placeholder="请输入电话"/>&nbsp;&nbsp;
        	地址:
        	<input id="address" name="address" type="text" value="${supplierArgs.address}" class="courseinput" style="border-radius:4px;" placeholder="请输入地址"/>&nbsp;&nbsp;                                                                                                                                  
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadSupplier('${ctx}/supplier/querySupplierList')" value="检&nbsp;&nbsp;索"/>&nbsp;&nbsp;
    		<input type="button" style="text-align: center;" class="btn2" onclick="dataExport(1);" value="打&nbsp;&nbsp;印"/> &nbsp;&nbsp;
    		    		<input type="button" style="text-align: center;" class="btn2" onclick="dataExport(2);" value="导&nbsp;&nbsp;出"/> 
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>                                                                                                                                                                                             
			    	<tr>   
				        <th>序号</th>                                                                                                                                                                                   
				        <th>简称</th>                                                                                                                                                                                 
				        <th>全称</th> 
				        <th>联系人</th> 
				        <th>电话</th>     
				        <th>地址</th>
				        <th>开户行</th>
				        <th>持卡人</th>
				        <th>开户行地址</th>
				        <th>银行卡号</th>
				        <th>操作</th>
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody class="supplier_tbody">                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="supplier" varStatus="in">                                                                                                                                         
		        		<tr class="check">
		        		    <td style="width: 5%;">
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${supplier.shortName}" style="width: 8%;word-break:break-all;overflow: hidden;">${supplier.shortName}</td>                                                                                                                                                                       
		        			<td title="${supplier.fullName}"  style="width: 8%;word-break:break-all;overflow: hidden">
		        			  ${supplier.fullName}
		        			</td>
		        			<td style="width: 5%;word-break:break-all;overflow: hidden">${supplier.linkman}</td>                                                                                                                                                                     
		        			<td style="width: 9%;word-break:break-all;overflow: hidden">${supplier.phone}</td>   
		        		    <td style="width: 15%;word-break:break-all;overflow: hidden">${supplier.address}</td> 
		        		    <td style="width: 15%;word-break:break-all;overflow: hidden">${supplier.bank}</td>  
		        		    <td style="width: 10%;word-break:break-all;overflow: hidden">${supplier.cardholder}</td>
		        		    <td style="width: 10%;word-break:break-all;overflow: hidden">${supplier.bankAddr}</td>
		        		    <td style="width: 10%;word-break:break-all;overflow: hidden">${supplier.bankCard}</td>
		        		    <td style="width: 5%;word-break:break-all;overflow: hidden">
		        		       <a href="javascript:void(0);" onclick="updateInit(${supplier.id});" class="tclick">修改</a>
		        		     <!--   &nbsp;&nbsp;&nbsp;
		        		       <a href="">删除</a> -->
		        		     </td>
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="querySupplierList?supplierName=${supplierArgs.supplierName}&phone=${supplierArgs.phone}&address=${supplierArgs.address}" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
     <div class="tip" style="width:50%;height:500px;left:25%;">
    	<div class="tiptop"><span>供应商操作</span><a onclick="reloadTemplets()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>                                                                                                                                                                                                               
</body>                                                                                                                                                                                                                
</html>                                                                                                                                                                                           