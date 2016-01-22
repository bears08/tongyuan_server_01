$(function () {

    /**
     * 查询
     */
    $("#queryBtn").click(function () {
        showGrid();
        $("#gridResult").datagrid("load", $("form[name='search_form']").serializeJson());
    });


    /**
     * 初始化产品列表
     */
    installProductList();

    installMerchList();

    findAllPlatForm();

});

var clickCount = 1; // 点击查询按钮的次数
var initialCount = 1; // productList列表加载的次数
var initialCountForMerc = 1;// 商户列表的加载次数
var initialCountForPlatForm = 1; // 渠道平台列表的加载次数

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
    $(array).each(function () {
        if (serializeObj[this.name]) {
            if ($.isArray(serializeObj[this.name])) {
                serializeObj[this.name].push(this.value);
            } else {
                serializeObj[this.name] = [serializeObj[this.name], this.value];
            }
        } else {
            serializeObj[this.name] = this.value;
        }
    });
    return serializeObj;
};

/**
 * 扩展datagrid view 默认视图，用于显示记录数为0时告诉用户没有找到对应条件的数据
 *
 * @param {Object}
 *            target
 * @memberOf {TypeName}
 */
var myview = $.extend({}, $.fn.datagrid.defaults.view, {
    onAfterRender: function (target) {
        $.fn.datagrid.defaults.view.onAfterRender.call(this, target);
        var opts = $(target).datagrid('options');
        var vc = $(target).datagrid('getPanel').children('div.datagrid-view');
        vc.children('div.datagrid-empty').remove();
        if (!$(target).datagrid('getRows').length) {
            var d = $('<div class="datagrid-empty" style="color:red;font-weight:bold;"></div>')
                .html(opts.emptyMsg || 'no records').appendTo(vc);
            d.css({
                position: 'absolute',
                left: 0,
                top: 50,
                width: '100%',
                textAlign: 'center'
            });
        }
    }
});

// 转换日期
function formatLongTime(ms) {
    var date = new Date(ms);
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours().toString().length == 1
        ? ('0' + date.getHours())
        : date.getHours();
    var minute = date.getMinutes().toString().length == 1 ? ('0' + date
        .getMinutes()) : date.getMinutes();
    var second = date.getSeconds().toString().length == 1 ? ('0' + date
        .getSeconds()) : date.getSeconds();
    var end = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":"
        + second;
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
function clearInput() {
    $("form[name='search_form']").form("reset");
    $("#gridResult").datagrid("load",
        $("form[name='search_form']").serializeJson());
    // 重新加载产品列表
    initialCount = 1;
    initialCountForMerc = 1;
    initialCountForPlatForm = 1;
    installProductList();
    installMerchList();
    findAllPlatForm();
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
        idField: 'orderId',
        height: 460,
        view: myview,
        emptyMsg: '<span class="btn icon-bell_error" style="position:relative;top:5px;"></span>没有找到相关记录,请尝试更换搜索条件',
        url: $("#rootPath").val()
            + "/finance/tradeSearch/orderPurchse/do_search2",
        method: 'post',
        pagination: true,
        pageList: [10, 15, 20, 30, 50, 100], // 初始分页大小选择列表.
        showFooter: true,
        striped: true,
        border: false,
        // fitColumns : true,
        singleSelect: true,
        queryParams: $("form[name='search_form']").serializeJson(),
        title: "数据列表",
        rownumbers: false,
        columns: [
            [ // 定义每一列的字段.

                {
                    field: 'null',
                    title: '交易时间',
                    width: '130',
                    align: 'center',
                    formatter: function (value, row, index) {
                        return formatLongTime(row.orderTime);
                    }
                },
                {
                    field: 'payTime',
                    title: '支付完成时间',
                    width: 130,
                    align: 'center',
                    formatter: function (value, row, index) {

                        if (formatLongTime(row.payTime) == "1970-1-1 08:00:00") {
                            return "";

                        }

                        return formatLongTime(row.payTime);
                    }
                } ,
                {
                    field: 'successTime',
                    title: '认购完成时间',
                    width: 130,
                    align: 'center',
                    formatter: function (value, row, index) {

                        if (formatLongTime(row.successTime) == "1970-1-1 08:00:00") {
                            return "";

                        }
                        return formatLongTime(row.successTime);
                    }
                } ,
                {
                    field: 'calcInterestTime',
                    title: '起息时间',
                    width: '130',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (row.calcInterestTime == null || formatLongTime(row.calcInterestTime) == "1970-1-1 08:00:00") {
                            return "";

                        }
                        return formatLongTime(row.calcInterestTime);
                    }
                },
                {
                    field: 'redemptionDate',
                    title: '到期时间',
                    width: '130',
                    align: 'center',
                    formatter: function (value, row, index) {
                        if (formatLongTime(row.redemptionDate) == "1970-1-1 08:00:00") {
                            return "";

                        }
                        return formatLongTime(row.redemptionDate);
                    }
                },
                {
                    field: 'expectIncome',
                    title: '预期收益',
                    width: '130',
                    align: 'center'

                },
                {
                    field: 'orderId',
                    title: '申购订单号',
                    width: 170,
                    align: 'center'
                },
                {
                    field: 'transOrderId',
                    title: '支付流水号',
                    width: 170,
                    align: 'center'
                },
                {
                    field: 'userName',
                    title: '姓名',
                    width: 70,
                    align: 'center'
                },
                {
                    field: 'walletId',
                    title: '钱包ID',
                    width: 150,
                    align: 'center'
                },
                {
                    field: 'phone',
                    title: '手机号码',
                    width: 100,
                    align: 'center'
                },

                {
                    field: 'amount',
                    title: '投资金额',
                    width: 100,
                    align: 'center',
                    formatter: function (v, r, i) {
                        return formatMoney(v);
                    }
                },

                {
                    field: 'payStatus',
                    title: '支付状态',
                    width: 100,
                    align: 'center',
                    formatter: function (value, row, index) {

                        var status;

                        if (value == "0") {
                            status = "支付成功";
                        } else if (value == "1") {
                            status = "支付失败";
                        } else {
                            status = "未支付";
                        }

                        return status;
                    }
                },

                {
                    field: 'status',
                    title: '投资状态',
                    width: 100,
                    align: 'center',
                    formatter: function (value, row, index) {
                        var str = "";
                        var s = value;
                        if (s == "INIT") {
                            str = "初始化";
                        } else if (s == "ORDERSUCCESS") {
                            str = "下单成功";
                        } else if (s == "ORDERFAIL") {
                            str = "<a href='javascript:void(0);' onclick='show_err_msg(\"" + row.errorMsg + "\")' style='font-size: 11px;color: blue;'>下单失败</a>";
                        } else if (s == "SIGNSUCCESS") {
                            str = "签约成功";
                        } else if (s == "SIGNFAIL") {
                            str = "<a href='javascript:void(0);' onclick='show_err_msg(\"" + row.errorMsg + "\")' style='font-size: 11px;color: blue;'>签约失败</a>";
                        } else if (s == "CASHSUCCESS") {
                            str = "收银成功";
                        } else if (s == "CASHFAIL") {
                            str = "<a href='javascript:void(0);' onclick='show_err_msg(\"" + row.errorMsg + "\")' style='font-size: 11px;color: blue;'>收银失败</a>";
                        } else if (s == "ACCOUNTSUCCESS") {
                            str = "入账成功";
                        } else if (s == "ACCOUNTFAIL") {
                            str = "<a href='javascript:void(0);' onclick='show_err_msg(\"" + row.errorMsg + "\")' style='font-size: 11px;color: blue;'>入账失败</a>";
                        } else if (s == "JR_ORDER_ERROR") {
                            str = "金融下单失败";
                        } else if (s == "WAIT_PAY") {
                            str = "待支付";
                        } else if (s == "PAY_SUCCESS") {
                            str = "支付成功";
                        } else if (s == "PAY_FAILURE") {
                            str = "支付失败";
                        } else if (s == "BUY_SUCCESS") {
                            str = "交易成功";
                        } else if (s == "BUY_FAILURE") {
                            str = "交易关闭";
                        } else if (s == "RANSOMING") {
                            str = "赎回中";
                        } else if (s == "RANSOM_SUCCESS") {
                            str = "交易完成";
                        } else if (s == "RANSOM_ERROR") {
                            str = "赎回失败";
                        } else if (s == "REFUND_SUCCESS") {
                            str = "退款成功";
                        } else if (s == "REFUNDING") {
                            str = "退款中";
                        } else if (s == "REFUND_FAILURE") {
                            str = "退款失败";
                        } else if (s == "CLOSED") {
                            str = "已关单";
                        } else if (s == "PAY_NOTIFY_FAIL") {
                            str = "支付系统返回失败";
                        }
                        return str;
                    }} ,
                {
                    field: 'assertId',
                    title: '资产编号',
                    width: 70,
                    align: 'center'
                },
                {
                    field: 'assetName',
                    title: '资产名称',
                    width: 70,
                    align: 'center'
                },
                {
                    field: 'financePeriod',
                    title: '资产期限',
                    width: 70,
                    align: 'center'
                },
                {
                    field: 'returnRate',
                    title: '资产年化收益率',
                    width: 70,
                    align: 'center'
                },
                {
                    field: 'mercName',
                    title: '资产提供方',
                    width: 70,
                    align: 'center'
                },
                {
                    field: 'name',
                    title: '理财产品',
                    width: 70,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                } ,


                {
                    field: 'jdPin',
                    title: '京东pin',
                    width: 70,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                } ,
                {
                    field: 'assetSku',
                    title: '资产sku',
                    width: 70,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                } ,
                {
                    field: 'busOrderId',
                    title: '业务返回单号',
                    width: 130,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                } ,
                {
                    field: 'platOrderId',
                    title: '金融交易系统返回单号',
                    width: 130,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                } ,

                {
                    field: 'accumulateProfit',
                    title: '累积收益',
                    width: 70,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                } ,


                {
                    field: 'payenum',
                    title: '支付工具',
                    width: 120,
                    align: 'center',
                    formatter: function (value, row, index) {

                        var status;

                        if (value == "wallet") {
                            status = "钱包余额支付";
                        } else if (value == "GOLD") {
                            status = "小金库";
                        } else {
                            status = "银行卡支付";
                        }

                        return status;
                    }
                },

                {
                    field: 'cardNo',
                    title: '银行卡号',
                    width: 70,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                },

                {
                    field: 'bankCode',
                    title: '银行编码',
                    width: 70,
                    align: 'center',
                    formatter: function (value, row, index) {
                        return value;
                    }
                }
            ]
        ],
        onLoad: function () {
            $.messager.progress({
                text: '正在加载数据，请等待...'
            });
        },
        onLoadSuccess: function (data) {
            $.messager.progress('close');
        }
    });
}

/**
 * 初始化产品下拉框
 */
function installProductList() {

    $('#productTypeList').combobox({
        valueField: 'id',
        textField: 'name',
        url: $("#rootPath").val()
            + "/finance/assetManagement/publish/getAllProducts",
        onLoadSuccess: function () {
            if (initialCount == 1) {
                initialCount++;
                var dataJson = $(this).combobox("getData");
                var jsonStr = JSON.stringify(dataJson);
                var newJsonStr = jsonStr.substr(1, jsonStr.length);
                newJsonStr = "[{\"id\":-1,\"name\":\"请选择\",\"selected\":true},"
                    + newJsonStr;
                var data = JSON.parse(newJsonStr);
                $(this).combobox("loadData", data);
            }
        }
    });
}

/**
 * 初始化商户列表
 */
function installMerchList() {

    $('#mercList').combobox({
        valueField: 'mercId',
        textField: 'mercName',
        url: $("#rootPath").val()
            + "/finance/tradeSearch/orderPurchse/findAllMerchant",
        onLoadSuccess: function () {
            if (initialCountForMerc == 1) {
                initialCountForMerc++;
                var dataJson = $(this).combobox("getData");
                var jsonStr = JSON.stringify(dataJson);
                var newJsonStr = jsonStr.substr(1, jsonStr.length);
                newJsonStr = "[{\"mercId\":-1,\"mercName\":\"请选择\",\"selected\":true},"
                    + newJsonStr;
                var data = JSON.parse(newJsonStr);
                $(this).combobox("loadData", data);
            }
        }
    });
}

/**
 * 初始化渠道平台信息列表
 */
function findAllPlatForm() {

    $('#platFormList').combobox({
        valueField: 'code',
        textField: 'name',
        url: $("#rootPath").val()
            + "/finance/tradeSearch/orderPurchse/findAllPlatForm",
        onLoadSuccess: function () {
            if (initialCountForPlatForm == 1) {
                initialCountForPlatForm++;
                var dataJson = $(this).combobox("getData");
                var jsonStr = JSON.stringify(dataJson);
                var newJsonStr = jsonStr.substr(1, jsonStr.length);
                newJsonStr = "[{\"code\":-1,\"name\":\"请选择\",\"selected\":true},"
                    + newJsonStr;
                var data = JSON.parse(newJsonStr);
                console.info(data);
                $(this).combobox("loadData", data);
            }
        }
    });
}

/**
 * 显示投资交易错误信息
 *
 * @param {}
 *            msg
 */
function show_err_msg(msg) {
    $("#dd_msg").dialog({
        title: '投资交易错误信息',
        width: 400,
        height: 200,
        closed: false,
        cache: false,
        modal: true
    });
    $("#dd_msg").text(msg);
}

/**
 * 导出excel
 */
function exprotExcel() {
    $("form[name='search_form']").form("submit", {
        url: $("#rootPath").val()
            + "/finance/tradeSearch/orderPurchse/export_excel",
        success: function (data) {

        }
    });

}
