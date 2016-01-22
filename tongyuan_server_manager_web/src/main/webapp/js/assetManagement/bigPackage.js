$(function() {
	/**
	 * 查询
	 */
	$("#queryBtn").click(function(){
		 showGrid();
		$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
	});
	
	/**
	 * 新增
	 */
	$("#newAssetBtn").click(function(){
//		var nowtime = formatLongTime(new Date().getTime());
//		nowtime = nowtime.replace(/-|:| /g,"");
//		nowtime = nowtime.substr(2,10);
//		alert(nowtime);
		showAssetDetailInfo();
		$('#asset_edit_dialog').dialog("setTitle","录入资产信息");
	});
	
	//绑定录入excel
	$("#fileUploadBtn").click(function(){
		enteringExcelTemplate();
	});
	
	installMerchList();
});

var clickCount = 1;
var initialCountForMerc=1;
var act;
var data;

/**
 * 序列化表单成json对象，ps：方便了datagrid插件load从服务器load数据
 * 
 * @memberOf {TypeName}
 * @return {TypeName}
 */
$.fn.serializeJson = function() {
	var serializeObj = {};
	var array = this.serializeArray();
	var str = this.serialize();
	$(array).each(
			function() {
				if (serializeObj[this.name]) {
					if ($.isArray(serializeObj[this.name])) {
						serializeObj[this.name].push(this.value);
					} else {
						serializeObj[this.name] = [
								serializeObj[this.name], this.value ];
					}
				} else {
					serializeObj[this.name] = this.value;
				}
			});
			
	return serializeObj;
};

/**
 * 扩展datagrid view 默认视图，用于显示记录数为0时告诉用户没有找到对应条件的数据
 * @param {Object} target
 * @memberOf {TypeName} 
 */
var myview = $.extend({},$.fn.datagrid.defaults.view,{
onAfterRender:function(target){
    $.fn.datagrid.defaults.view.onAfterRender.call(this,target);
    var opts = $(target).datagrid('options');
    var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
    vc.children('div.datagrid-empty').remove();
    if (!$(target).datagrid('getRows').length){
        var d = $('<div class="datagrid-empty" style="color:red;font-weight:bold;"></div>').html(opts.emptyMsg || 'no records').appendTo(vc);
        d.css({
            position:'absolute',
            left:0,
            top:50,
            width:'100%',
            textAlign:'center'
        });
    }
}});


//转换日期
function formatLongTime(ms){
	var date = new Date(ms);
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	var hour = date.getHours().toString().length == 1 ? ('0'+date.getHours()) : date.getHours();
	var minute = date.getMinutes().toString().length == 1 ? ('0'+date.getMinutes()) : date.getMinutes();
	var second = date.getSeconds().toString().length == 1 ? ('0'+date.getSeconds()) : date.getSeconds();
	var end =year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
	return end;
}

/*
* formatMoney(s,type)
* 功能：金额按千位逗号分割
* 参数：s，需要格式化的金额数值.
* 参数：type,判断格式化后的金额是否需要小数位.
* 返回：返回格式化后的数值字符串.
*/
function formatMoney(s, type) {
	if (/[^0-9\.]/.test(s))
		return "0";
	if (s == null || s == "")
		return "0";
	s = s.toString().replace(/^(\d*)$/, "$1.");
	s = (s + "00").replace(/(\d*\.\d\d)\d*/, "$1");
	s = s.replace(".", ",");
	var re = /(\d)(\d{3},)/;
	while (re.test(s))
		s = s.replace(re, "$1,$2");
	s = s.replace(/,(\d\d)$/, ".$1");
	if (type == 0) {// 不带小数位(默认是有小数位)
		var a = s.split(".");
		if (a[1] == "00") {
			s = a[0];
		}
	}
	return s;
} 

/**
 * 重置
 */
function clearInput(){
	$("form[name='search_form']").form("reset");
	$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
	initialCountForMerc=1;
installMerchList();
}


/**
 * 构造表格
 */
function showGrid() {
	
	if(clickCount != 1){return;}
	
	clickCount++;
	
	$('#gridResult').datagrid({
		idField:'id',
		height:460,
		view:myview,
		emptyMsg:'<span class="btn icon-bell_error" style="position:relative;top:5px;"></span>没有找到相关记录,请尝试更换搜索条件',
		url : $("#rootPath").val()+"/finance/assetManagement/jrAssetAssign/query",
		method:'post',
		pagination:true,
		rownumbers:false,
		pageList : [ 10, 15, 20, 30, 50, 100 ], // 初始分页大小选择列表.
		showFooter:true,
		striped:true,
		border:false,
		fitColumns:false,
		singleSelect:true,
		queryParams:$("form[name='search_form']").serializeJson(),
		title:"数据列表",
		columns : [ [ // 定义每一列的字段.
		{
			field : 'assetType',
			title : '资产类型',
			width : 120,
			align : 'center',
			formatter: function(value,row,index){
			    
			    var status;
			    
			    switch(value){
			        case 0:
			             status = "非标资产";
			             break;
			        case 1:
			             status = "票据";
			             break;
			        case 2:
			             status = "保险";
                         break;
			       default :
			    	   	 status = "未知";
			    }
			    
                return status;
			}
		}, {
			field : 'assetSku',
			title : '产品SKU',
			width : 100,
			align : 'center'
		},  {
			field : 'assetId',
			title : '产品编号(小包)',
			width : 160,
			align : 'center'
		},  {
			field : 'assetName',
			title : '产品名称',
			width : 120,
			align : 'center'
		},  {
			field : 'updateFlag',
			title : '状态',	
			width : 100,
			align : 'center',
			formatter: function(value,row,index){
			    
			    var status;
			    
			    switch(value){
			        case 0:
			             status = "未同步";
			             break;
			        case 1:
			             status = "已同步";
			             break;
			       default :
			    	   	 status = "未知";
			    }
			    
                return status;
			}
		},  {
			field : 'credatedDateStr',
			title : '创建时间',
			width : 100,
			align : 'center'
		},  {
			field : 'modifiedDateStr',
			title : '刷新时间',
			width : 100,
			align : 'center'
		},  {
			field : 'null',
			title : '操作',
			width : '150',
			align : 'center',
			formatter: function(value,row,index){
				var htmlStr = "";
				if(row.updateFlag == 0){
					//htmlStr = "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='editAssetInfo(\""+row.id+"\")'>修改</a>&nbsp;&nbsp;&nbsp;&nbsp;";
					htmlStr+="<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='syncAsset(\""+row.assetId+"\")'>同步</a>";
				}
				return htmlStr;
			}
		}] ],
		onLoad:function(){
			$.messager.progress({text:'正在加载数据，请等待...'});
		},
		onLoadSuccess:function(data){
			$.messager.progress('close');
		}
	});
}

/**
 * 修改,注意拉取form 页面的速度和填充表单的速度
 */

function editAssetInfo(pid){
	showAssetDetailInfo("edit",pid);
}

/**
 * 同步资产信息,将资产信息状态(status)设置为已更新
 */
function syncAsset(assetId){
	$.messager.confirm('确认','您确认要同步吗？',function(r){   
	    if (r){   
	        $.post($("#rootPath").val()+"/finance/assetManagement/jrAssetAssign/"+assetId+"/sync",{},function(data){
	        	$.messager.show({
					title:'资产同步结果',
					msg:data.msg,
					timeout:2000,
					showType:'slide'
				});
	        	$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
	        	//if(data.flag){
//	        		$.messager.show({
//								title:'资产同步结果',
//								msg:data.msg,
//								timeout:2000,
//								showType:'slide'
//							});
//	        				alert("22");
//							$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
//							alert("333");
//							$("#queryBtn").click();
	        	//}
	        },"JSON");
	    }   
	}); 
}

/**
 * 通过资产id 查询资产信息
 * @param id 资产主键id
 */
function showAssetDetailInfo(ac,d){
    act = ac;
    data = d;
	$('#asset_edit_dialog').dialog({
	    title: '录入资产信息',   
	    width: 500,   
	    height: 'auto',   
	    closed: false,   
	    cache: false,
	    modal: true,
	    top:10,
	    href:$("#rootPath").val()+"/pages/assetManagement/asset_edit.jsp?p="+Math.random(),
	    buttons:[{
			text:'确定',
			handler:function(){
				$('#assetPublishFrom').form('submit', {
					url: $("#rootPath").val()+"/finance/assetManagement/entering/do_entering",
					onSubmit: function(){
						return $(this).form('validate');
					},
					success: function(data){
						var data = $.parseJSON(data);
						if(data.flag){
							$('#asset_edit_dialog').dialog("close");
							$.messager.show({
								title:'资产录入结果',
								msg:data.msg,
								timeout:2000,
								showType:'slide'
							});
							$("#gridResult").datagrid("reload",$("form[name='search_form']").serializeJson());
						}else{
							$.messager.show({
								title:'系统提示',
								msg:data.msg,
								timeout:2000,
								showType:'slide'
							});
						}
					}
				});
			}
		}],onOpen:function(){
			
		}
	});
}

/**
 * 初始化商户列表
 */
function installMerchList(){
    
    try{
    	 $('#mercList').combobox({     
	        valueField:'mercId',   
	        textField:'mercName',
	        url:$("#rootPath").val()+"/finance/tradeSearch/orderPurchse/findAllMerchant",
	        onLoadSuccess:function(){
	            if(initialCountForMerc == 1){
	                initialCountForMerc++;
	                var dataJson = $(this).combobox("getData");
	                var jsonStr = JSON.stringify(dataJson);
	                var newJsonStr = jsonStr.substr(1,jsonStr.length);
	                newJsonStr = "[{\"mercId\":-1,\"mercName\":\"请选择\",\"selected\":true},"+newJsonStr;
	                var data = JSON.parse(newJsonStr);
	                $(this).combobox("loadData",data);
	            }
	        }
	    });
    }catch(e){
    	console.info(e);
    }
}

/**
 * 打开excel 文件上传得window
 */
function enteringExcelTemplate(){
	$("#fileUploadWindow").window("open");
}

/**
 * 执行批量录入
 */
function doEnteringExcelTemplate(){
	var filename = $("#excelFile").val();
	if(filename != null && filename != ""){
	}else{
		$.messager.alert("警告","请选择上传文件");
		$("#excelFile").val(null);
		return false;
	}
	var suffix = filename.substring(filename.indexOf(".")+1,filename.length);
	if(suffix == "xls" || suffix == "xlsx"){
		$('#uploadFileForm').form('submit', {
			url:$("#rootPath").val()+"/finance/assetManagement/jrAssetAssign/add?suffix="+suffix,
		    success: function(data){
                var data = JSON.parse(data);
		    	$.messager.show({
					title:'资产录入结果',
					msg:data.msg,
					timeout:2000,
					showType:'slide'
				});
                $("#fileUploadWindow").window("close");
		    }    
		});  
	}else{
		$.messager.alert("警告","上传得文件类型不合法");
		$("#excelFile").val(null);
		return false;
	}
}

/**
 * Excel 模板下载
 */
function downLoadExcelTemplate(){
	var url = $("#rootPath").val()+"/finance/assetManagement/entering/downLoadExcelTemplate?filePath="+$("#excelTemplatePath").val();
	window.location.href=url;
}