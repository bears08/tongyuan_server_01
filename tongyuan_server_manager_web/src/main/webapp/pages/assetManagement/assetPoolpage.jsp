<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>资产评审</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <META http-equiv="X-UA-Compatible" content="IE=9" />
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="<%=root%>/js/datejs/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">var root = "<%=root%>"; </script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/json.js"></script>
    <script type="text/javascript" src="<%=root%>/js/jquery/scombobox/scombox.js"></script>
    <script type="text/javascript" src="<%=root%>/js/search/search.js/search.js"></script>
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/css/common/common_easyui.css" type="text/css">
</head>

<body>
    <div id="showFormDiv" class="main" style="width: 99%">
        <form action="/finance/assetpool.html">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right">发行机构:</td>
                        <td>
                            <input id="mercId" name="mercId" type="text" class="custsearchInput" value="${mercId}"/>
                        </td>
                        <td align="right">资产批次号:</td>
                        <td>
                            <input id="batchno" name="batchNo" type="text" class="custsearchInput" value="${batchNo}"/>
                        </td>
                        <td align="right">资产代码:</td>
                        <td>
                            <input id="prodId" name="prodId" type="text" class="custsearchInput" value="${prodId}"/>
                        </td>
                        <td align="right">资产名称:</td>
                        <td>
                            <input id="name" name="name" type="text" class="custsearchInput" value="${name}"/>
                        </td>
                        <td align="right">上架日期:</td>
                        <td>
                            <input id="createTime" name="createTime" type="text" class="custsearchInput" value="${createTime}"/>
                        </td>
                        <td><input type="submit" value="查询"></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <div>
        <table>
            <c:if test="${!empty productList && fn:length(productList)>0}">
                <c:forEach items="${productList}" var="product">
                    <tr>
                        <td>${product.mercId}</td>
                        <td>${product.prodId}</td>
                        <td>${product.batchNo}</td>
                        <td>${product.createTime}</td>
                        <td><a href="/finance/${product.prodId}/detail">查看详情</a></td>
                    </tr>
                </c:forEach>
            </c:if>
        </table>
    </div>
</body>
</html>