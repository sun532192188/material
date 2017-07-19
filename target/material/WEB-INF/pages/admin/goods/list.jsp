<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>商品列表</title>                                                                                                                                                                                                    
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
</style>                                                                                                                                                                                                               
<script src="${ctx}/resources/js/jquery.min.js"></script>                                                                                                                                                              
<script type="text/javascript" src="${ctx}/resources/js/org.zh.plugins.js"></script>   
<script type="text/javascript" src="${ctx}/resources/js/org.cp.common.js"></script>   
<script type="text/javascript" src="${ctx}/resources/js/org.zh.common.js"></script>      
<script type="text/javascript" src="${ctx}/resources/chuchur/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript" src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>        
<script type="text/javascript" src="${ctx}/resources/chuchur/js/churCommon.js"></script>  
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>                                                                                                                                                    
<script type="text/javascript">                                                                                                                                                                                        
	 $(function(){
		 var msg="${msg}";
		 var type="{type}";
		 var title = "${title}";
		 if($.trim(msg)!=''&& $.trim(type)!='' && $.trim(title)!=''){
			 operaAlert(type,title,errorInfo);
		 }
		 var categoryOne="${queryArgs.categoryOne}";
		 if(categoryOne != null && categoryOne != "" && categoryOne != undefined){
			 $("#categoryOne").val(categoryOne);
		 }
		 var categoryTwo="${queryArgs.categoryTwo}";
		 function setTwoCategory(){
			 $("#categoryTwo").val(categoryTwo);
		 }
		 if(categoryTwo != null && categoryTwo != "" && categoryTwo != undefined){
			 queryCategoryTwo('categoryOne','categoryTwo');
			 setTimeout(setTwoCategory,50);
		 }
		 var supplierId="${queryArgs.supplierId}";
		 if(supplierId != null &supplierId != "" && supplierId != undefined){
			 querySupplier("supplierId","${ctx}/supplier/queryAllSuppler");
			 setTimeout(setSupplierId,50);
		 }else{
			 querySupplier("supplierId","${ctx}/supplier/queryAllSuppler");
		 }
		 function setSupplierId(){
			 $("#supplierId").val(supplierId);
		 }
		 var status="${queryArgs.status}";
		 if(status != null && status != "" && status != undefined){
			 $("#status").val(status);
		 }
	 });
	 
    //添加初始化
	function addInit(url){
		 $("#FunctionContent").prop("src",url);
	}
	 
	//检索商品信息
	function loadGoods(url){
		var goodsName = $("#goodsName").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		var status = $("#status option:selected").val();
		var supplierId = $("#supplierId option:selected").val();
		location.href=url+"?goodsName="+goodsName+"&categoryOne="+categoryOne+"&categoryTwo="+categoryTwo+"&status="+status+"&supplierId="+supplierId+"&returnType=1";
	}
	
	//实现库存出库打印与导出
	function dataExport(operatType){
		var goodsName = $("#goodsName").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo = $("#categoryTwo option:selected").val();
		var status = $("#status option:selected").val();
		var supplierId = $("#supplierId option:selected").val();
		var url = "${ctx}/dataOperatController/goodsDataOperat?goodsName=" + goodsName + "&categoryOne="
				+ categoryOne + "&categoryTwo=" + categoryTwo + "&status="
				+ status+"&operatType="+operatType+"&supplierId="+supplierId+"&rows="+1000000+"&title=商品列表"+"&returnType=1";
		if(operatType == 1){
			location.href = url;
		}else{
			 window.open(url);
		}
	}
	
	 //更新初始化
	function updateInit(id){
		 $("#FunctionContent").prop("src",'${ctx}/goods/updateInit?goodsId='+id);
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
	  <div class="queryArea">
		<table class="kucun">
	       <tr>
	          <td>
	           <%--  <c:if test="${loginManager.roleName eq '超级管理员' or loginManager.roleName eq '采购办'}"> --%>
	                                        商品操作:&nbsp;&nbsp;<input type="button" value="添  加  商  品" class="btn2 tclick" onclick="addInit('${ctx}/goods/addInit');">
	         <%--    </c:if> --%>
	          </td>
		        <td>
				       一级分类:&nbsp;&nbsp;
		            <select id="categoryOne" name="categoryOne" class="courseinput" onchange="queryCategoryTwo('categoryOne','categoryTwo');">
		                <option value="">全部</option>
		                <c:forEach items="${categoryList}" var="category">
		                   <option value="${category.id}">${category.name}</option>
		                </c:forEach>
			       </select>
		        </td>
		        <td>
				         二级分类:&nbsp;&nbsp;
		            <select id="categoryTwo" name="categoryTwo" class="courseinput">
		                <option value="">全部</option>
			       </select>
		       </td>
	       </tr>
	       <tr>
		        <td>
				   &nbsp;供应商:&nbsp;&nbsp;
		            <select id="supplierId" name="supplierId" class="courseinput">
		                <option value="">全部</option>
			       </select>
			   </td>
			   <td>
			        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;状态:&nbsp;&nbsp;
		            <select id="status" name="categoryOne" class="courseinput" >
		                <option value="0">上架中</option>
		                <option value="1">已下架</option>
			       </select>
			   </td>
			   <td>
			                 商品名称:&nbsp;&nbsp;&nbsp;<input id="goodsName" name="goodsName" type="text" value="${queryArgs.goodsName}"  class="courseinput" placeholder="商品名称"/>                            
			   </td>
	       </tr>
	       <tr>
	        <td colspan="3" style="text-align: center;">
	           <input type="button" style="text-align: center;" class="btn2"  onclick="loadGoods('${ctx}/goods/queryGoodsPager')" value="检&nbsp;&nbsp;索"/>  
	           &nbsp;&nbsp;
			   <input type="button" style="text-align: center;" class="btn2" onclick="dataExport('1')" value="打&nbsp;&nbsp;印" />
			   &nbsp;&nbsp;
			   <input type="button" style="text-align: center;" class="btn2" onclick="dataExport('2')" value="导&nbsp;&nbsp;出" />
	        </td>
	    </tr> 
	    </table>
    </div>
	                                                                                                                                                                                    
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>                                                                                                                                                                                             
			    	<tr>   
				        <th>序号</th>      
				        <th>编码</th>                                                                                                                                                                             
				        <th>商品名称</th>
				        <th>规格型号</th> 
				        <th>单位</th>
				        <th>单价</th>                                                                                                                                                                        
				        <th>类型</th>
				       <!--  <th>所属一级分类</th> -->
				        <th>所属分类</th>
				        <th>所属供应商</th>
				        <th>状态</th>
				        <th style="width:20%;">操作</th> 
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="goods" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>          
		        		    <td title="${goods.goodsNo}">${goods.goodsNo}</td>                                                                                                                                                                        
		        			<td title="${goods.goodsName}">${goods.goodsName}</td> 
		        		    <td title="${goods.specModel}">${goods.specModel}</td>     
		        		   <td title="${goods.spec}">${goods.spec}</td>                                                                                                                                                                         
		        		   <td title="${goods.price}">${goods.price}</td>     
		        		   <td>
		        		     <c:if test="${goods.goodsType eq 1}">
		        		                     物资
		        		     </c:if>
		        		      <c:if test="${goods.goodsType eq 2}">
		        		                     固定资产
		        		     </c:if>
		        		   </td>     
		        		<%--    <td title="${goods.categoryOneName}">${goods.categoryOneName}</td>      --%>
		        		   <td title="${goods.categoryTwoName}">${goods.categoryTwoName}</td>     
		        		   <td title="${goods.supplierName}">${goods.supplierName}</td>     
		        		   <td style="font-size: 13px; color:  red;font-weight: bold;">
		        		     <c:if test="${goods.status eq 0}">
		        		                      上架中
		        		     </c:if>
		        		     <c:if test="${goods.status eq 1}">
		        		                      已下架
		        		     </c:if>
		        		    </td>   
		        		     <%-- <c:if test="${loginManager.roleName eq '超级管理员' or loginManager.roleName eq '采购办'}"> --%>
		        		      <td>
		        		        <a href="javascript:void(0);" onclick="updateInit(${goods.id});" class="tclick">修改</a>&nbsp;&nbsp;
		        		          <c:if test="${goods.status eq 0}">
		        		              <a href="javascript:void(0);" onclick="delGoods(${goods.id});">下架</a>
		        		          </c:if>
		        		          <c:if test="${goods.status eq 1}">
		        		              <a href="javascript:void(0);" onclick="delGoods(${goods.id});">上架</a>
		        		          </c:if>
		        		     </td> 
		        		    <%--  </c:if>      --%>
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="queryGoodsPager?goodsName=${goodsQueryArgs.goodsName}&categoryOne=${goodsQueryArgs.categoryOne}&categoryTwo=${goodsQueryArgs.categoryTwo}&status=${goodsQueryArgs.status}&supplierId=${goodsQueryArgs.supplierId}&returnType=1" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
     <div class="tip" style="width:50%;height:500px;left:25%;">
    	<div class="tiptop"><span>商品操作</span><a onclick="reloadTemplets()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>                                                                                                                                                                                                               
</body>                                                                                                                                                                                                                
</html>                                                                                                                                                                                           