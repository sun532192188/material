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
<script src="${ctx}/resources/jQueryselect/jquery-1.7.min.js"></script>
<script type="text/javascript" src="${ctx}/resources/jQueryselect/Area.js"></script>
<script type="text/javascript" src="${ctx}/resources/jQueryselect/AreaData_min.js"></script>
</head>
<body style="padding: 0px;">
    <div style="text-align: left;"> 
      <a type="button" id="btn_addtr" >新增服务范围</a>
     </div>
    <table id="dynamicTable">
        <tr>
          <td>
            <label>请选择省市地区：</label></br>
			<select id="seachprov" name="seachprov" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>&nbsp;&nbsp;
			<select id="seachcity" name="homecity" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>&nbsp;&nbsp;
			<span id="seachdistrict_div"><select id="seachdistrict" name="seachdistrict"></select></span>
			<input type="button"  value="获取地区" onClick="showAreaID('seachprov','seachcity','seachdistrict')"/>
          </td>
        </tr>
    </table>
</body>
<script type="text/javascript">
$(function(){
	initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
 	function initArea(provinceId,cityId,districtId){
		initComplexArea(provinceId, cityId, districtId, area_array, sub_array, '44', '0', '0');
	} 
	$("#btn_addtr").click(function() {
		var show_count = 10; //要显示的条数
		var length = $("#dynamicTable tbody tr").length;
		var seachprov = "seachprov"+length;
		var seachcity = "seachcity"+length;
		var seachdistrict ="seachdistrict"+length;
		var homecity = "homecity"+length;
		var resultHtml = '<tr><td>';
		resultHtml += '<label>请选择省市地区：</label></br>';
		//\""+seachcity+"\",\""+seachdistrict+"\"
		resultHtml += '<select id="'+seachprov+'" name="'+seachprov+'" onChange="changeComplexProvince(this.value, sub_array,\''+seachcity+'\',\''+seachdistrict+'\' );"></select>&nbsp;&nbsp;';
		resultHtml += '<select id="'+seachcity+'" name="'+homecity+'" onChange="changeCity(this.value,\''+seachdistrict+'\',\''+seachdistrict+'\');"></select>&nbsp;&nbsp;';
		resultHtml += '<span id="\''+seachdistrict+'_div\'"><select id="'+seachdistrict+'" name="'+seachdistrict+'"></select></span>';
		console.log(seachdistrict+"_div");
		resultHtml += '<input type="button"  value="获取地区" onClick="showAreaID(\''+seachprov+'\',\''+seachcity+'\',\''+seachdistrict+'\')"/>';
		resultHtml += '</td></tr>';
		//alert(length);
		if (length < show_count) //点击时候，如果当前的数字小于递增结束的条件
		{
			$("#dynamicTable tbody").append(resultHtml); //在表格后面添加一行
			initArea(seachprov,seachcity,seachdistrict)
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

/**
 * 获取城市code 主入口
 */
function showAreaID(seachprov,seachcity,seachdistrict) {
	//地区码
	var areaID = getAreaID(seachprov,seachcity,seachdistrict);
	//地区名
	var areaName = getAreaNamebyID(areaID) ;
	alert("您选择的地区码：" + areaID + "      地区名：" + areaName);            
}

//得到地区码
function getAreaID(seachprov,seachcity,seachdistrict){
	var area = 0;          
	if($("#"+seachdistrict).val() != "0"){
		area = $("#"+seachdistrict).val();                
	}else if ($("#"+seachcity).val() != "0"){
		area = $("#"+seachcity).val();
	}else{
		area = $("#"+seachprov).val();
	}
	return area;
}

//根据地区码查询地区名
function getAreaNamebyID(areaID){
	var areaName = "";
	if(areaID.length == 2){
		areaName = area_array[areaID];
	}else if(areaID.length == 4){
		var index1 = areaID.substring(0, 2);
		areaName = area_array[index1] + " " + sub_array[index1][areaID];
	}else if(areaID.length == 6){
		var index1 = areaID.substring(0, 2);
		var index2 = areaID.substring(0, 4);
		areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
	}
	return areaName;
}
</script>
</html>