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
<div class="main" style="width: 99%">
    <form action="/finance/finallypublish.html">
        <table>
            <tr>
                <td>${productExtend.prodId}</td>
                <td>${productExtend.describe}</td>
                <td>${productExtend.rateDescribe}</td>
                <td>${productExtend.riskDescribe}</td>
                <td>${productExtend.contract}</td>
                <td>${productExtend.other}</td>
            </tr>
            <tr>
                <td>${product.mercId}</td>
                <td>${product.prodId}</td>
                <td>${product.name}</td>
                <td>${product.number}</td>
                <td>${product.describe}</td>
                <td>${product.batchNo}</td>
            </tr>
            <tr>上架时间：<input type="text" name="" value=""></tr>
            <tr>下架时间：<input type="text" name="" value=""></tr>
            <tr>匹配时间：<select>
                <option value="1" selected="selected">一个月</option>
                <option value="3">三个月</option>
                <option value="6">六个月</option>
                <option value="12">一年</option>
            </select></tr>
            <tr><input type="hidden" name="prodId" value="${productExtend.prodId}"></tr>
            <tr><input type="submit" value="发布"></tr>
        </table>
    </form>
</div>
</body>
</html>