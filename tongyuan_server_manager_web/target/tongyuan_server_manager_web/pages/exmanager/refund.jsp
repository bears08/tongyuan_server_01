<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/pages/golbal_taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>手工退款</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css" />
<link href="<%=root%>/css/index_fenye.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
<script type="text/javascript"
	src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.1.3.6.js"></script>
<script type="text/javascript"
	src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/json.js"></script>
<script type="text/javascript"
	src="<%=root%>/js/exmanager/refund.js?p=<%=System.currentTimeMillis()%>"></script>
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
	width: 158px !important;
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
	<input type="hidden" id="rootPath" value="<%=root%>" />
	<div class="main" style="width: 99%">
		<div id="showFormDiv" class="main" style="width: 99%">
			<form name="search_form">
				<div class="customerSearch h40" style="width: 98%">
					<table width="100%" border="0" cellspacing="0" cellpadding="10">
						<tr height="30px;">
							<td align="right">交易时间：</td>
							<td><input name="time1" type="text" class="easyui-datebox"></input>&nbsp;-&nbsp;
								<input name="time2" type="text" class="easyui-datebox"></input></td>
							<td align="right"></td>
							<td></td>
							<td align="right"></td>
							<td align="left"></td>

						</tr>
						<tr height="30px;">
							<td colspan="2">&nbsp;&nbsp;&nbsp;理财产品：<input id="productTypeList"
								name="pId" editable=false panelHeight="auto" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;渠道类型：<input
								id="platFormList" name="platId" editable=false
								panelHeight="auto" />
							</td>
							<td align="right">&nbsp;资产提供方：</td>
							<td align="left"><input id="mercList" name="mercId"
								editable=false panelHeight="auto" /></td>
							<td align="right">支付状态：</td>
							<td><select id="payStatus" class="easyui-combobox"
								panelHeight='auto' editable='false' name="payStatus"
								style="width: 100px;"> 
									<option value="">请选择</option>
									<option value="CASHSUCCESS">支付成功</option>
									<option value="CASHFAIL">支付失败</option>
							</select></td>
						</tr>
						<tr>
							<td align="right">钱包ID：</td>
							<td><input id="walletId" name="walletId" type="text"
								class="custsearchInput" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓&nbsp;名&nbsp;：<input
								id="userName" name="userName" type="text"
								class="custsearchInput" /></td>
							<td align="right">手机号：</td>
							<td><input id="phone" name="phone" type="text"
								class="custsearchInput" /></td>

							<td align="right">网银订单号：</td>
							<td><input id="orderId" name="orderId" type="text"
								class="custsearchInput" /></td>
						</tr>

						<tr height="45px;" align="right">
							<td colspan="6"><input id="queryBtn" name="button"
								type="button" class="greenBtn" value="查  询" />&nbsp;&nbsp; <input
								id="resetBtn" type="button" class="greenBtn" value="重置"
								onclick="clearInput()" /></td>
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