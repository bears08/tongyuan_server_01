<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>手工退保</title>
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
            src="<%=root%>/js/exmanager/exc_manager_search.js?p=<%=System.currentTimeMillis()%>"></script>
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
            <a href="<%=root %>/finance/checktodayransom">今日需退</a>
            <a href="<%=root %>/finance/exectodayransom">执行退保</a>

            <br>
            <%--  <th>
                  <td>订单号</td>
                  <td>姓名</td>
                  <td>电话</td>
                  <td>出单时间</td>
              </th>--%>
            <br>
            <c:forEach items="${requestScope.list}" var="order">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.name}</td>
                    <td>${order.phone}</td>
                    <td>${order.issuedtime}</td>

                </tr>
                <br>
            </c:forEach>

        </form>
    </div>


</div>
</body>
</html>