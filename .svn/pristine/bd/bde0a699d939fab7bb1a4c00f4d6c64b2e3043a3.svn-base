<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>分类列表</title>
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/formui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/chur.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/ztree/css/zTreeStyle.css">
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
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.plugins.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.cp.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/ChurAlert.min.js?skin=blue"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/ztree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/myZtree.js"></script>
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
	function categoryAddInit(url){
		 var parentId = $("#parentId",window.parent.document).val();
		 var parentName = $("#parentName",window.parent.document).val();
		 if(parentId == '' || parentId == null || parentId == undefined){
			 parentId = 0;
		 }
		 if(parentName == '' || parentName == null || parentName == undefined){
			 parentName = "类目树";
		 }
		 $("#FunctionContent").prop("src",url+"?parentId="+parentId+"&parentName="+parentName);
	}
	 
	//检索分类信息
	function loadCategory(url){
		var parentId = $("#parentId",window.parent.document).val();
		var categoryName = $("#categoryName").val();
		var status = $("#status option:selected").val();
		location.href=url+"?categoryName="+categoryName+"&status="+status+"&parentId="+parentId;
	}
	
	//移除分类
	function delCategory(categoryId){
		$.ajax({
		    url:"${ctx}/category/delCategory",
		    type:"POST",
		    data:{"categoryId":categoryId},
		    success:function(data){
		    	if(data.status ==  500){
		    		operaAlert("warning","错误提示",data.msg);
			    	return;
		    	}else{
		    		operaAlert("success","操作成功",data.msg);
		    		$("#chur").click(function(){
		    			location.reload();
		    			window.parent.getCategory(0); 
		    		});
		    	}
		    },
		    error:function(data){
		    	operaAlert("danger","错误提示",data.msg);
		    	return;
		    }
		});
	}
	
    //更新初始化
	 function updateInit(id){
		 var parentId = $("#parentId",window.parent.document).val();
		 var parentName = $("#parentName",window.parent.document).val();
		 if(parentId == '' || parentId == null || parentId == undefined){
			 parentId = 0;
		 }
		 if(parentName == '' || parentName == null || parentName == undefined){
			 parentName = "类目树";
		 }
		 $("#FunctionContent").prop("src",'${ctx}/category/updateInit?categoryId='+id);
	}   

</script>
</head>
<body>
	<div class="rightinfo">
		<div class="tools">
			<ul class="toolbar">
				<li>
				   <span><img src="${ctx}/resources/platform/images/d04.png" /></span> 
				   <a href="javascript:;" onclick="categoryAddInit('${ctx}/category/addInit');" class="tclick">添加类目</a>
				</li>
				<li> 
				    <span><img src="${ctx}/resources/platform/images/d05.png" /></span> 
			                    状态:&nbsp;&nbsp;
		            <select id="status" name="status" style="width:100px;height: 20px;">
		               <option value="0" <c:if test="${status eq 0}">selected</c:if>>未移除</option>
		                <option value="1" <c:if test="${status eq 1}">selected</c:if>>已移除</option>
			       </select>
			     </li>
			</ul>
			&nbsp;&nbsp; 名称: <input id=categoryName name="categoryName" type="text"
				value="${categoryName}" class="courseinput"
				style="border-radius: 4px;" placeholder="类目名称" />&nbsp;&nbsp;
				
			<input type="button" style="text-align: center;" class="btn2"
				onclick="loadCategory('${ctx}/category/queryCategoryPager')"
				value="检&nbsp;&nbsp;索" />
		</div>
		<div>
			<table class="tablelist">
				<thead>
					<tr>
						<th style="width: 10%;">序号</th>
						<th style="width: 20%;">分类名称</th>
						<th style="width: 20%;">分类编号</th>
						<th style="width: 20%;">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pages.rows}" var="category" varStatus="in">
						<tr>
							<td>${in.count}</td>
							<td title="${category.name}">${category.name}</td>
							<td title="${category.name}">${category.categoryNo}</td>
							<td>
							    <a href="javascript:void(0);" onclick="updateInit(${category.id});" class="tclick">修改</a>&nbsp;&nbsp;
							    <c:if test="${category.status eq 0}">
							        <a href="javascript:void(0);" onclick="delCategory(${category.id});">移除</a>
							    </c:if>
							   <c:if test="${category.status eq 1}">
							      <a href="javascript:void(0);" onclick="delCategory(${category.id});">恢复</a>
							   </c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<jsp:include page="/commons/pager.jsp">
			<jsp:param
				value="queryCategoryPager?categoryName=${categoryName}&status=${status}&parentId=${parentId}"
				name="url" />
		</jsp:include>
	</div>

	<div class="tip" style="width:50%;height:400px;left:25%;">
		<div class="tiptop">
			<span>部门操作</span><a></a>
		</div>
		<div style="height: 90%;">
			<iframe height="100%" width="100%" src="" scrolling="auto"
				frameborder="0" vspale="0" marginWidth="0" marginHeight="0"
				frameSpacing="0" name="FunctionContent" id="FunctionContent">
			</iframe>
		</div>
	</div>
 </body>
</html>