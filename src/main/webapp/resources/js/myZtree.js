		var getCategory = function(parentId) {
			var url = "queryCategoryList";
			var setting = {
				showLine : true, // 是否显示线，true为显示，false为不显示
				showIcon : false, // 是否有图标，true为有，false为没有，默认为true
				view : {
					dblClickExpand : false,
					selectedMulti : false
				},
				async : {
					enable : true,
					rootPid : 0,
					url : url,
					autoParam : [ "id=pid", "name" ],// 用来指定树的传递参数的key的名称
					otherParam : {"ng" : parentId} // 用来传递其它的参数，ids=1,name=test
				},
				callback : {
					// 节点被展开时触发的事件
					// 点击节点触发的事件
					onClick : function(event, treeId, treeNode) {
						// alert(treeNode.name + "," + treeNode.isParent + "," +treeNode.id);
						$("#parentId").val(treeNode.id);
						$("#parentName").val(treeNode.name);
						$("#FunctionContent").prop("src","queryCategoryPager?parentId="+treeNode.id);
					}
				}
			};

			var treeNode = {
				      id:parentId,
				    pId : -2,
				   name : "类目树",
			   isParent : true
			};
			var ztree = $.fn.zTree.init($("#tree"), setting, treeNode);
		};
		
		
		//展开权限 树
		var getRole = function(parentId) {
			var url = "queryRoleTree";
			var setting = {
				showLine : true, // 是否显示线，true为显示，false为不显示
				showIcon : false, // 是否有图标，true为有，false为没有，默认为true
				view : {
					dblClickExpand : false,
					selectedMulti : false
				},
				async : {
					enable : true,
					rootPid : 0,
					url : url,
					autoParam : [ "id=pid", "name" ],// 用来指定树的传递参数的key的名称
					otherParam : {
						"ng" : parentId
					}
				// 用来传递其它的参数，ids=1,name=test
				},
				callback : {
					// 节点被展开时触发的事件
					// 点击节点触发的事件
					onClick : function(event, treeId, treeNode) {
						// alert(treeNode.name + "," + treeNode.isParent + "," +treeNode.id);
						$("#roleId").val(treeNode.id);
						$("#FunctionContent").prop("src","queryRoleFunction?roleId="+ treeNode.id);
					}
				}
			};

			var treeNode = {
				id : parentId,
				pId : -2,
				name : "权限树",
				isParent : true
			};
			var ztree = $.fn.zTree.init($("#tree"), setting, treeNode);
		};
