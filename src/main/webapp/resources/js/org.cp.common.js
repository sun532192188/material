$(function(){
	$("div.tip").dragable({dragButton:jQuery("div.tip div.tiptop")});
	$(".tclick").click(function(){
  		$(".tip").fadeIn(200);
  		$("body").css("overflow","hidden"); 
    });
  
    $(".tiptop a").click(function(){
  		$(".tip").fadeOut(200);
  		$("body").css("overflow","auto");
    });
});
//弹出框搜索
function search(url,name,ct) {
	if(ct==null||""==jQuery.trim(ct)) return;
	$.post(url,{name:ct},function(data) {
		jQuery("#list").html(data);
	},"html");
}	
