<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/pages/golbal_taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>赎回交易查询</title>
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
	src="<%=root%>/js/search/order_ransom_search.js?p=<%=System.currentTimeMillis()%>"></script>
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


#totalNum{
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
	<script type="text/javascript">
		function myformatter(date) {
			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
		}

		function myparser(s) {
			if (!s) return new Date();
			var ss = (s.split('-'));
			var y = parseInt(ss[0], 10);
			var m = parseInt(ss[1], 10);
			var d = parseInt(ss[2], 10);
			if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
				return new Date(y, m - 1, d);
			} else {
				return new Date();
			}
		}

		$(function () {
			//设置时间
			var curr_time = new Date();
			$("#time1").datetimebox("setValue", myformatter(curr_time) + ' 00:00:00');
			$("#time2").datetimebox("setValue", myformatter(curr_time) + ' 23:59:59');


		});







	</script>
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


							<td><input id="time1" name="time1" type="text" class="easyui-datetimebox"></input>&nbsp;-&nbsp;
								<input id="time2" name="time2" type="text" class="easyui-datetimebox"></input></td>
							<td align="right">资产类型：</td>
							<td><select id="asset_type" class="easyui-combobox"
								panelHeight='auto' editable='false' name="assetType"
								style="width: 100px;">
									<option value="">请选择</option>
									<option value="非标">非标</option>
									<option value="基金">基金</option>
									<option value="保险">保险</option>
									<option value="金融票据">金融票据</option>
							</select></td>
							<td align="right">&nbsp;资产提供方：</td>
							<td align="left"><input id="mercList" name="mercId" editable=false panelHeight="auto" /></td>
						</tr>
						<tr height="30px;">
							<td align="right">资产编号：</td>
							<td>
								<input id="asset_id" name="assetId" type="text" class="custsearchInput" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申购订单号：<input id="orderId" name="orderId" type="text" class="custsearchInput" />
							</td>
							<!-- <td align="right">资产批次：</td>
							<td><input id="batch_no" name="batchNo" type="text"
								class="custsearchInput" /></td> -->
							<td align="right">理财产品：</td>
					<td><input id="productTypeList" name="productKeyId" editable=false panelHeight="auto" /></td>
							<td align="right">渠道类型：</td>
							<td align="left">
							<input id="platFormList" name="platId" editable=false panelHeight="auto" />
							</td>
						</tr>
						<tr>
							<td align="right">钱包ID：</td>
							<td>
								<input id="walletId" name="walletId" type="text" class="custsearchInput" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<input id="userName" name="userName" type="text" class="custsearchInput" />
							</td>
							<td align="right">赎回状态：</td>
							<td>
								<select id="payStatus" class="easyui-combobox" panelHeight='auto' editable='false' name="ransomStatus" style="width: 100px;">
									<option value="">请选择</option>
									<option value="INIT">初始化</option>
									<option value="RS_CHECK_SUCC">退保核算成功</option>
									<option value="RS_CHECK_FAIL">退保核算失败</option>
									<option value="RS_REQ_SUCC">退保请求成功</option>
									<option value="RS_REQ_FAIL">退保请求失败</option>
									<option value="RS_CALLBACK_SUCC">回调成功</option>
									<option value="RS_CALLBACK_FAIL">回调失败</option>
								</select>
							</td>
							<td></td>
							<td></td>
						</tr>
						
						<tr height="35px;" align="right">
							<!-- <td align="right">结算状态：</td>
							<td align="left">
								<select id="payStatus" class="easyui-combobox" panelHeight='auto' editable='false' name="payStatus" style="width: 100px;">
									<option value="">请选择</option>
									<option value="0">待结算</option>
									<option value="1">已结算</option>
									<option value="2">结算失败</option>
								</select>
							</td> -->
							<td colspan="6"><input id="queryBtn" name="button"
								type="button" class="greenBtn" value="查  询" />&nbsp;&nbsp; <input
								id="resetBtn" type="button" class="greenBtn" value="重置"
								onclick="clearInput()" />&nbsp;&nbsp; <input id="exportButton" style="visibility: visibility: ;"
								type="button" class="greenBtn" onclick="exprotExcel()"  value="导 出" /></td>
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