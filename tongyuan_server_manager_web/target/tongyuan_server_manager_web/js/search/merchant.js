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
		//showAssetDetailInfo();
		//$('#asset_edit_dialog').dialog("setTitle","商户信息录入");
		$("#addMerchnatWindow").dialog("open");
	});
					
});

var clickCount = 1;
var act = "";
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
}


/**
 * 构造表格
 */
function showGrid() {
	
	if(clickCount != 1){return;}
	
	clickCount++;
	
	$('#gridResult').datagrid({
		rownumbers:false,
		idField:'id',
		height:460,
		view:myview,
		emptyMsg:'<span class="btn icon-bell_error" style="position:relative;top:5px;"></span>没有找到相关记录,请尝试更换搜索条件',
		url : $("#rootPath").val()+"/finance/merchant/doSearch",
		method:'post',
		pagination:true,
		rownumbers:false,
		pageList : [ 10, 15, 20, 30, 50, 100 ], // 初始分页大小选择列表.
		showFooter:true,
		striped:true,
		border:false,
		fitColumns:true,
		singleSelect:true,
		title:"数据列表",
		queryParams:$("form[name='search_form']").serializeJson(),
		columns : [ [ // 定义每一列的字段.
          {
  			field : 'mercName',
  			title : '商户名称',
  			width : 100,
  			align : 'center'
  		},{
			field : 'mercId',
			title : '商户编号(1代)',
			width : 100,
			align : 'center'
		},{
			field : 'secondMerc',
			title : '商户编号(2代)',
			width : 100,
			align : 'center'
		},
//		},  {
//			field : 'mercLegalPerson',
//			title : '会员号',
//			width : 100,
//			align : 'center'
//		}, {
			{
			field : 'none',
			title : '操作',
			width : 100,
			align : 'center',
			formatter:function(v,r){
				return "<a href='javascript:void(0);' onclick='editMerchantInfo("+JSON.stringify(r)+");'>修改</a>";
			}
		}
//		},  {
//			field : 'none',
//			title : '支持的银行列表',
//			width : 100,
//			align : 'center'
//		}
		] ],
		onLoad:function(){
			$.messager.progress({text:'正在加载数据，请等待...'});
		},
		onLoadSuccess:function(data){
			$.messager.progress('close');
		}
	});
}

/**
 * 修改,注意，需要使用同步的ajax 方法
 */

function editMerchantInfo(id){
	
	showAssetDetailInfo("edit",id);
	
}

/**
 * 删除资产信息,将资产信息状态(status)设置为5
 */
function delAssetInfo(id){
	$.messager.confirm('确认','您确认想要删除记录吗？',function(r){   
	    if (r){   
	        $.post($("#rootPath").val()+"/finance/assetManagement/entering/"+id+"/del_asset_info",{},function(data){
	        	//if(data.flag){
	        		$.messager.show({
								title:'资产删除结果',
								msg:data.msg,
								timeout:2000,
								showType:'slide'
							});
							$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
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
	    title: '录入商户信息',   
	    width: 500,   
	    height: 'auto',   
	    closed: false,   
	    cache: false,
	    modal: true,
	    top:10,
	    href:$("#rootPath").val()+"/pages/search/merchant_edit.jsp?p="+Math.random(),
	    buttons:[{
			text:'确定',
			handler:function(){
				$('#merchantEnteringForm').form('submit', {
					url: $("#rootPath").val()+"/finance/merchant/doEntering",
					onSubmit: function(){
						return $(this).form('validate');
					},
					success: function(data){
						var data = $.parseJSON(data);
						console.info(data);
						if(data.flag){
							$('#asset_edit_dialog').dialog("close");
							
							$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
						}
						$.messager.show({
							title:'系统提示',
							msg:data.msg,
							timeout:2000,
							showType:'slide'
						});
					}
				});
				
				
			}
		}],onOpen:function(){
			
		}
	});
}

/**
 * 新增商户信息 V2.0
 * 
 */
function addNewMerchant(){
	doEnteringMerchant(act);
}

/**
 * 执行录入
 * @param act
 */
function doEnteringMerchant(act){
	var mercName = $("input[name='mercNameAdd']").val();
	var mercNo = $("input[name='mercIdAdd']").val();
	var secondMerc = $("input[name='secondMercAdd']").val();
	var mercKeyId = $("input[name='mercKeyIdAdd']").val();
	var lastMerchantId = $("input[name='lastMerchantIdAdd']").val();
	if(mercName != "" && mercNo != "" && secondMerc != ""){
		$.ajax({
			url:$("#rootPath").val()+"/finance/merchant/doEntering?act="+act,
			type:"POST",
			data:{mercName:mercName,mercId:mercNo,secondMerc:secondMerc,id:mercKeyId,lastMerchantId:lastMerchantId},
			dataType:"JSON",
			async:true,
			success:function(data){
				$.messager.show({
					title:'系统提示：',
					msg:data.msg,
					timeout:2000,
					showType:'slide'
				});
				if(data.flag){
					$("#gridResult").datagrid("reload");
				}
				$("#addMerchnatWindow").dialog("close");
			}
		});
	}else{
		$.messager.alert("系统提示：","请输入所有的表单项");
		return;
	}
}

/**
 * 编辑商户信息 V2.0
 */
function editMerchantInfo(row){
	$("#addMerchnatWindow").dialog("open");
	$("#addMerchnatWindow").dialog("setTitle","修改商户信息");
	$("input[name='mercNameAdd']").val(row.mercName);
	$("input[name='mercIdAdd']").val(row.mercId);
	$("input[name='secondMercAdd']").val(row.secondMerc);
	$("input[name='mercKeyIdAdd']").val(row.id);
	$("input[name='lastMerchantIdAdd']").val(row.mercId);
	act = "edit";
}