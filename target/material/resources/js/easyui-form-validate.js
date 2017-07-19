jQuery.extend(jQuery.fn.validatebox.defaults.rules, {   
    equals: {   
        validator: function(value,param){   
            return value == jQuery(param[0]).val();   
        },   
        message: '{1}两次输入不一致.'  
    },
    idNumber: {
    	validator: function(value,param){   
    		function IdentityCodeValid(code) { 
                var city={11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江 ",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北 ",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏 ",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外 "};
                var pass= true;
                
                if(!code || !/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(code)){
                    pass = false;
                } else if(!city[code.substr(0,2)]){
                    pass = false;
                } else{
                    //18位身份证需要验证最后一位校验位
                    if(code.length == 18){
                        code = code.split('');
                        //∑(ai×Wi)(mod 11)
                        //加权因子
                        var factor = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 ];
                        //校验位
                        var parity = [ 1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2 ];
                        var sum = 0;
                        var ai = 0;
                        var wi = 0;
                        for (var i = 0; i < 17; i++)
                        {
                            ai = code[i];
                            wi = factor[i];
                            sum += ai * wi;
                        }
                        if(parity[sum % 11] != code[17]){
                            pass =false;
                        }
                    }
                }
                return pass;
            }
            return IdentityCodeValid(value);   
        },   
        message: '身份证格式不正确.'
    },
    minLength: {   
        validator: function(value, param){   
            return value.length < param[0];   
        },   
        message: '{1}长度不能少于{0}个字符.'  
    },   
    maxLength: {
    	validator: function(value, param){   
            return value.length > param[0];   
        },   
        message: '{1}长度不能超过{0}个字符.'
    },
    username: {
    	validator: function(value, param){  
    		var rules = $.fn.validatebox.defaults.rules;
    		if(!rules.length.validator(value,param)){ 
                rules.username.message = rules.length.message; 
                return false; 
            } 
    		//  /i 忽略大小写 /这儿不需要忽略/g为全局
    		if(!/^[a-z0-9]+$/g.test(value)) {
    			 rules.username.message = "用户名仅支持英文小写和数字";
    			 return false;
    		}
    		return true;
        },   
        message: ''
    },
    password: {
    	validator: function(value, param){  
    		var rules = $.fn.validatebox.defaults.rules;
    		if(!rules.length.validator(value,param)){ 
                rules.username.message = rules.length.message; 
                return false; 
            } 
    		//  /i 忽略大小写 /这儿不需要忽略/g为全局
    		if(!/^[a-z0-9A-Z]+$/g.test(value)) {
    			 rules.username.message = "密码仅支持英文大小写和数字";
    			 return false;
    		}
    		return true;
        },   
        message: ''
    },
    functionId: {
    	validator: function(value, param){  
    		var rules = $.fn.validatebox.defaults.rules;
    		if(!rules.length.validator(value,param)){ 
                rules.functionId.message = rules.length.message; 
                return false; 
            } 
    		if(!/^[A-Z]+(_[A-Z]+)*$/g.test(value)) {
    			 rules.functionId.message = "功能ID仅支持[A-Z或_]";
    			 return false;
    		}
    		return true;
        },   
        message: ''
    },
    length: {
    	validator: function(value, param){   
    		if(value.length < param[0] || value.length > param[1]) return false;
            return true;   
        },   
        message: '{2}长度在{0}-{1}字符之间.'
    }
});  