<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/include/commons.jsp" %>
<%@page import="java.awt.Window"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>基础信息</title>
<style type="text/css">
/* td {
	height: 40px;
} */
</style>
<script src="${ctx}/resources/cityselect/jquery.js"></script>
<%-- <script type="text/javascript" src="${ctx}/resources/js/distpicker.data.js"></script>
<script type="text/javascript" src="${ctx}/resources/js/distpicker.js"></script> --%>
<script type="text/javascript" src="${ctx}/resources/cityselect/jquery.cityselect.js"></script>
</head>
<body style="padding: 0px;">
    <div style="text-align: left;"> 
      <a type="button" id="btn_addtr" >新增服务范围</a>
     </div>
    <table id="dynamicTable">
        <tr>
          <td>
              <div id="city"> 
				<select class="prov"></select>  
				<select class="city" disabled="disabled"></select> 
				<select class="dist" disabled="disabled"></select> 
			 </div>
          </td>
        </tr>
    </table>
</body>
<script type="text/javascript">
$(function(){
	
	//三级联动初始化
	function cityInit(id){
		$("#"+id).citySelect({
			nodata:"none",
			required:false
		}); 
	}
	cityInit("city");
	$("#btn_addtr").click(function() {
		var show_count = 10; //要显示的条数
		var length = $("#dynamicTable tbody tr").length;
		var cityId = "city"+length;
		var resultHtml = '<tr><td>';
		resultHtml += '<div id="'+cityId+'"> ';
		resultHtml += '<select class="prov"></select> ';
		resultHtml += '<select class="city" disabled="disabled"></select>';
		resultHtml += '<select class="dist" disabled="disabled"></select>';
		resultHtml += '</div>';
		resultHtml += '</td></tr>';
		//alert(length);
		if (length < show_count) //点击时候，如果当前的数字小于递增结束的条件
		{
			$("#dynamicTable tbody").append(resultHtml); //在表格后面添加一行
			cityInit(cityId);
			changeIndex();//更新行号
		}
	});
});

function changeIndex() {
	var i = 1;
	$("#dynamicTable tbody tr").each(function() { //循环tab tbody下的tr
		$(this).find("input[name='NO']").val(i++);//更新行号
	});
}

function deltr(opp) {
	var length = $("#dynamicTable tbody tr").length;
	//alert(length);
	if (length <= 1) {
		$.messager.alert('提示信息','至少保留一条');
		//alert("至少保留一条");
	} else {
		$(opp).parent().parent().remove();//移除当前行
		changeIndex();
	}
}
</script>
</html>