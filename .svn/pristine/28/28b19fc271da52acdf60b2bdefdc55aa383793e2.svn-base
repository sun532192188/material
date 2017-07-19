<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>固定资产列表</title>                                                                                                                                                                                                    
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
	 });
	 
	 
	//检索商品信息
	function loadDepartStock(url){
		var goodsName = $("#goodsName").val();
		var type = $("#type option:selected").val();
		var categoryOne = $("#categoryOne option:selected").val();
		var categoryTwo  = $("#categoryTwo option:selected").val();
		location.href=url+"?goodsName="+goodsName+"&type="+type+"&categoryOne="+categoryOne+"&categoryTwo="+categoryTwo+"&goodsType=2&returnPage=departmentCenter/departStock/fixedList";
	}
	
	//查询二级分类
	function queryCategoryTwo(sourceId, targetId) {
		var categoryOneText = $("#" + sourceId + " option:selected").text();
		if (categoryOneText == '--请选择--') {
			operaAlert("warning", "警告提示", "请选择一级分类");
			return;
		}
		var categoryOneVal = $("#" + sourceId + " option:selected").val();
		$.ajax({
			type : "POST",
			url : "${ctx}/goods/queryCategoryByParentId",
			data : {
				"parentId" : categoryOneVal
			},
			success : function(result) {
				if (result.status != 200) {
					operaAlert("warning", "警告提示", "查询失败");
					return;
				}
				$("#" + targetId).html("");
				var resultHtml = "<option value=''>--请选择--</option>";
				var resultList = result.resultList;
				$.each(resultList, function(i, obj) {
					resultHtml += "<option value='" + obj.id + "'>" + obj.name
							+ "</option>";
				});
				$("#" + targetId).append(resultHtml);
			},
			error : function(result) {
				operaAlert("danger", "错误提示", "查询失败");
				return;
			}
		});
	}
	
	//更改固定资产状态
	function updateStatus(url){
		$("#FunctionContent").prop("src",url);
	}
</script>                                                                                                                                                                                                              
</head>                                                                                                                                                                                                                
<body>                        
    <input type="hidden" name="selectId" >                                                                                                                                                                                         
    <div class="rightinfo">                                                                                                                                                                                            
	    <div class="tools"> 
	    	<ul class="toolbar">
	    	     <li> <span><img src="${ctx}/resources/platform/images/d06.png" /></span>
			                      一级分类:&nbsp;&nbsp;
		            <select id="categoryOne" name="categoryOne" style="width:100px;height: 20px;" onchange="queryCategoryTwo('categoryOne','categoryTwo');">
		                <option value="">全部</option>
		                <c:forEach items="${categoryList}" var="category">
		                   <option value="${category.id}">${category.name}</option>
		                </c:forEach>
			       </select>
			     </li>
			     <li> <span><img src="${ctx}/resources/platform/images/d01.png" /></span>
			                      二级分类:&nbsp;&nbsp;
		            <select id="categoryTwo" name="categoryTwo" style="width:100px;height: 20px;" onchange="">
		                <option value="">全部</option>
			       </select>
			     </li>
			      <li> <span><img src="${ctx}/resources/platform/images/d06.png" /></span>
		                            入库类型:&nbsp;&nbsp;
	              <select id="type"  name="type" class="courseinput" style="width:150px;">
                      <option value="">--请选择--</option>
                       <option value="1" <c:if test="${queryArgs.type eq 1}">selected</c:if>>调拨</option>
                       <option value="2" <c:if test="${queryArgs.type eq 2}">selected</c:if>>领用</option>
		         </select>
		        </li>
			</ul>&nbsp;&nbsp;  
			       商品名称:                                                                                                                                                                                                       
        	<input id="goodsName" name="goodsName" type="text" value="${queryArgs.goodsName}"  class="courseinput"  style="border-radius:4px;" placeholder="商品名称"/>&nbsp;&nbsp;                                                                                                                                                               
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadDepartStock('${ctx}/departmentCenter/departStockPager')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>    
			    	<tr>   
				        <th>序号</th>                                                                                                                                                                                   
				        <th>商品名称</th>
				        <th>商品单价</th>
				        <th>商品类型</th>                                                                                                                                                                        
				         <th>单位</th>
				        <th>入库类型</th>
				        <th>状态</th>
				        <th>备注</th>
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="departStock" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${departStock.goodsName}" style="font-weight: bold; font-size: 14px; color: #8B4513;">${departStock.goodsName}</td>                                                                                                                                                                       
		        		   <td title="${departStock.goodsPrice}" style="font-weight: bold; color: red; font-size: 13px;">${departStock.goodsPrice}</td>     
		        		   <td>
		        		      <c:if test="${departStock.goodsType eq 1}">
		        		                      物资
		        		      </c:if>
		        		       <c:if test="${departStock.goodsType eq 2}">
		        		                      固定资产
		        		      </c:if>
		        		   </td>    
		        		   <td> ${departStock.spec}</td>   
		        		   <td>
		        		      <c:if test="${departStock.stockType eq 1}">
		        		                              调拨
		        		      </c:if>
		        		      <c:if test="${departStock.stockType eq 2}">
		        		                             领用          
		        		      </c:if>
		        		       <c:if test="${departStock.stockType eq 3}">
		        		                             部门调拨        
		        		      </c:if>
		        		   </td>
		        		   <td>
		        		      <c:if test="${departStock.status eq 1}">
		        		                      <a href="javascript:;" onclick="updateStatus('${ctx}/departmentCenter/updateStatusInit?status=${departStock.status}&fixedId=${departStock.id}');" style="color: blue;" class="tclick">未使用</a>
		        		      </c:if>
		        		      <c:if test="${departStock.status eq 2}">
		        		                      <a href="javascript:;" style="color: blue;" onclick="updateStatus('${ctx}/departmentCenter/updateStatusInit?status=${departStock.status}&fixedId=${departStock.id}');" class="tclick">使用中</a>
		        		      </c:if>
		        		       <c:if test="${departStock.status eq 3}">
		        		                              已损坏
		        		      </c:if>
		        		      <c:if test="${departStock.status eq 4}">
		        		                              已调拨
		        		      </c:if>
		        		   </td>
		        		    <td> ${departStock.remarks}</td>   
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="departStockPager?goodsName=${queryArgs.goodsName}&categoryOne=${queryArgs.categoryOne}&categoryTwo=${queryArgs.categoryTwo}&type=${queryArgs.type}&goodsType=2&returnPage=departmentCenter/departStock/fixedList" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
    <div class="tip" style="width:460px;height:330px;border-bottom: 4px solid #3E97C9;margin: auto;">
    	<div class="tiptop"><span>固定资产状态更改</span><a onclick="delAllTemp()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>                                                                                                                                                                                                             
</body>                                                                                                                                                                                                                
</html>                                                                                                                                                                                           