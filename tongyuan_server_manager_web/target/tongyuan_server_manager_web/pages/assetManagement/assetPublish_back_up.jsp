<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<div class="main" style="width: 99%">
    <table>
        <c:if test="${!empty productList && fn:length(productList)>0}">
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td>${product.prodId}</td>
                    <td>${product.batchNo}</td>
                    <td>${product.name}</td>
                    <td>${product.number}</td>
                    <td>${product.describe}</td>
                    <td>${product.status}</td>
                    <td>${product.createTime}</td>
                    <td>${product.itemName}</td>
                    <td>${product.investCycle}</td>
                    <td>${product.createTime}</td>
                </tr>
                <tr>
                    <form action="" id="passaudit">
                        <input type="hidden" name="prodId" value="${product.prodId}">
                        <td><input type="button" value="审核拒绝" onclick="submitaudit(1)"></td>
                        <td><input type="button" value="审核通过" onclick="submitaudit(2)"></td>
                    </form>
                </tr>
            </c:forEach>
        </c:if>
    </table>
</div>
</body>
</html>