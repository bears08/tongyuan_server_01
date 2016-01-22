<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户查询</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/search/usersearch.js?p=<%=System.currentTimeMillis()%>"></script>
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/css/common/common_easyui.css" type="text/css">
    <style type="text/css">
table tr td {
	font-size: 12px;
}

.custsearchInput {
	width: 145px;
	height: 24px;
}

.combo {
	border: 1px solid #CDDBC2;
	width: 146px !important;
	height: 22px !important;
}

.main {
	overflow: hidden;
}

.validatebox-text {
	width: 124px !important;
}

.datagrid-view2 {
	left: 0;
}

    </style>
</head>

<body>
<input type="hidden" id="rootPath" value="<%=root%>" />
<div class="main" style="width: 99%">
    <div id="showFormDiv" class="main" style="width: 99%">
        <form name="form1" action="">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right">开户时间：</td>
                            <td><input id="time1" type="text" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable=false></input>&nbsp;-&nbsp;
                                <input id="time2" type="text" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable=false></input></td>
                        <td align="right">钱包ID：</td>
                        <td>
                            <input id="walletId" name="walletId" type="text" class="custsearchInput"/>
                        </td>
                        <td align="right">姓名：</td>
                        <td>
                            <input id="name" name="name" type="text" class="custsearchInput"/>
                        </td>
                        <td align="right">JD_Pin：</td>
                        <td>
                            <input id="jd_pin" name="jdpin" type="text" class="custsearchInput"/>
                        </td>
                    </tr>
                    <tr align="center">
                    	 <td align="right">手机号码：</td>
                        <td align="left">
                            <input id="phone" name="phone" type="text" class="custsearchInput"/>
                        </td>
                       
                        <td colspan="6" align="right" ><input id="queryBtn" name="button" onclick="search();"
                                   type="button" class="greenBtn" value="查  询"/>
                            <input id="resetBtn" type="button" class="greenBtn" value="重置"
                                   onclick="clearInput()"/></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>

    <div style="height: 8px;"></div>
    <table id="gridResult" class="easyui-datagrid">
    </table>

    <div id="assetdetail">
        <table style="display: none;" class="shortSearch h40">
            <tr>
                <td><input type="hidden" id="hiddenWalletId"></td>
                <td align="right">持仓时间：</td>
                <td><input id="holdtime1" type="text" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable=false></input>&nbsp;-&nbsp;
                    <input id="holdtime2" type="text" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable=false></input></td>
                <td align="right">资产编号：</td>
                <td> <input id="assetId" name="assetId" type="text" class="custsearchInput" style="width: 110px"/></td>
                <td><input id="holdSearch" name="button" onclick="holdSearch();"
                           type="button" class="greenBtn" value="查  询"/></td>
            </tr>
        </table>
        <table id="gridHoldResult" class="easyui-datagrid">
        </table>
    </div>
</div>
</body>
</html>