/**
 * 弹层封装
 */
//提示框
var operaAlert = function(_type,_title,_content){
	$('body').alert(
	 {
		type : _type,
		title:_title,
		content:_content
	 });
};

//打开弹出框
var openOperaCon = function(title,initUrl){
	$.dialog({
		title : title,
		content : 'url:'+initUrl,
		lock : true,
		/*okVal : '关了',
		ok : true,*/
		width : 788,
		height : 504,
		/*cancelVal : '关闭',
		button : [ {
			id : 'supplierForm',
			name : '提交',
			callback : function() {
			}
		} ],
		cancel : true*/
	/* 为true等价于function(){} */});
};

 function closeOpenWindow(){
	 $.dialog().close();
 }

