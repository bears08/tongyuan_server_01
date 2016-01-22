$(function() {
    
    /**
     * 查询
     */
    $("#queryBtn").click(function(){
         showGrid();
        $("#gridResult").datagrid("load",$("form[name='search_form']").serializeJson());
    });
    
     /**
     * 发布资产的对话框
     */
    $('#asset_publish_dialog').dialog({   
        title: '发布资产',   
        width: 350,   
        height: 350,   
        closed: true,   
        cache: false,
        modal: true,
        buttons:[{
            text:'确定',
            handler:function(){
            	var flag = $("form[name='asset_publish_form']").form("validate");
				//serializeJson
            	if(flag){
            		$("form[name='asset_publish_form']").form("submit",{
            			url:$("#rootPath").val()+"/finance/assetManagement/publish/doPublish?act="+act,
            			success:function(data){
            				data = $.parseJSON(data);
            				$('#asset_publish_dialog').dialog("close");
            				$.messager.show({
								title:'资产发布结果',
								msg:data.msg,
								timeout:2000,
								showType:'slide'
							});
							 $("#gridResult").datagrid("reload",$("form[name='search_form']").serializeJson());
            			}
            		});
            	}
            	
            }
        },{
            text:'取消',
            handler:function(){
                $('#asset_publish_dialog').dialog("close");
            }
        }],
        onOpen:function(){
        	// var state = $("#totalNumType").combobox("getValue");
        	 //changeFormInputStatus(totalNumType);
        }
    });
    
    /**
     * 根据销售额度的下拉状态改变销售额度的文本输入框
     */
//    $("#totalNumType").combobox({
//	    valueField:'value',   
//	    textField:'label',
//	    panelHeight:"auto",
//	    data: [{
//			label: '不限量',
//			value: 'n',
//			selected:true
//		},{
//			label: '限量',
//			value: 'y'
//		}],
//		onSelect:function(record){
//			//处理禁用表单字段
//			changeFormInputStatus(record.value);
//		},onLoadSuccess:function(){
//			
//		}
//		
//	});
	
	installMerchList();
});

var act = null; //表单操作动作：pub | edit
var clickCount = 1; //点击查询按钮的次数
var initialCountForMerc = 1; //初始化商户次数

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
	initialCountForMerc = 1;
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
		url : $("#rootPath").val()+"/finance/assetManagement/nonstandard/query",
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
		columns : [ [ // 定义每一列的字段.\
      {
			field : 'id',
			title : '主键Id',
			width : 100,
			align : 'center',
			hidden:true
		},{
  			field : 'assetId',
  			title : '资产编号',
  			width : 100,
  			align : 'center'
  		},{
			field : 'assetType',
			title : '资产类型',
			width : 120,
			align : 'center'
		}, {
			field : 'assetName',
			title : '资产名称',
			width : 100,
			align : 'center'
		},  {
			field : 'createdDate',
			title : '录入时间',
			width : 160,
			align : 'center'
		},  {
			field : 'jrStatusDesc',
			title : '金融状态',
			width : 120,
			align : 'center'
		},  {
			field : 'statusDesc',
			title : '本地状态',	
			width : 100,
			align : 'center'
		},{
			field : 'detial',
			title : '查看详情',
			width : '150',
			align : 'center',
			formatter: function(value,row,index){
				return "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='showDetail(\""+row.id+"\")'>详情</a>";
			}
		},{
			field : 'publish',
			title : '发布资产',
			width : '150',
			align : 'center',
			formatter: function(value,row,index){
				var htmlStr = "";
				if(row.status == '1' || row.status == '3'){	// 已审核未上架/已下架 资产可发布
					htmlStr += "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='asset_publish(\""+row.id+"\")'>发布资产</a>";
				}
				//ProdId
				return htmlStr;
			}
		},{
			field : 'soldout',
			title : '下架资产',
			width : '150',
			align : 'center',
			formatter: function(value,row,index){
				var htmlStr = "";
				if(row.status == '1' || row.status == '5'){	// 已审核未上架资产可发布
					htmlStr += "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='asset_soldout(\""+row.id+"\")'>下架资产</a>";
				}
				//ProdId
				return htmlStr;
			}
		},{
			field : 'sync',
			title : '同步',
			width : '150',
			align : 'center',
			formatter: function(value,row,index){
				return "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='syncAsset(\""+row.assetId+"\")'>同步状态|合同</a>";
			}
		},{
				field : 'updateAssetDetailByMoney',
				title : '修改资产',
				width : '150',
				align : 'center',
				formatter: function(value,row,index){
					return "<a href='javascript:void(0);' style='font-size: 11px;color: blue;' onclick='getAssetDetailByMoney(\""+row.id+"\")'>修改资产</a>";
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
 * 通过资产id 查询资产信息
 * @param id 资产主键id
 */
function showAssetDetailInfo(id){
    
    $('#asset_detail_dialog').dialog({   
        title: '资产信息',   
        height:'auto',   
        width: 400,   
        closed: false,   
        cache: false,
        top:'20%',
        href:$("#rootPath").val()+"/finance/assetManagement/"+id+"/showAssetDetail",
        modal: true,
        buttons:[{
            text:'确定',
            handler:function(){
                $('#asset_detail_dialog').dialog("close");
            }
        }]
    });
}

/**
 * 发布资产
 */
function asset_publish(id){
	act = "pub";
	$('#asset_publish_dialog').dialog("setTitle","发布资产信息");
	$("form[name='asset_publish_form']").form("reset");
	
	$("#totalNumType").combobox("setText","不限量");
	$("#totalNumType").combobox("setValue","n");
	$("#totalNum").numberbox("disableValidation");
	$("#totalNum").numberbox("clear");
	$("#totalNum").numberbox("disable");
	
	$('#asset_publish_dialog').dialog("open");
	installProductList();
	$("#assetId").val(id);
	changeFormInputStatus("n");
}

/**
 * 下架资产
 */
function asset_soldout(id){
	$.messager.confirm('确认','您确认要下架吗？',function(r){
	    if (r){
	        $.post($("#rootPath").val()+"/finance/assetManagement/nonstandard/"+id+"/assetSoldout",{},function(data){
	        	//if(data.flag){
	        		$.messager.show({
						title:'资产下架结果',
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
 * 编辑资产发布的信息
 * @param {资产记录主键id，非资产编号} id
 */
function asset_edit(id,pid){
	act = "edit";
	installProductList();
//	$("#productTypeList").combo("disable");
	$('#asset_publish_dialog').dialog("open");
	$('#asset_publish_dialog').dialog("setTitle","修改资产发布信息");
	$("#assetId").val(id);
	$.getJSON($("#rootPath").val()+"/finance/assetManagement/publish/"+id+"/showAssetDetailForJson",{},function(data){
		$("#totalNum").numberbox("disableValidation");
		$("#totalNum").numberbox("clear");
		$("#totalNum").numberbox("disable");
		$("form[name='asset_publish_form']").form('load',{
			time1:formatLongTime(data.putawayTime),
			time2:formatLongTime(data.soldoutTime),
			productType:pid,
			totalNumType:data.totalNum == -1 ? "n" : "y",
			totalNum:data.totalNum == -1 ? "" : data.totalNum,
			warningPercent:data.warningPercent
		});
		if(data.totalNum != -1){
			$("#totalNum").numberbox("enable");
			$("#totalNum").numberbox("enableValidation");
		}
		//设置库存警告的状态
		changeFormInputStatus(data.totalNum == -1 ? "n" : "y");
	})
	
}

	/**
     * 初始化产品下拉框
     */
function installProductList(){
	
	
    $('#productTypeList').combobox({     
	    valueField:'prodId',   
	    textField:'name',
	    url:$("#rootPath").val()+"/finance/assetManagement/publish/getAllProducts",
	    onLoadSuccess:function(){
	    	var dataJson = $(this).combobox("getData");
	    	$(this).combobox('setText', dataJson[0].name);
	    	$(this).combobox('setValue', dataJson[0].prodId);
	    }
	});
	$("#productTypeList").combo("enable");
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
 * 处理禁用表单字段
 */
function changeFormInputStatus(state){
	if(state == 'n'){
		$("#totalNum").numberbox("disableValidation");
		$("#totalNum").numberbox("clear");
		$("#totalNum").numberbox("disable");
		
		$("#warningPercent").numberbox("disableValidation");
		$("#warningPercent").numberbox("clear");
		$("#warningPercent").numberbox("disable");
		
	}else{
		$("#totalNum").numberbox("enable");
		$("#totalNum").numberbox("enableValidation");
		
		$("#warningPercent").numberbox("enable");
		$("#warningPercent").numberbox("enableValidation");
	}
}

function showDetail(id){
    $('#asset_detail_dialog').dialog({
        title: '资产信息',   
        height:'auto',   
        width: 800,   
        closed: false,   
        cache: false,
        top:'20%',
        href:$("#rootPath").val()+"/finance/assetManagement/nonstandard/"+id+"/showAssetDetail",
        modal: true,
        buttons:[{
            text:'确定',
            handler:function(){
                $('#asset_detail_dialog').dialog("close");
            }
        }]
    });
}

function getAssetDetailByMoney(id){
	$('#asset_detail_dialog').dialog({
		title: '资产信息',
		height:'auto',
		width: 800,
		closed: false,
		cache: false,
		top:'20%',
		href:$("#rootPath").val()+"/finance/assetManagement/nonstandard/"+id+"/getAssetDetailByMoney",
		modal: true,
		buttons:[{
			text:'确定',
			handler:function(){
				$.messager.confirm('确认','您确认要修改吗？',function(r){
					if (r){
						//"saleAmount":$("#saleAmount").val(),"riskPrice":$("#riskPrice").val(),"everydayPrice":$("#everydayPrice").val(),"singlePrice":$("#singlePrice").val(),"financeAmountMin":$("#financeAmountMin").val(),
						$.post($("#rootPath").val()+"/finance/assetManagement/nonstandard/updateAssetDetail",{"id":id,"message":$("#message").val(),"description":$("#description").val(),"intervalAmount":$("#intervalAmount").val(),"saleAmount":$("#saleAmount").val(),"riskPrice":$("#riskPrice").val(),"purchasePrice":$("#purchasePrice").val(),"assetName":$("#assetName").val(),"guaranteeUnit":$("#guaranteeUnit").val(),"prodId":$("#assetProdId").html(),"assetId":$("#assetAssetId").html()},function(data){
							//if(data.flag){
							$.messager.show({
								title:'资产修改结果',
								msg:data.msg,
								timeout:2000,
								showType:'slide'
							});
							$('#asset_detail_dialog').dialog("close");
							//}
						},"JSON");
					}
				});
			}
		},{
			text:'取消',
			handler:function(){
				$('#asset_detail_dialog').dialog("close");
			}
		}]
	});
}

/**
 * 同步资产信息,将资产信息状态(status)设置为已更新
 */
function syncAsset(assetId){
	$.messager.confirm('确认','您确认要同步吗？',function(r){   
	    if (r){   
	        $.post($("#rootPath").val()+"/finance/assetManagement/jrAssetAssign/"+assetId+"/syncUpdateStatus",{},function(data){
	        	//if(data.flag){
	        		$.messager.show({
								title:'资产同步结果',
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