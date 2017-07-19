/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.width = "100%";  
	//config.height=200;
	
	//是否允许改变大小 plugins/resize/plugin.js
	config.resize_enabled = false;
	
	//调整高度时不销毁前一个富文本框
	config.autoGrow_onStartup = true;
	//设置距离底部的位置
	config.autoGrow_bottomSpace = 20;
	
	config.extraPlugins = 'autogrow';
	
	config.autoGrow_minHeight = 250;
	
	config.autoGrow_maxHeight = 6000;

	//改变大小的最大高度 plugins/resize/plugin.js
	/*config.resize_maxHeight = 3000;

	//改变大小的最大宽度 plugins/resize/plugin.js
	config.resize_maxWidth = 3000;

	//改变大小的最小高度 plugins/resize/plugin.js
	config.resize_minHeight = 200;

	//改变大小的最小宽度 plugins/resize/plugin.js
	config.resize_minWidth = 750;*/
	
//皮肤

//config.skin='v2';

	config.startupOutlineBlocks = false;
//表情显示每行个数

config.smiley_columns =8;

//加入代码插件

//config.extraPlugins="syntaxhighlight"; 

//去掉左下角的body和p标签

config.removePlugins = 'elementspath';   


//表情自定义

config.smiley_images  =  ['angel_smile.gif','angry_smile.gif','broken_heart.gif','confused_smile.gif','cry_smile.gif',
                          
                          'devil_smile.gif','embaressed_smile.gif','embarrassed_smile.gif','envelope.gif','heart.gif',
                          
                          'kiss.gif','lightbulb.gif','omg_smile.gif','regular_smile.gif','sad_smile.gif','shades_smile.gif',
                          
                          'teeth_smile.gif','thumbs_down.gif','thumbs_up.gif','tongue_smile.gif','tounge_smile.gif',
                          
                          'whatchutalkingabout_smile.gif','wink_smile.gif'];

//加入中文

config.font_names='宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names;                    //设置编辑器里字体下拉列表里的字体

 //设置工具栏里面的工具 最主要的

 config.toolbar =  [['Font','Bold','Italic','Underline','FontSize','NumberedList','BulletedList','Outdent','Indent','JustifyLeft',

 'JustifyCenter','JustifyRight','Link','Unlink','TextColor','BGColor','Image','Smiley','Table',

 'RemoveFormat','syntaxhighlight' ]];

};
