<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>部门用户列表</title>                                                                                                                                                                                                    
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
	function departOpera(url){
		 $("#FunctionContent").prop("src",url);
	}
	 
	//检索部门信息
	function loadDepart(url){
		var departName = $("#departName").val();
		var phone = $("#phone").val();
		location.href=url+"?departName="+departName+"&phone="+phone;
	}
	
	 //更新初始化
	function updateInit(id){
		 $("#FunctionContent").prop("src",'${ctx}/department/updateInit?departId='+id);
	} 
	

</script>                                                                                                                                                                                                              
</head>                                                                                                                                                                                                                
<body>                        
    <input type="hidden" name="selectId" >                                                                                                                                                                                         
    <div class="rightinfo">                                                                                                                                                                                            
	    <div class="tools"> 
	    	<ul class="toolbar">
	    	    <li> <span><img src="${ctx}/resources/platform/images/d04.png" /></span>
			       <a href="javascript:;" onclick="departOpera('${ctx}/department/addInit');" class="tclick">添加部门&nbsp;&nbsp;</a>
			     </li> 
			</ul>&nbsp;&nbsp;                                                                                                                                                                                           
			 名称:                                                                                                                                                                                                       
        	<input id=departName name="departName" type="text" value="${departName}"  class="courseinput"  style="border-radius:4px;" placeholder="请输入部门名称"/>&nbsp;&nbsp;                                                                                                                                                               
        	   电话:                                                                                                                                                                                                       
        	<input id="phone" name="phone" type="text" value="${phone}"  class="courseinput" style="border-radius:4px;" placeholder="请输入电话" onkeyup="value=value.replace(/[^\d]/g,'')"/>&nbsp;&nbsp;
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadDepart('${ctx}/department/queryDepartList')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>                                                                                                                                                                                             
			    	<tr>   
				        <th style="width:10%;">序号</th>                                                                                                                                                                                   
				        <th  style="width:20%;">部门名称</th>
				        <th style="width:50%;">部门电话</th>                                                                                                                                                                                 
				       <!--  <th>描述</th>  -->
				        <th style="width:20%;">操作</th> 
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="department" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${department.departmentName}">${department.departmentName}</td>                                                                                                                                                                       
		        		    <td title="${department.phone}" style="width: 100px;overflow: hidden;">${department.phone}</td>                        
		        		    <td>
		        		       <a href="javascript:void(0);" onclick="updateInit(${department.id});" class="tclick">修改</a>
		        		     </td> 
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                                                                                                                                                                                                         
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="queryDepartList?departName=${departName}&phone=${phone}" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
     <div class="tip" style="width:50%;height:500px;left:25%;">
    	<div class="tiptop"><span>部门操作</span><a onclick="reloadTemplets()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>                                                                                                                                                                                                               
</body>                                                                                                                                                                                                                
</html>                                                                                                                                                                                           