<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"                                                                                                                                                        
    pageEncoding="UTF-8"%>                                                                                                                                                                                             
<%@include file="/include/commons.jsp" %>                                                                                                                                                                              
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">                                                                                                                 
<html>                                                                                                                                                                                                                 
<head>                                                                                                                                                                                                                 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>                                                                                                                                                    
<meta http-equiv="X-UA-Compatible" content = "IE=edge,chrome=1" />
<title>用户列表</title>                                                                                                                                                                                                    
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
	 });
	 
    //添加初始化
	function addInit(url){
		 $("#FunctionContent").prop("src",url);
	}
	 
	//检索商品信息
	function loadUser(url){
		var userName = $("#userName").val();
		var remove = $("#remove option:selected").val();
		location.href=url+"?userName="+userName+"&remove="+remove;
	}
	
	 //更新初始化
	function updateInit(id){
		 $("#FunctionContent").prop("src",'${ctx}/user/updateInit?userId='+id);
	} 
	 
	 //删除用户
	 function delUser(userId){
		 if(userId == null || userId == "" || userId == undefined){
			 operaAlert("warning","警告提示","请选择删除用户");
			 return;
		 }
		 $.ajax({
			 type:"POST",
			 data:{"id":userId},
			 url:"${ctx}/user/delUser",
			 success:function(result){
				 if(result.status != 200 ){
					 operaAlert("warning","警告提示",result.msg); 
					 return;
				 }
				 operaAlert("success","操作成功",result.msg);
				 $("#chur").click(function() {
				     window.location.reload();		
				 });
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
			       <a href="javascript:;" onclick="addInit('${ctx}/user/addInit');" class="tclick">添加用户&nbsp;&nbsp;</a>
			     </li> 
			     <li> <span><img src="${ctx}/resources/platform/images/d03.png" /></span>
			                      状态:&nbsp;&nbsp;
		            <select id="remove" name="remove" style="width:100px;height: 20px;" >
		                <c:if test="${empty remove}">
		                   <option value="" selected="selected">--请选择--</option>
		                   <option value="0">正常</option>
		                   <option value="1">已移除</option>
		                </c:if>
		                <c:if test="${remove eq 0}">
		                   <option value="">--请选择--</option>
		                   <option value="0" selected="selected">正常</option>
		                   <option value="1">已移除</option>
		                </c:if>
		                <c:if test="${remove eq 1}">
		                   <option value="">--请选择--</option>
		                   <option value="0">正常</option>
		                   <option value="1"  selected="selected">已移除</option>
		                </c:if>
			       </select>
			     </li>
			</ul>&nbsp;&nbsp;                                                                                                                                                                                           
			    用户名:                                                                                                                                                                                                       
        	<input id="userName" name="userName" type="text" value="${userName}"  class="courseinput"  style="border-radius:4px;" placeholder="用户名称"/>&nbsp;&nbsp;                                                                                                                                                               
    		<input type="button" style="text-align: center;" class="btn2" onclick="loadUser('${ctx}/user/queryUserPager')" value="检&nbsp;&nbsp;索"/>  
	    </div>                                                                                                                                                                         
	    <div>                                                                                                                                                                          
		    <table class="tablelist">                                                                                                                                                                                  
		    	<thead>                                                                                                                                                                                             
			    	<tr> 
				        <th>序号</th>                                                                                                                                                                                   
				        <th>用户名</th>
				        <th>所属部门</th>
				        <th>所属角色</th>                                                                                                                                                                        
				        <th>状态</th>
				        <th style="width:20%;">操作</th> 
			       </tr>                                                                                                                                                                                              
		        </thead>                                                                                                                                                                                               
		        <tbody>                                                                                                                                                                                  
		        	<c:forEach items="${pages.rows}" var="user" varStatus="in">                                                                                                                                         
		        		<tr>
		        		    <td>
		        		       ${in.count}
		        		    </td>                                                                                                                                                                             
		        			<td title="${user.userName}">${user.userName}</td>                                                                                                                                                                       
		        		   <td title="${user.departmentName}">${user.departmentName}</td>   
		        		    <td title="${user.roleName}">${user.roleName}</td>       
		        		   <td>
		        		      <c:if test="${user.remove eq 0}">
		        		                                       正常
		        		      </c:if>
		        		       <c:if test="${user.remove eq 1}">
		        		                                         已移除
		        		      </c:if>
		        		   </td>    
		        		    <td>
		        		        <a href="javascript:void(0);" onclick="updateInit(${user.id});" class="tclick">修改</a>&nbsp;&nbsp;
		        		        <a href="javascript:void(0);" onclick="delUser(${user.id});">移除</a>&nbsp;&nbsp;
		        		     </td> 
		        		</tr>                                                                                                                                                                                          
		        	</c:forEach>                                                                                                                                                                                       
		        </tbody>                                                                                                                                                                                               
		    </table>                                                                                                                                                                                                   
	    </div>                                                                                                                                                                                               
	    <jsp:include page="/commons/pager.jsp">                                                                                                                                                                        
	    	<jsp:param value="queryUserPager?userName=${userName}&roleId=${roleId}&remove=${remove}" name="url"/>                                                                                                                                                 
	    </jsp:include>                                                                                                                                                                                                 
    </div> 
    
     <div class="tip" style="width:50%;height:480px;left: 25%;">
    	<div class="tiptop"><span>用户操作</span><a onclick="reloadTemplets()"></a></div>
      	<div style="height:90%;">
      		 <iframe height="100%" width="100%" src="" scrolling="auto" frameborder="0" vspale="0" marginWidth="0" marginHeight="0" frameSpacing="0" name="FunctionContent" id="FunctionContent">
     		</iframe>
        </div>
    </div>                                                                                                                                                                                                               
</body>                                                                                                                                                                                                                
</html>                                                                                                                                                                                           