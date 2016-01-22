$(function() {
	
	/**
	 * 查询
	 */
	$("#queryBtn").click(function(){
		 showGrid();
		$("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
	});
	installMerchList();
});

var clickCount = 1;
var initialCountForMerc=1;

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
		url : $("#rootPath").val()+"/finance/assetManagement/to_query",
		method:'post',
		pagination:true,
		rownumbers:false,
		pageList : [ 10, 15, 20, 30, 50, 100 ], // 初始分页大小选择列表.
		showFooter:true,
		striped:true,
		border:false,
		fitColumns:true,
		singleSelect:true,
		queryParams:$("form[name='search_form']").serializeJson(),
		title:"数据列表",
		columns : [ [ // 定义每一列的字段.
		{
			field : 'assetId',
			title : '资产编号',
			width : 150,
			align : 'center'
		}, {
			field : 'batchNo',
			title : '资产批次号',
			width : 200,
			align : 'center'
		},  {
			field : 'assetName',
			title : '资产名称',
			width : 200,
			align : 'center'
		}, {
			field : 'createdTime',
			title : '录入时间',
			width : '200',
			align : 'center',
			formatter: function(value,row,index){
				return formatLongTime(row.createdTime);
			}
		}, {
			field : 'status',
			title : '审核状态',
			width : '100',
			align : 'center',
			formatter: function(value,row,index){
			    
			    var status;
			    
			    switch(value){
			    	case 0:
			    		status = "待审核";
			    		break;
			        case 4:
			        	status = "未通过";
                        break;
                    default:
                    	status = "已审核";
                    	break;
			    }
			    
                return status;
            }
		},{
			field : 'assetDetail',
			title : '资产明细',
			width : 100,
			align : 'center',
			formatter: function(value,row,index){
				return "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='showAssetDetailInfo("+row.id+")'>详情</a>";
			}
		}, {
			field : 'option',
			title : '操作',
			width : 100,
			align : 'center',
			formatter: function(value,row,index){
				 var returnStr = "<a href='javascript:void(0);' onclick='check_asset("+row.id+")' style='font-size: 11px;color: blue;'>审核</a>";
				return (row.status == 0 || row.status == 4) ? returnStr : "";
			}
		} ] ],
		onLoad:function(){
			$.messager.progress({text:'正在加载数据，请等待...'});
		},
		onLoadSuccess:function(data){
			$.messager.progress('close');
		}
	});
}

/**
 * 资产审核
 * @param  id 资产id该id为数据id，非资产编号
 */
function check_asset(id){
	$('#check_asset_dialog').show();
	$('#check_asset_dialog').dialog({   
	    title: '资产状态审核',   
	    width: 250,   
	    height: 150,   
	    closed: false,   
	    cache: false,
	    modal: true,
	    buttons:[{
			text:'确定',
			handler:function(){
				$.post($("#rootPath").val()+"/finance/assetManagement/checkAsset",{id:id,status:$("#check_result").val()},function(data){
					
					$("#gridResult").datagrid("reload");
					
					$.messager.show({
						title:'资产审核结果',
						msg:data.msg,
						timeout:2000,
						showType:'slide'
					});
					
					console.info(data);
				},"JSON");
				$('#check_asset_dialog').dialog("close");
			}
		},{
			text:'取消',
			handler:function(){
				$('#check_asset_dialog').dialog("close");
			}
		}]
	});
}

/**
 * 通过资产id 查询资产信息
 * @param id 资产主键id
 */
function showAssetDetailInfo(id){
	
	$('#asset_detail_dialog').dialog({   
	    title: '资产信息',   
	    width: 350,   
	    height: 'auto',   
	    closed: false,   
	    cache: false,
	    modal: true,
	    top:'20%',
	    href:$("#rootPath").val()+"/finance/assetManagement/"+id+"/showAssetDetail",
	    buttons:[{
			text:'确定',
			handler:function(){
				$('#asset_detail_dialog').dialog("close");
			}
		}]
	});
	
}

/**
 * 初始化商户列表
 */
function installMerchList(){
    
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
}