<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <META http-equiv="X-UA-Compatible" content="IE=9"/>
    <title></title>
    <style type="text/css">
        a{
            text-decoration: none;
            margin-top: 10px;
            display: block;
            font-size: 12px;
            font-family: "微软雅黑", "宋体", Arial, Verdana, arial, serif;
        }
        a:hover{
            text-decoration: underline;
        }
    </style>
</head>
<body>
  <div style="width: 100px;padding: 5px;border-right: 1px solid #000000;min-height: 450px;">
      <a href="<%=request.getContextPath()%>/finance/app/main">显示商品详细信息</a>
      <a href="<%=request.getContextPath() %>/finance/app/query_revenue?walletId=w001" >我的资产</a>
      <a href="<%=request.getContextPath() %>/finance/app/by_finance?pId=1" >购买理财</a>
      <a href="<%=request.getContextPath() %>/finance/app/show_order_detail?walletId=w001&orderId=2" >兑付本息设置</a>
      <a href="<%=request.getContextPath() %>/finance/app/query_trade_detail_info?walletId=w001&orderPurchseType=buy&quitType=" >资金流水</a>
  </div>
</body>
</html>
