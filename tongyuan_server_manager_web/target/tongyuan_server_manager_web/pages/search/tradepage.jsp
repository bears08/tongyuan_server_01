<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户查询</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <META http-equiv="X-UA-Compatible" content="IE=9" />
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
    <script type="text/javascript">var root = "<%=root%>"; </script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/json.js"></script>
    <script type="text/javascript" src="<%=root%>/js/trade/trade.js"></script>
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/css/common/common_easyui.css" type="text/css">
    <style type="text/css">
        table tr td{
            font-size: 12px;
            height: 25px;
        }
    </style>
</head>

<body>
<div class="main" style="width: 99%">
    <div id="showFormDiv" class="main" style="width: 99%">
        <form action="">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right">交易时间：</td>
                            <td><input id="time1" type="text" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" required="required" />&nbsp;-&nbsp;
                                <input id="time2" type="text" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" required="required" /></td>
                        <td align="left">资产类型：
                            <select id="asset_type" class="easyui-combobox" panelHeight='auto' editable='false'  name="assetType" style="width:100px;">
                                <option value="非标" selected="selected">非标</option>
                                <option value="基金">基金</option>
                                <option value="保险">保险</option>
                            </select>
                        </td>
                        <td align="right">资产提供方：</td>
                        <td align="left">
                            <select id="merc_id" class="easyui-combobox" panelHeight='auto' editable='false'  name="mercId" style="width:100px;">
                                <option value="宏康保险" selected="selected">宏康保险</option>
                                <option value="天弘基金">天弘基金</option>
                            </select>
                        </td>
                        <td align="right">理财产品：</td>
                        <td align="right">
                            <select id="prod_id" class="easyui-combobox" panelHeight='auto' editable='false'  name="prodId" style="width:100px;">
                                <option value="1" selected="selected">1个月</option>
                                <option value="3">3个月</option>
                                <option value="6">6个月</option>
                                <option value="12">12个月</option>
                            </select>
                        </td>
                        <td align="right">渠道类型：</td>
                        <td align="right">
                            <select id="plat_id" class="easyui-combobox" panelHeight='auto' editable='false'  name="platId" style="width:100px;">
                                <option value="钱包APP" selected="selected">钱包APP</option>
                                <option value="微信">微信</option>
                                <option value="京东APP">京东APP</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">交易类型：</td>
                        <td align="left">
                            <select id="trade_type" class="easyui-combobox" panelHeight='auto' editable='false'  name="tradeType" style="width:100px;">
                                <option value="invest" selected="selected">投资</option>
                                <option value="ransom">赎回</option>
                            </select>
                        </td>
                        <td><input id="queryBtn" name="button" onclick="search();"
                                   type="button" class="greenBtn" value="查  询"/>
                            <input id="resetBtn" type="button" class="greenBtn" value="导出"
                                   onclick="exportExcel()"/></td>
                    </tr>
                </table>
                <table width="99%">
                    <tr align="center">

                    </tr>
                </table>
            </div>
        </form>
    </div>

    <div style="height: 8px;"></div>
    <table id="gridResult" class="easyui-datagrid">
    </table>
</div>
</body>
</html>