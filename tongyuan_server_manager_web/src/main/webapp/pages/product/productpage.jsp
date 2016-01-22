<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@include file="/pages/golbal_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>用户查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css" />
<link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/json.js"></script>
<link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css" type="text/css">
<link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="<%=root%>/css/custom.css" type="text/css">
<script type="text/javascript" src="<%=root%>/js/product/product.js?p=<%=System.currentTimeMillis()%>"></script>
</head>

<body>
	<input type="hidden" id="rootPath"
		value="<%=request.getContextPath()%>" />
	<div class="main" style="width: 99%">
		<div id="showFormDiv" class="main"
			style="width: 99%; text-align: center">
			<table border="1" cellpadding="3" cellspacing="0"
				style="margin: 80px auto auto;" id="bigtable">
				<thead>
					<th>产品名称</th>
					<th>期限</th>
					<th>预期年化收益率</th>
					<th>流动性</th>
					<th>起售金额</th>
					<th>限购金额</th>
					<th>当前匹配资产编号</th>
					<th>营销标记</th>
					<th>是否对外</th>
					<th>是否新用户专享</th>
					<th>是否小金库专享</th>
					<th>是否促销</th>
					<th>优先级别</th>
					<th>产品类型</th>
					<th width="80px;">当前可售额度</th>
					<th>状态</th>
					<th>开始售卖时间</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:if test="${!empty productList && fn:length(productList)>0}">
						<c:forEach items="${productList}" var="product">
							<tr>
								<td width="130px">${product.name}</td>
								<td width="40px">${fn:replace(product.investCycle,"D","")}天</td>
								<td width="40px">${product.annualRate} ${empty product.annualRate ? "" : "%"}</td>
								<td width="40px">${product.flowDesc}</td>
								<td>${product.minimumBuyPrice}元</td>
								<td><fmt:formatNumber value='${product.singleMaxAmount}' pattern="#,##0.00"/>元</td>
								<td width="50px">${product.assetId}</td>
								<td>${product.badge}</td>
								<td>${product.isForeign == 0 ? "对外":"不对外"}</td>
								<td>${product.isNewUser == 0 ? "新用户专享":"非新用户专享"}</td>
								<td>${product.isGold == 0 ? "小金库专享":"非小金库专项"}</td>
								<td>${product.isPromotion == 0 ? "促销":"非促销"}</td>
								<td>${product.sort}</td>
								<td>${product.productType}</td>
								<td width="60px">${product.purchasePrice*product.number*1.00 < 0 ? "不限量" : product.purchasePrice*product.number*1.00}</td>
								<td>${product.status == 0 ? "已上架" : "未上架"}</td>
								<td width="120px"><fmt:formatDate value="${product.sellStartTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td width="100px" style="line-height: 30px;">
									<input type="button" class="greenBtn" value="修改" onclick="modifyProduct('${product.prodId}')">
									<input type="button" class="greenBtn" style="visibility:${product.status == 0 ? '' : 'hidden'};" value="下架" onclick="deletePro('${product.prodId}')">
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<table style="text-align: center; width: 99%">
				<tr>
					<td><input type="button" value="新增" class="greenBtn" onclick="addPro()"> <input type="button" value="刷新" class="greenBtn" onclick="window.location.reload();"></td>
				</tr>
			</table>
		</div>

		<div id="productDialog">
			<table
				style="display: none; width: 99%; border-collapse: separate; border-spacing: 10px;">
				<tr height="30">
					<td align="right">产品名称：</td>
					<td><input id="proname" class="easyui-validatebox"></td>
				</tr>
				<tr height="30" id="addProdId">
					<td align="right">产品编号：</td>
					<td>
						<input id="prodId" type="text" >
					</td>
				</tr>
				<tr height="30">
					<td align="right">是否对外：</td>
					<td>
						<select id="isForeign" class="easyui-combobox" style="width: 155px;"  panelHeight='auto'>
							<option value="0">对外</option>
							<option value="1">不对外</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="right">期限：</td>
					<td><input id="cycle" type="text" class="easyui-numberbox" data-options="min:0,precision:2" ></td>
				</tr>
				<tr height="30">
					<td align="right">流动性：</td>
					<td><input id="flowdesc" class="easyui-validatebox"></td>
				</tr>
				<tr height="30">
					<td align="right">起售金额：</td>
					<td>
						<input id="minimumBuyPrice" type="text" >
					</td>
				</tr>
				<tr height="30">
					<td align="right">营销标记：</td>
					<td>
						<input id="badge" type="text" >
					</td>
				</tr>
				<tr height="30">
					<td align="right">是否新用户专享：</td>
					<td>
						<select id="isNewUser" class="easyui-combobox" style="width: 155px;"  panelHeight='auto'>
							<option value="0">新用户专享</option>
							<option value="1">非新用户专享</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="right">是否小金库专享：</td>
					<td>
						<select id="isGold" class="easyui-combobox" style="width: 155px;"  panelHeight='auto'>
							<option value="0">小金库专享</option>
							<option value="1">非小金库专享</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="right">是否促销：</td>
					<td>
						<select id="isPromotion" class="easyui-combobox" style="width: 155px;"  panelHeight='auto'>
							<option value="0">促销</option>
							<option value="1">非促销</option>
						</select>
					</td>
				</tr>
				<tr height="30">
					<td align="right">优先级别：</td>
					<td>
						<input id="sort" type="number" >
					</td>
				</tr>
				<tr height="30">
					<td align="right">售卖时间：</td>
					<td>
						<input id="sellStartTime" name="time6" type="text" class="easyui-datetimebox"></input></td>
					</td>
				</tr>
				<tr height="30">
					<td align="right">限购金额：</td>
					<td>
						<input id="singleMaxAmount" name="singleMaxAmount" type="text" ></td>
					</td>
				</tr>
				<tr height="30">
					<td align="center" colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="确定" id="confirmBtn" class="greenBtn" />
						<input type="button" value="取消" id="cancelBtn" onclick="$('#productDialog').dialog('close');" class="greenBtn" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>