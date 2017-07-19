(function($){
	var __validate = $.fn.validate;
	$.fn.cmsvalidate = function(opts) {
		var __rules = $.extend({
			username:"required",
			password:{
				minlength:6,
				required:true
			},
			password1:{
				maxlength:20,
				minlength:6,
				required:true
			},
			name:"required",
			validcode:"required",
			password2:{
				equalTo:"#password1",
				
			},
			email:"email",
			title:"required",
			cid:{
				min:1
			},
			newName:"required"
		},opts?(opts.rules||{}):{});
		var __messages = $.extend({
			username:"用户名不能为空",
			password:{
				required:"用户密码不能为空",
				minlength:jQuery.format(" 密码长度不少于 {0}位 ")
			},
			password1:{
				required:"用户密码不能为空",
				maxlength:jQuery.format(" 密码长度不超过 {0}位 "),
				minlength:jQuery.format(" 密码长度不少于 {0}位 ")
			},
			password2:"两次输入密码不一致",
			validcode:"验证码不能为空",
			email:"邮件格式不正确",
			name:"名称不能为空",
			cid:"文章必须选择所属栏目",
			title:"文章的标题必须输入",
			newName:"首页图片必须上传"
		},opts?(opts.messages||{}):{});
		var __defaultOpts = $.extend(opts||{},{
			rules:__rules,
			messages:__messages,
			errorElement: opts?(opts.errorElement||"span"):"span",
			errorClass:opts?(opts.errorClass||"errorContainer"):"errorContainer",
			errorPlacement:opts?(opts.errorPlacement?opts.errorPlacement:{}):{}
		});
		$.extend($.fn.validate.prototype,__defaultOpts);
		__validate.call(this,__defaultOpts);
		return this;
	}
})(jQuery)