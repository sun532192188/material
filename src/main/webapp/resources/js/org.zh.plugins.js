(function($) {
	//树
	$.fn.mytree = function(opts) {
		var settings = $.extend({
				data: {
					simpleData: {
						enable: true,
						idKey: "id",
						pIdKey: "pid",
						rootPId: -1
					}
				},check:({},opts?(opts.check?opts.ckeck:{}):{}),
				view: {
					selectedMulti:false,
					expandSpeed:200,
					dblClickExpand: opts.dblClickExpand?true:false
				},
				callback: ({
					
				},opts?(opts.callback?opts.callback:{}):{})
			},opts||{});
		var t = $.fn.zTree.init($(this), settings,opts.datas);
		return t;
	};
	//uploadify
	$.fn.upload = function(options) {
		this.uploadify({
			height        : options.height?options.height:25,
			width         : options.width?options.width:120,
			swf           : options.contextPath+'/resources/uploadify/uploadify.swf',
			uploader      : options.uploader?options.uploader:(options.contextPath?options.contextPath:""+'/admin/attachment/upload;jsessionid='+options.sessionId),
			buttonImage   : options.buttonImage?options.buttonImage:"",
			buttonClass   : options.buttonClass?options.buttonClass:"",
			auto          : options.auto?true:false,
			queueID       : options.queueID?options.queueID:"",
			method        : 'post',
			buttonText    : options.buttonText?options.buttonText:'选择文件',
			fileObjName   : 'attachments',
			fileTypeExts  : options.fileTypeExts?options.fileTypeExts:'*.*;',
			fileTypeDesc  : options.fileTypeDesc?options.fileTypeDesc:'All(*)',
			multi         : options.multi?true:false,
			debug         : false,
			queueSizeLimit: 5,
			fileSizeLimit : options.fileSizeLimit?options.fileSizeLimit:0,
			removeTimeout : options.removeTimeout?options.removeTimeout:3,
			onQueueComplete:options.onQueueComplete ?options.onQueueComplete:null,
		    onUploadSuccess: function(file, data, response) {
		    	//file:name、size、creationDate、modificationDate、type 
		    	var callBack = options.callBack?options.callBack:function(){};
		    	callBack($.parseJSON(data),file,response);
		    }
		});
		return this;
	}
    //百叶窗
    $.fn.according = function(options) {
        var settings = $.extend({
            header:"h3",   //列表名称
            body:"li",       //according内容
            current:"current",//当前展示的列表的class
            color:"#fff",     //according内容的背景颜色
            speed:"slow"     //滑动速度
        },options||{});
        var that = this.find(settings.header);
        that.nextAll(settings.body).hide();
        that.filter("."+settings.current)
			.nextAll(settings.body)
			.show()
			.css("background",settings.color);
        that.click(function(){
            var has = $(this).hasClass(settings.current);
            if(has) {
                $(this).removeClass(settings.current);
                $(this).nextAll(settings.body).slideUp(settings.speed);
            } else {
                that.removeClass(settings.current)
					.nextAll(settings.body)
					.slideUp(settings.speed);
                $(this).addClass(settings.current)
                       .nextAll(settings.body).slideDown(settings.speed)
                       .css("background",settings.color);
            } 
        });
        return this;
    }
    //The drop in advertising 顶部广告展示
   	$.fn.dropAd = function(options) {
		var settings = $.extend({
			top:-300,      //top 
            timeout:3000,  //展示时间 毫秒
            width:"100%",  //宽
            height:"300px",//高
            position:"absolute", //定位
            speed:3        //滚动速度
        },options || {});
		this.css({"top":settings.top,
                  "width":settings.width,
                  "height":settings.height,
                  "position":settings.position});

		var ttop = settings.top,down = 0,up = 0,that = this;
		var bodyTop = 0;			
		down = setInterval(down$,1);
		function down$() {
			ttop += settings.speed;
            bodyTop += settings.speed;
			that.css("top",ttop+"px");
            that.nextAll().css("top",bodyTop+"px");
			if(ttop >= 0) {
				clearInterval(down);
				setTimeout(up$,settings.timeout);
			}
		}
		function up$() {
			if(ttop >= 0) up = setInterval(up$,1);
			ttop -= settings.speed;
            bodyTop -= settings.speed;
			that.css("top",ttop+"px");
            that.nextAll().css("top",bodyTop+"px");
			if(ttop <= settings.top) {
				clearInterval(up);
			}
		}
        return this;
	}          
    /*//回到顶部
    $.fn.returnTop = function(options) {
		var settings = $.extend({
			speed:200,                 //滚动速度
			elementZIndex:1000
		},options||{});
		var windowWidth = $(window).innerWidth();
		var windowHeight = $(window).innerHeight();
		var scrollNum = 0,stop = 0;

		var button = this;
		var buttonWidth = button.outerWidth();
		var buttonHeight = button.outerHeight();

		button.css({
			zIndex:settings.elementZIndex,
			left:windowWidth - buttonWidth +"px",
	    	top:windowHeight - buttonHeight + "px"
		});
		$(window).scroll(function(){
			scrollNum = $(window).scrollTop();
			button.css("top",windowHeight - buttonHeight + scrollNum +"px");
		});
		button.click(function(){
			if(scrollNum <= 0) return;
			stop = setInterval(topest,1);
		})
		function topest() {
			if(scrollNum <= 0) {
                clearInterval(stop)
            };
			var T = scrollNum-settings.speed;
			if(T < 0) T = 0;
			$(window).scrollTop(T);
		}
		return this;
	}*/
	/*//鼠标滚动时、固定div在顶部
	$.fn.fixed = function(options) {
		var settings = $.extend({
			zIndex:1000,
			width:"100%"
		},options||{})
		var that = this;
		var stop = that.offset().top;
		var width = that.css("width");
		$(window).scroll(function(){
			if($(this).scrollTop() > stop) {
				that.css({
					position:"fixed",
					zIndex:settings.zIndex,
					top:"0px",
					width:settings.width
				});
			} else {
				that.css({
					position:"static",
					width:	width					
				});			
			}
		});
		return this;
	}*/

	/*
		可拖动插件
		拖动参数
		enable true 开始拖动 false 结束拖动 内置
		targetX targetY 拖动目标当前的XY
		mouseX  mouseY  当鼠标按下时、鼠标的XY
		differentTR IE和火狐之间的上右边界的差异
		differentL  IE和火狐之间的左边界的差异
		boundaryR 右边界的值
		boundaryB 下边界的值
		boundaryT 上边界的值
		boundaryL 左边界的值
		mouseMoveX mouseMoveY 拖动后鼠标的XY
		calL calT 拖动鼠标后、计算的目标对象的left top
		dragButton 拖动对象的button 、是一个jQuery对象
		lucency 拖动过程中对象的透明度、默认为0.8

		注意事项：

		mousemove 和mouseup 需要給document||window 添加事件
		否则拖动太快 会出现跟不上的问题
		根据event获取鼠标XY时、需要使用clientX clientY event要保证
		IE及火狐的兼容性 、也就是 event = window.event || event;
		判断是否是IE $.browser.msie / 最后通过修改ｏｆｆｓｅｔ
		确定目标对象的位置
	*/
	$.fn.dragable = function(options) {
		var that = this;
		var enable = false;
		var pos,dragButton;
		var targetX,targetY,mouseX,mouseY,mouseMoveX,mouseMoveY,calL,calT;
		//原始样式
		var zIndex = this.css("zIndex");
		var filter = this.css("filter");
		var mozOpacity = this.css("mozOpacity");
		var opacity = this.css("opacity");

		var wwidth = $(window).innerWidth();
		var wheight = $(window).innerHeight();
		var twidth = this.outerWidth();
		var theight = this.outerHeight();

		init();

		var settings;

		var setBoundary = function(options) {
			settings = $.extend({
				boundaryT:settings.boundaryT,
				boundaryB:settings.boundaryB,
				boundaryL:settings.boundaryL,
				boundaryR:settings.boundaryR
			},options || {}); 
		}

		this.boundary = setBoundary;

		

		//拖动初始化
		function init(){

			settings = $.extend({
				boundaryT:0,
				boundaryB:wheight,
				boundaryL:0,
				boundaryR:wwidth,
				dragButton:that,
				lucency:0.8
			},options || {});


			if(settings.boundaryL >= settings.boundaryR)
				throw new Error("boundary参数错误、左边界横坐标必须小于右边界横坐标");
			if(settings.boundaryT >= settings.boundaryB) 
				throw new Error("boundary参数错误、上边界纵坐标必须小于下边界纵坐标");
			
			dragButton = settings.dragButton;
			
			dragButton.css({
				cursor:"move"
			});
		}

		/*$(document||window).mousemove(function(event){
			if(enable) {
				event = window.event || event;
				pos = that.offset();
				mouseMoveX = event.clientX;
				mouseMoveY = event.clientY;
				calL = targetX+(mouseMoveX-mouseX);
				calT = targetY+(mouseMoveY-mouseY);
				if(calL<settings.boundaryL) calL = settings.boundaryL;
				if(calT<settings.boundaryT) calT = settings.boundaryT;
				if(calL>(settings.boundaryR-twidth)) calL = settings.boundaryR-twidth;
				if(calT>(settings.boundaryB-theight)) calT = settings.boundaryB-theight;
				that.offset({top:calT,left:calL});
				$("input.a").val("settings.boundaryB:"+settings.boundaryB+"-twidth:"+twidth+"="+(settings.boundaryB-twidth));
			}
		});*/

		/*dragButton.mousedown(function(event){
			event = window.event || event;
			enable = true;
			pos = that.offset();
			targetX = pos.left;
			targetY = pos.top;
			mouseX = event.clientX;
			mouseY = event.clientY;
			that.css({
				zIndex:1000,
				filter:"alpha(opacity="+settings.lucency*100+")",
				mozOpacity:settings.lucency,
				opacity:settings.lucency
			});
		});
*//*
		$(document||window).mouseup(function(){
			enable = false;
			that.css({
				zIndex:zIndex,
				filter:filter,
				mozOpacity:mozOpacity,
				opacity:opacity
			});
		});*/

		return this;
	}

	/*//抖动效果
	$.fn.shake = function(options) {
		var settings = $.extend({
			time:5000,            //抖动时长 单位毫秒
			intensity:0.5,        //抖动强度 最大值为1
			area:10,              //抖动区域 单位为像素  
			position:"relative"   //抖动定位
		},options||{});
		var that = this;
		var pos = that.position();
		var left = pos.left,top = pos.top,mark = 0,random = 0,offset,add = 0;
		that.css("position",settings.position);
		mark = setInterval(fly,50/settings.intensity);
		setTimeout(stop,settings.time);
		function stop() {
			clearInterval(mark);
			setCss(pos.top,pos.left);
		}
		function setCss(t,l) {
			that.css({top:t+"px",left:l+"px"});
		}
		function fly() {
			random = Math.random();
			add = random < 0.25?1:(random < 0.5 ? 2:(random < 0.75 ? 2:1))
			offset = random*settings.area;
			if(offset > settings.area) offset = settings.area;

			if(add == 1) {
				top -= offset;
				left -= offset;
			} else if(add == 2){
				top += offset;
				left += offset;
			}
			
			setCss(top,left);
		}
		return this;
	};*/
})(jQuery)
