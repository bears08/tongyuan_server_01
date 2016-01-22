$(function () {

    /**
     * 查询
     */
    $("#queryBtn").click(function () {
        showGrid();
        $("#gridResult").datagrid("load", $("form[name='search_form']").serializeJson());
    });


});

var clickCount = 1; //点击查询按钮的次数
var initialCount = 1; //productList列表加载的次数
var initialCountForMerc = 1;//商户列表的加载次数
var initialCountForPlatForm = 1; //渠道平台列表的加载次数

/**
 * 序列化表单成json对象，ps：方便了datagrid插件load从服务器load数据
 *
 * @memberOf {TypeName}
 * @return {TypeName}
 */
$.fn.serializeJson = function () {
    var serializeObj = {};
    var array = this.serializeArray();
    var str = this.serialize();
    $(array).each(
        function () {
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
var myview = $.extend({}, $.fn.datagrid.defaults.view, {
    onAfterRender: function (target) {
        $.fn.datagrid.defaults.view.onAfterRender.call(this, target);
        var opts = $(target).datagrid('options');
        var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
        vc.children('div.datagrid-empty').remove();
        if (!$(target).datagrid('getRows').length) {
            var d = $('<div class="datagrid-empty" style="color:red;font-weight:bold;"></div>').html(opts.emptyMsg || 'no records').appendTo(vc);
            d.css({
                position: 'absolute',
                left: 0,
                top: 50,
                width: '100%',
                textAlign: 'center'
            });
        }
    }});


//转换日期
function formatLongTime(ms) {
    var date = new Date(ms);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours().toString().length == 1 ? ('0' + date.getHours()) : date.getHours();
    var minute = date.getMinutes().toString().length == 1 ? ('0' + date.getMinutes()) : date.getMinutes();
    var second = date.getSeconds().toString().length == 1 ? ('0' + date.getSeconds()) : date.getSeconds();
    var end = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
    return end;
}


/**
 * 重置
 */
function clearInput() {
    $("form[name='search_form']").form("reset");
    $("#gridResult").datagrid("load", $("form[name='search_form']").serializeJson());
    //重新加载产品列表
    initialCount = 1;
    initialCountForMerc = 1;
    initialCountForPlatForm = 1;
    installProductList();
    installMerchList();
    findAllPlatForm();
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
 * 构造表格
 */
function showGrid() {

    if (clickCount != 1) {
        return;
    }
    clickCount++;

    $('#gridResult').datagrid({
        idField: 'id',
        height: 460,
        view: myview,
        emptyMsg: '<span class="btn icon-bell_error" style="position:relative;top:5px;"></span>没有找到相关记录,请尝试更换搜索条件',
        url: $("#rootPath").val() + "/finance/tradeSearch/statistics/do_search2",
        method: 'post',
        pagination: true,
        rownumbers: false,
        pageList: [ 10, 15, 20, 30, 50, 100 ], // 初始分页大小选择列表.
        showFooter: true,
        striped: true,
        border: false,
        fitColumns: true,
        singleSelect: true,
        title: "数据列表",
        queryParams: $("form[name='search_form']").serializeJson(),
        columns: [
            [ // 定义每一列的字段.  钱包ID，jd_pin，本金，余额，持仓累计，历史累计，更新日期
                {
                    field: 'walletId',
                    title: '钱包id',
                    width: 100,
                    align: 'center'
                },
                {
                    field: 'jdPin',
                    title: 'jdPin',
                    width: 100,
                    align: 'center'
                },
                {
                    field: 'capitalAmt',
                    title: '本金',
                    width: 100,
                    align: 'center'
                },
                {
                    field: 'balanceAmt',
                    title: '余额',
                    width: '200',
                    align: 'center'

                },
                {
                    field: 'profitAmt',
                    title: '持仓累计收益',
                    width: '200',
                    align: 'center'

                },
                {
                    field: 'accuProfitAmt',
                    title: '历史累计收益',
                    width: 130,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                },
                {
                    field: 'modifiedDate',
                    title: '更新日期',
                    width: 130,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return formatLongTime(value);
                    }
                }

            ]
        ],
        onLoad: function () {
            $.messager.progress({text: '正在加载数据，请等待...'});
        },
        onLoadSuccess: function (data) {
            $.messager.progress('close');
        }
    });
}
