function search(){
    showGrid();
    $('#gridResult').datagrid('options').pageNumber = 1; //重新设置页码从1开始
}

function exportExcel(){
    var time1 = $('#time1').datebox('getValue');
    var time2 = $('#time2').datebox('getValue');
    var assetType = $("#asset_type").val();
    var mercId = $("#merc_id").val();
    var prodId = $("#prod_id").val();
    var platId = $("#plat_id").val();
    var tradeType = $("#trade_type").val();
    var param = {"beginTime": time1, "endTime": time2, "assetType": assetType, "mercId": mercId, "prodId": prodId, "platId":platId, "tradeType":tradeType};
    var paramStr = JSON.stringify(param);
    //导出
    var url = "/finance/trade/exportexcel?paramStr=" + paramStr;
    window.location.href= url;
}



function showGrid() {
    var time1 = $('#time1').datebox('getValue');
    var time2 = $('#time2').datebox('getValue');
    var assetType = $("#asset_type").val();
    var mercId = $("#merc_id").val();
    var prodId = $("#prod_id").val();
    var platId = $("#plat_id").val();
    var tradeType = $("#trade_type").val();
    var param = {"beginTime": time1, "endTime": time2, "assetType": assetType, "mercId": mercId, "prodId": prodId, "platId":platId, "tradeType":tradeType};
    var paramStr = JSON.stringify(param);

    $('#gridResult').datagrid({
        url: "/finance/tradesearch.html?paramStr=" + paramStr, //URL
        title: "查询列表", //窗口标题
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
        queryParams: param,//当请求远程数据时，也可以发送额外的参数。
        columns: [
            [    //定义每一列的字段.
                {field: 'channelType', title: '渠道类型',width:100, align: 'center'},
                {field: 'tradeBeginTime', title: '交易时间(起)', width:100, align: 'center'},
                {field: 'tradeEndTime', title: '交易时间(止)',width:200,  align: 'center'},
                {field: 'productName', title: '理财产品', width:100, align: 'center'},
                {field: 'assetType', title: '资产类型', width:150, align: 'center'},
                {field: 'mercId', title: '资产提供方', width:150, align:'center'},
                {field: 'orderAmount', title: '下单金额', width:150, align:'center'},
                {field: 'turnOverAmount', title: '成交金额', width:150, align:'center'},
                {field: 'orderCount', title: '下单笔数', width:150, align:'center'},
                {field: 'effectOrderCount', title: '有效笔数', width:100,align: 'center'},
                {field: 'buyPeopleNum', title: '下单人数', width:100, align: 'center'},
                {field: 'effectPeopleNum', title: '有效人数', width:100, align: 'center'}
            ]
        ]
    });
}