<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/include/commons.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>添加出库</title>
<link href="${ctx}/resources/uploadify/uploadify.css" rel="stylesheet"
	type="text/css" />
<link href="${ctx}/resources/platform/css/style.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/base.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/formui.css" />
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/chuchur/css/chur.css" />
<script type="text/javascript" src="${ctx}/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/uploadify/jquery.uploadify.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.plugins.js"></script>
<link rel="stylesheet" type="text/css"
	href="${ctx}/resources/css/validate/main.css" />
<script type="text/javascript"
	src="${ctx}/resources/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/jquery.cms.validate.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.zh.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/js/org.cp.common.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/My97DatePicker/lang/zh-cn.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/cityselect/jquery.cityselect.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/jquery-form.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/chur-alert.1.0.js"></script>
<script type="text/javascript"
	src="${ctx}/resources/chuchur/js/churCommon.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/materialCommon.js"></script>      	
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

tr {
	cursor: pointer;
}

.uploadCourse {
	padding: 20px;
}

.red_input {
	color: red;
	margin-left: 5px;
}

.ru {
	margin-top: 10px;
}

.ru ul li {
	list-style: none;
	display: inline;
	margin-left: 60px;
	font-size: 15px;
}

.table_ru {
	width: 820px;
	margin-top: 10px;
	margin-left: 20px;
	margin-right: 20px;
}

.table_ru tr td {
	width: 110px;
	height: 40px;
	border: 1px solid #A9A9A9;
	text-align: center;
}

.qian {
	border: 1px solid white;
}

.input_text {
	margin-right: 100px;
}

.courseinput {
	width: 300px;
	height: 32px;
	line-height: 32px;
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	text-indent: 10px;
}

.textinput {
	border-top: solid 1px #a7b5bc;
	border-left: solid 1px #a7b5bc;
	border-right: solid 1px #ced9df;
	border-bottom: solid 1px #ced9df;
	background: url(../images/inputbg.gif) repeat-x;
	padding: 10px;
	width: 745px;
	height: 135px;
	line-height: 20px;
	overflow: hidden;
}
</style>
<script type="text/javascript">
     $(function(){
        queryAllDepart("targetDepartId","${ctx}/department/queryAllDepartment");
     });
     
     //更新固定资产状态
     function updateStatus(){
    	 var status = $("#status option:selected").val();
    	 var remarks = $("#remarks").val();
    	 var fixedId = $("#fixedId").val();
    	 var targetDepartId = $("#targetDepartId").val();
    	 if(status == null || status =="" ||status == undefined){
    		 operaAlert("warning","警告提示","请选择物资状态");
    		 return;
    	 }
    	 if(remarks == null || remarks == "" ||remarks == undefined){
    		 operaAlert("warning","警告提示","请填写物资备注");
    		 return;
    	 }
    	 if(status == 4){
    		 if(targetDepartId == null || targetDepartId =="" ||targetDepartId == undefined){
        		 operaAlert("warning","警告提示","请选择调拨部门");
        		 return;
        	 }
    	 }
    	 $.ajax({
    		 type:"POST",
    		  url:"${ctx}/departmentCenter/updateFixedStatus",
    		  data:{"status":status,"remarks":remarks,"fixedId":fixedId,"targetDepartId":targetDepartId},
    		  success:function(data){
    			  if(data.status ==200){
    				  operaAlert("success","成功提示",data.msg);
    				  $("#chur").click(function() {
 		    			 window.parent.location.reload();
 		 			});
    			  }else{
    				  operaAlert("warning","温馨提示",data.msg); 
    				  return;
    			  }
    		  },
    		  error:function(){
    			  operaAlert("success","温馨提示",data.msg); 
    		  }
    	 });
     }
     
     
     function selectedDepart(){
        var status = $("#status option:selected").val();
        if(status != "" && status != null && status != undefined){
        	if(status == 4){
        		$("#depart").show();
        	}else{
        		$("#depart").hide();
        	}
        }
     }
		
</script>
</head>
<body style="height: 100%; overflow-X: hidden;">
    <input type="hidden" id="fixedId" value="${fixedId}">
	<div style="margin-top: 30px; width: 100%; height: 50px;">
		<ul style="float: left; margin-left: 10px;">
		     <li style="margin-top: 20px;">
		        <label><b style="color: red;">*</b>资产状态</label>&nbsp;&nbsp;
				<select id="status"  class="courseinput" onchange="selectedDepart();">
				  <c:if test="${status eq 1}">
				         <option value="2">使用中</option>
				         <option value="3">已损坏</option>
				         <option value="4">调拨给其他部门</option>
				   </c:if>
				   <c:if test="${status eq 2}">
				         <option value="3">已损坏</option>
				   </c:if>
 			    </select>
 			</li>
 			 <li style="margin-top: 30px;display: none;" id="depart">
		        <label><b style="color: red;">*</b>调拨部门</label>&nbsp;&nbsp;
				<select id="targetDepartId"  class="courseinput">
 			    </select>
 			</li>
			<li style="clear: both; padding-top: 30px;">
				<table style="margin-left: 22px;">
					<tr>
						<td style="line-height: 20px;"><label><b style="color: red;">*</b>描述</label></td>
						<td style="padding-left: 10px;">
						  <textarea id="remarks" style="resize: none;width:330px;height: 100px;" name="remarks" cols="" rows="" class="textinput"></textarea></td>
					</tr>
				 </table>
			</li>
		    <li><label>&nbsp; </label>
		     <input id="ckValue" type="submit" class="btn2" style="position: absolute; left:150px; margin-top: 30px; border-radius: 5px; background: #DCDCDC; color: #3C3C3C;" value="提   交"  onclick="updateStatus();"/>
		    </li>
		</ul>
	</div>
</body>
</html>