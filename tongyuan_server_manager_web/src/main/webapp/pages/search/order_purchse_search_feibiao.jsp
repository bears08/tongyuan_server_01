<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>非标交易查询</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript"
            src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
    <script type="text/javascript"
            src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.1.3.6.js"></script>
    <script type="text/javascript"
            src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/json.js"></script>
    <script type="text/javascript"
            src="<%=root%>/js/search/order_purchse_search2.js?p=<%=System.currentTimeMillis()%>"></script>
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css"
          type="text/css">
    <link rel="stylesheet"
          href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css"
          type="text/css">
    <style type="text/css">
        table tr td {
            font-size: 12px;
        }

        .custsearchInput {
            width: 156px;
            height: 24px;
        }

        .combo {
            border: 1px solid #CDDBC2;
            width: 158px !important;
            height: 26px !important;
        }

        .main {
            overflow: hidden;
        }

        #totalNum {
            width: 158px !important;
        }

        .validatebox-text {
            width: 136px !important;
        }

        .datagrid-view2 {
            left: 0;
        }

        .datagrid {
            border: 1px solid #CDDBC2;
        }
    </style>
    <script type="text/javascript">
        function myformatter(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
        }

        function myparser(s) {
            if (!s) return new Date();
            var ss = (s.split('-'));
            var y = parseInt(ss[0], 10);
            var m = parseInt(ss[1], 10);
            var d = parseInt(ss[2], 10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
                return new Date(y, m - 1, d);
            } else {
                return new Date();
            }
        }

        $(function () {
            //设置时间
            　  var curr_time = new Date();
  　 $("#time5").datetimebox("setValue", myformatter(curr_time) + ' 00:00:00');
 　 $("#time6").datetimebox("setValue", myformatter(curr_time) + ' 23:59:59');
 　     document.getElementById("time1").value = myformatter(curr_time) + ' 00:00:00';
             　     document.getElementById("time2").value = myformatter(curr_time) + ' 23:59:59';

        });





        $('#time5').datetimebox({
            showSeconds:false,
            required:true,
            onSelect:function(date){
                alert("hj");
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                var d = date.getDate();
                var time=$('#time5').datetimebox('spinner').spinner('getValue');
                var dateTime = y + "-" + (m < 10 ? ("0" + m) : m) + "-" + (d < 10 ? ("0" + d) : d) +' '+time;
              　     document.getElementById("time1").value =dateTime;

            }
        });

        $('#time6').datetimebox({
            showSeconds:false,
            required:true,
            onSelect:function(date){
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                var d = date.getDate();
                var time=$('#time6').datetimebox('spinner').spinner('getValue');
                var dateTime = y + "-" + (m < 10 ? ("0" + m) : m) + "-" + (d < 10 ? ("0" + d) : d) +' '+time;
              　     document.getElementById("time2").value =dateTime;

            }
        });

    </script>
</head>

<body>
<input type="hidden" id="rootPath" value="<%=root%>"/>

<div class="main" style="width: 99%">
    <div id="showFormDiv" class="main" style="width: 99%">
        <form name="search_form">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="10">
                    <tr height="30px;">
                        <td align="right">交易时间：</td>
                        <input type="hidden" id="time1" name="time1">      </input>
                        <input type="hidden" id="time2" name="time2">      </input>

                        <td><input id="time5" name="time5" type="text" class="easyui-datetimebox"></input>&nbsp;-&nbsp;
                            <input id="time6" name="time6" type="text" class="easyui-datetimebox"></input></td>


                        <td align="right">资产类型：</td>
                        <td><select id="asset_type" class="easyui-combobox"
                                    panelHeight='auto' editable='false' name="assetType"
                                    style="width: 100px;">
                            <option value="">请选择</option>
                            <option value="债权">非标</option>
                            <option value="金融票据">金融票据</option>

                        </select></td>
                        <td align="right">&nbsp;资产提供方：</td>
                        <td align="left"><input id="mercList" name="mercId"
                                                editable=false panelHeight="auto"/></td>
                    </tr>
                    <tr height="35px;">
                        <td align="right">资产编号：</td>
                        <td><input id="asset_id" name="assetId" type="text"
                                   class="custsearchInput"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申购订单号：<input
                                    id="orderId" name="orderId" type="text" class="custsearchInput"/>
                        </td>
                        <!-- <td align="right">资产批次：</td>
                        <td><input id="batch_no" name="batchNo" type="text"
                            class="custsearchInput" /></td> -->
                        <td align="right">理财产品：</td>
                        <td><input id="productTypeList" name="pId" editable=false
                                   panelHeight="auto"/></td>


                        <td align="right">订单来源：</td>
                        <td><select id="orderSource" class="easyui-combobox"
                                    panelHeight='auto' editable='false' name="orderSource"
                                    style="width: 100px;">
                            <option value="">请选择</option>
                            <option value="IOS_NATIVE">IOS原生</option>
                            <option value="ANDROID_NATIVE">安卓原生</option>
                            <option value="IOS_H5">IOS_H5</option>
                            <option value="ANDROID_H5">安卓_H5</option>


                        </select></td>


                    </tr>
                    <tr>
                        <td align="right">钱包ID：</td>
                        <td><input id="walletId" name="walletId" type="text"
                                   class="custsearchInput"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<input
                                    id="userName" name="userName" type="text"
                                    class="custsearchInput"/></td>
                        <td align="right">手机号：</td>
                        <td><input id="phone" name="phone" type="text"
                                   class="custsearchInput"/></td>
                        <td align="right">支付状态：</td>
                        <td><select id="payStatus" class="easyui-combobox"
                                    panelHeight='auto' editable='false' name="payStatus"
                                    style="width: 100px;">
                            <option value="">请选择</option>
                            <option value="0">支付成功</option>
                            <option value="1">支付失败</option>
                        </select></td>
                    </tr>


                    <tr>
                        <td align="right">京东pin：</td>
                        <td><input id="jd_pin" name="jd_pin" type="text"
                                   class="custsearchInput"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;资产sku：<input
                                    id="asset_sku" name="asset_sku" type="text"
                                    class="custsearchInput"/></td>
                        <td align="right">业务单号：</td>
                        <td><input id="bus_order_id" name="bus_order_id" type="text"
                                   class="custsearchInput"/></td>
                        <td align="right">金融单号：</td>
                        <td><input id="plat_order_id" name="plat_order_id" type="text"
                                   class="custsearchInput"/></td>

                    </tr>

                    <tr>
                        <%--<td align="right">赎回时间：</td>--%>
                        <%--<td><input name="time3" type="text" class="easyui-datetimebox"></input>&nbsp;-&nbsp;--%>
                            <%--<input name="time4" type="text" class="easyui-datetimebox"></input></td>--%>
                        <td align="right">支付单号：</td>

                            <td><input id="pay_order_id" name="pay_order_id" type="text"
                                   class="custsearchInput"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            支付工具： <select id="pay_enum" name="payEnum" class="easyui-combobox"
                                        editable=false panelHeight="auto" style="width: 100px;">
                                <option value="">请选择</option>
                                <option value="CARD">银行卡</option>
                                <option value="GOLD">小金库</option>
                            </select>
                        </td>
                        <td align="right">订单状态：</td>
                        <%--  1	CLOSED：订单关闭
                          2	BUY_SUCCESS：认购成功
                          3	REFUND_SUCCESS：退款成功
                          4	BUY_FAILURE：下单异常
                          5	JR_ORDER_ERROR：下单失败
                          6	PAY_SUCCESS：支付成功
                          7	WAIT_PAY：等待支付结果
                          8	INIT：初始化
                          9 REFUNDING:退款中--%>

                        <td><select id="orderstatus" class="easyui-combobox"
                                    panelHeight='auto' editable='false' name="orderstatus"
                                    style="width: 100px;">
                            <option value="">请选择</option>
                            <option value="BUY_SUCCESS">认购成功</option>
                            <option value="CLOSED">订单关闭</option>
                            <option value="REFUND_SUCCESS">退款成功</option>
                            <option value="BUY_FAILURE">下单异常</option>
                            <option value="JR_ORDER_ERROR">下单失败</option>
                            <option value="PAY_SUCCESS">支付成功</option>
                            <option value="WAIT_PAY">等待支付结果</option>
                            <option value="INIT">初始化</option>
                            <option value="REFUNDING">退款中</option>
                            <option value="RANSOM_SUCCESS">已赎回</option>

                        </select></td>
                            <td></td>

                    </tr>
                    <tr height="30px;" align="right">


                        <td>

                        </td>
                        <td colspan="1"><input id="queryBtn" name="button"
                                               type="button" class="greenBtn" value="查  询"/>&nbsp;&nbsp; <input
                                id="resetBtn" type="button" class="greenBtn" value="重置"
                                onclick="clearInput()"/>&nbsp;&nbsp; <input id="exportButton"
                                                                            style="visibility: visibility;"
                                                                            type="button" class="greenBtn"
                                                                            onclick="exprotExcel()" value="导 出"/></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>

    <div style="height: 8px;"></div>
    <table id="gridResult" class="easyui-datagrid"></table>

    <!-- 投资记录错误信息dialog -->
    <div id="dd_msg" style="padding: 10px;"></div>

</div>
</body>
</html>