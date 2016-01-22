<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <META http-equiv="X-UA-Compatible" content="IE=9"/>
    <title></title>
</head>
<body>
   <div style="float:left;width: 100px;">
        <jsp:include page="app_index_men.jsp" flush="true"></jsp:include>
   </div>
<div style="float:left;width: 500px;min-height: 400px;margin-left: 40px;">
    <h3>商品列表展示</h3>
    <table border="1" cellpadding="5" cellspacing="0" width="700px;">
        <tr>
            <th>Id</th>
            <th>商品名称</th>
            <th>理财商户号</th>
            <th>产品编码</th>
            <th>产品数量</th>
            <th>产品描述</th>
            <th width="100px">操作:</th>
        </tr>
<s:forEach items="${allProducts}" var="item" varStatus="s">
      <tr>
          <td>${item.id}</td>
          <td>${item.name}</td>
          <td>${item.mercId}</td>
          <td>${item.prodId}</td>
          <td>${item.number}</td>
          <td>${item.description}</td>
          <td style="line-height: 10px;"><a href="<%=request.getContextPath()%>/finance/app/detail?pId=${item.id}">详情</a> </td>
      </tr>

</s:forEach>

    </table>

</div>
</body>
</html>
