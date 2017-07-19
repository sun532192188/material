//加入收藏
function AddFavorite(sURL, sTitle) {
	try {
		window.external.addFavorite(sURL, sTitle);
	} catch (e) {
		try {
			window.sidebar.addPanel(sTitle, sURL, "");
		} catch (e) {
			alert("加入收藏失败，请使用Ctrl+D进行添加");
		}
	}
}

//判断图片大小 target 文件对象 maxSize 数据大小
function fileCheck(target,maxSize,title,type) {
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
	var fileSize = 0;
	var filePath = target.value;
	if (isIE && !target.files) {
		var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
		var file = fileSystem.GetFile(filePath);
		fileSize = file.Size;
	} else {
		if(!!target.files[0]) {
			fileSize = target.files[0].size;
		} else
			return false;
	}
	var size = fileSize / 1024;
	if (size > maxSize*1024) {
		target.outerHTML=target.outerHTML.replace(/(value=").+"/i,"$1");
		alert(title+"不能大于"+maxSize+"M");
		return false;
	}
	var fileType = /\.[^\.]+/.exec(filePath);
	return fileType;
}

// 登录
function login(ctx) {
	location.href = ctx + "xxx?url=" + location.href;
}

// 加新浪微博
function addSinaWeibo(uid) {
	var url = "http://widget.weibo.com/dialog/follow.php?fuid="
			+ uid
			+ "&refer=&language=zh_cn&type=widget_page&vsrc=app_followbutton&backurl=&rnd="
			+ Math.random();
	// 获得窗口的垂直位置
	var iTop = (window.screen.availHeight - 30 - 560) / 2;
	// 获得窗口的水平位置
	var iLeft = (window.screen.availWidth - 10 - 660) / 2;
	window
			.open(
					url,
					'xxxxxxxx',
					'height=560,width=660,top='
							+ iTop
							+ ',left='
							+ iLeft
							+ ',toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
}

// 打开一个可调大小的modalDialog
function openResizableWindow(url, width, height, arguments) {
	var _height = window.screen.availHeight;
	var _width = window.screen.availWidth;
	var dialogLeft = (_width - width) / 2;
	var dialogTop = (_height - height) / 2-30;
	window.open (url, "newwindow", "height="+height+", width="+width+", top="+dialogTop+","+ 
			"left="+dialogLeft+", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'");
}

// 打开一个固定大小的modalDialog
function openFixedWindow(url, width, height, arguments) {
	var _height = window.screen.availHeight;
	var _width = window.screen.availWidth;
	var dialogLeft = (_width - width) / 2;
	var dialogTop = (_height - height) / 2-30;
	window.open(url, "newwindow", "height="+height+", width="+width+", top="+dialogTop+","+ 
			"left="+dialogLeft+", toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no'");
}

//判断浏览器类型
function browserType() {
	var type;
	if ((navigator.userAgent.indexOf('MSIE') >= 0)
			&& (navigator.userAgent.indexOf('Opera') < 0)) {
		// alert('你是使用IE');
		type = 1;
	} else if (navigator.userAgent.indexOf('Firefox') >= 0) {
		// alert('你是使用Firefox');
		type = 2;
	} else if (navigator.userAgent.indexOf('Opera') >= 0) {
		// alert('你是使用Opera');
		type = 3;
	} else {
		// alert('你是使用其他的浏览器浏览网页！');
		type = 4;
	}
	return type;
}

function IFrameResize() {
	var obj = parent.document.getElementById("FunctionContent"); // 取得父页面IFrame对象
	var resultHeight = this.document.body.scrollHeight;
	if (browserType() != 1 && browserType != 4) {
		resultHeight = resultHeight + 30;
	}
	obj.height = resultHeight;// 调整父页面中IFrame的高度为此页面的高度
}