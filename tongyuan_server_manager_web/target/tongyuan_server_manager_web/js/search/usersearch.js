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

function search(){
    showGrid();
    $('#gridResult').datagrid('options').pageNumber = 1; //重新设置页码从1开始
//    $("#gridResult").datagrid('reload'); //重新加载
}

function holdSearch(){
    showHoldGrid();
    $('#gridResult').datagrid('options').pageNumber = 1; //重新设置页码从1开始
}

function clearInput(){
    var txts = document.getElementsByTagName("input");
    for (var i = 0; i < txts.length; i++) {
        if (txts[i].type == "text") {
            txts[i].value = "";
        }
    }
    $("select").val("")
}

function assetDetail(walletId){
    $('#gridHoldResult').datagrid('loadData', { total: 0, rows: [] });
    $('#assetdetail').dialog({
        title: '资产明细',
        width:730,
        height: 400,
        closed: false,
        cache: false,
        modal: true,
        resizable:true
    });
    $("#hiddenWalletId").val(walletId);
    var curr_time = new Date();
    $("#holdtime1").datebox("setValue",myformatter(curr_time));
    $("#holdtime2").datebox("setValue",myformatter(curr_time));
    $("#assetdetail table").show();
}

/**
 * 构造表格
 */
function showGrid() {
    var time1 = $('#time1').datebox('getValue');
    var time2 = $('#time2').datebox('getValue');
    var walletId = $("#walletId").val();
    var name = $("#name").val();
    var phone = $("#phone").val();
    var jdpin = $("#jd_pin").val();
    var param = {"time1": time1, "time2": time2, "walletId": walletId, "name": name, "phone": phone,"jdpin":jdpin};
    var paramStr = JSON.stringify(param);

    $('#gridResult').datagrid({
        url: $("#rootPath").val()+"/finance/usersearch.html",//?=" + paramStr, //URL
        title: "查询列表", //窗口标题
        height:460,
        view:myview,
		emptyMsg:'<span class="btn icon-bell_error" style="position:relative;top:5px;"></span>没有找到相关记录 ...',
        iconCls: 'icon-tree-level', //窗口栏图标
        pagination: true,  //显示一个分页工具栏在datagrid 下面.
        nowrap: false,     //true显示数据在一行
        singleSelect: true,//是否单选
        striped: true,    //显示条纹所有行
        collapsible: false, //不可折叠 (默认false)
        showFooter: true,  //显示行页脚.
        showHeader: true,  //显示行标题
        autoSizeColumn: true, //调整行的宽度适应内容
        pageNumber: 1, //,初始页码.
        pageSize: 10,  //初始分页大小
        pageList: [ 10, 15, 20, 30, 50, 100 ],  //初始分页大小选择列表.
        method: 'post',   //请求方法类型
        idField: 'userId',  //指明那一个字段是标识列.
        sortName: 'createdDate', //排序字段
        sortOrder: 'desc',//排序方式
        queryParams: {paramStr:paramStr},//当请求远程数据时，也可以发送额外的参数。
        columns: [
           [    //定义每一列的字段.
                {field: 'createdDate', title: '开户时间',width:100, align: 'center'},
                {field: 'name', title: '用户姓名', width:100, align: 'center'},
                {field: 'identityCardId', title: '身份证号',width:200,  align: 'center'},
                {field: 'jdPin', title: '京东PIN',width:200,  align: 'center'},
                {field: 'walletId', title: '钱包ID', width:200, align: 'center'},
                {field: 'phone', title: '手机号', width:150, align: 'center'},
                {field: 'bankName', title: '银行名', width:150, align:'center'},
                {field: 'bankCardId', title: '银行卡号', width:150, align:'center'},
                {field: 'email', title: '邮箱', width:150, align:'center'},
                {field: 'address', title: '地址', width:150, align:'center'},
                {field: 'capitalAmt', title: '资产总额', width:100,align: 'center'},
                {field: 'profitAmt', title: '累计收益', width:100, align: 'center'},
                {field: 'mingxi', title: '资产明细',width:200, align: 'center',
                    formatter:function(value, rec){
                        var str = '<a style="color:#0000ff" href="javascript:assetDetail(\'' + rec.walletId + '\')">明细</a>';
                        return str;
                    }
                }
            ]
        ]
    });
}

function showHoldGrid() {
    var time1 = $('#holdtime1').datebox('getValue');
    var time2 = $('#holdtime2').datebox('getValue');
    var assetId = $("#assetId").val();
    var walletId = $("#hiddenWalletId").val();
    var param = {"time1": time1, "time2": time2, "assetId": assetId,"walletId":walletId};
    var paramStr = JSON.stringify(param);
	
    $('#gridHoldResult').datagrid({
        url: $("#rootPath").val()+"/finance/userholdsearch.html", //URL
        title: "查询列表", //窗口标题
        height:280,
        view:myview,
		emptyMsg:'<span class="btn icon-bell_error" style="position:relative;top:5px;"></span>没有找到相关记录 ...',
        iconCls: 'icon-tree-level', //窗口栏图标
        pagination: true,  //显示一个分页工具栏在datagrid 下面.
        nowrap: false,     //true显示数据在一行
        singleSelect: false,//是否单选
        striped: true,    //显示条纹所有行
        collapsible: false, //不可折叠 (默认false)
        showFooter: true,  //显示行页脚.
        showHeader: true,  //显示行标题
        autoSizeColumn: true, //调整行的宽度适应内容
        pageNumber: 1, //,初始页码.
        pageSize: 10,  //初始分页大小
        pageList: [ 10, 15, 20, 30, 50, 100 ],  //初始分页大小选择列表.
        method: 'post',   //请求方法类型
        idField: 'userId',  //指明那一个字段是标识列.
        sortName: 'createdDate', //排序字段
        sortOrder: 'desc',//排序方式
        queryParams: {paramStr:paramStr},
        columns: [
           [    //定义每一列的字段.
                {field: 'orderTime', title: '持仓日期',width:100, align: 'center'},
                {field: 'productName', title: '资产名称', width:100, align: 'center'},
                {field: 'productId', title: '资产编号',width:100,  align: 'center'},
                {field: 'amount', title: '买入金额', width:100, align: 'center'},
                {field: 'currentValue', title: '当前市值', width:100,align: 'center'},
                {field: 'lastProfit', title: '昨日收益', width:100,align: 'center'},
                {field: 'profitAmt', title: '累计收益', width:100, align: 'center'}
            ]
        ]
    });
//    $("#gridHoldResult").datagrid("load",{paramStr:paramStr});
}

function myformatter(date){
    var y = date.getFullYear();
    var m = date.getMonth()+1;
    var d = date.getDate();
    return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
}

function myparser(s){
    if (!s) return new Date();
    var ss = (s.split('-'));
    var y = parseInt(ss[0],10);
    var m = parseInt(ss[1],10);
    var d = parseInt(ss[2],10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
        return new Date(y,m-1,d);
    } else {
        return new Date();
    }
}
