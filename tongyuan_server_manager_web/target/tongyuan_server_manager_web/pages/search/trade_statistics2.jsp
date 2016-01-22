<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>用户账户查询</title>
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
            src="<%=root%>/js/search/trade_statistics2.js?p=<%=System.currentTimeMillis()%>"></script>
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
            width: 154px !important;
            height: 22px !important;
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
</head>

<body>
<input type="hidden" id="rootPath" value="<%=root%>"/>

<div class="main" style="width: 99%">
    <div id="showFormDiv" class="main" style="width: 99%">
        <form name="search_form">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="10">
                    <tr height="30px;">

                        <td align="right">钱包ID：</td>
                        <td><input id="customerLists" name="customerId"
                                   editable=false panelHeight="auto"/></td>
                        <td align="right">jdpin：</td>
                        <td><input id="jdpinLists" name="jdpin"
                                   editable=false panelHeight="auto"/></td>


                    </tr>

                    <tr height="45px;" align="right">
                        <td colspan="6"><input id="queryBtn" name="button"
                                               type="button" class="greenBtn" value="查  询"/>&nbsp;&nbsp; <input
                                id="resetBtn" type="button" class="greenBtn" value="重置"
                                onclick="clearInput()"/>&nbsp;&nbsp; <input id="exportButton"
                                                                            style="visibility: visibility:;"
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