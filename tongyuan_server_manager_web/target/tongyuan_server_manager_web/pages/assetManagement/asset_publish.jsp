<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/pages/golbal_taglib.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>资产录入</title>
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
	src="<%=root%>/js/assetManagement/asset_publish.js?p=<%=System.currentTimeMillis()%>"></script>
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
</head>

<body>
	<input type="hidden" id="rootPath" value="<%=root%>" />
	<div class="main" style="width: 99%">
		<div id="showFormDiv" class="main" style="width: 99%">
			<form name="search_form">
				<div class="customerSearch h40" style="width: 98%">
					<table width="100%" border="0" cellspacing="0" cellpadding="10">
						<tr height="30px;">
							<td align="right">上架时间：</td>
							<td><input name="time1" type="text" class="easyui-datebox" editable=false></input>&nbsp;-&nbsp;
								<input name="time2" type="text" class="easyui-datebox" editable=false></input></td>
							<td align="right">资产类型：</td>
							<td><select id="asset_type" class="easyui-combobox"
								panelHeight='auto' editable='false' name="assetType"
								style="width: 100px;">
									<option value="">请选择</option>
									<option value="非标">非标</option>
									<option value="基金">基金</option>
									<option value="保险">保险</option>
							</select></td>
							<td align="right">&nbsp;资产提供方：</td>
							<td align="left"><input id="mercList" name="mercId" editable=false panelHeight="auto" /></td>
						</tr>
						<tr height="30px;">
							<td align="right">资产批次：</td>
							<td><input id="batch_no" name="batchNo" type="text"
								class="custsearchInput" /></td>
							<td align="right">资产编号：</td>
							<td><input id="asset_id" name="assetId" type="text"
								class="custsearchInput" /></td>
							<td align="right">资产状态：</td>
							<td align="left"><select id="asset_status"
								class="easyui-combobox" panelHeight='auto' editable='false'
								name="assetStatus" style="width: 100px;">
									<option value="">请选择</option>
									<option value="1">待上架</option>
									<option value="2">在售</option>
									<option value="3">已下架</option>
							</select></td>
						</tr>
						<tr height="35px;" align="right">
							<td colspan="6"><input id="queryBtn" name="button"
								type="button" class="greenBtn" value="查  询" />&nbsp;&nbsp; <input
								id="resetBtn" type="button" class="greenBtn" value="重置"
								onclick="clearInput()" />&nbsp;&nbsp; <input id="newAssetBtn" style="visibility: hidden;"
								type="button" class="greenBtn" value="新增" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<div style="height: 8px;"></div>
		<table id="gridResult" class="easyui-datagrid">
		</table>

		<!-- dialog 资产发布详情-edit -->
		<div id="asset_edit_dialog" style="padding: 10px 40px;">
			
		</div>
		
		<!-- dialog 资产详情 -->
		<div id="asset_detail_dialog" style="padding: 8px 40px;"></div>

		<!-- dialog 发布资产 -->
		<div id="asset_publish_dialog" style="padding: 10px 40px;">
			<form method="post" name="asset_publish_form" >
				<table border="0" cellpadding="10" cellspacing="0">
				<tr height="35">
					<td align="right">上架时间起:</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-datetimebox" name="time1" editable=false
						data-options="required:true" style="width: 150px" missingMessage="请输入资产上架时间"></td>
				</tr>
					
				<tr height="35">
					<td align="right">上架时间止:</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input class="easyui-datetimebox" name="time2" editable=false
						data-options="required:true" style="width: 150px"  missingMessage="请输入资产下架时间"></td>
				</tr>
				<tr height="35">
					<td align="right">上架产品:</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="productTypeList" name="productType" editable=false panelHeight="auto" /></td>
				</tr>
				<tr height="35" align="right">
					<td align="right">可售额度:</td>
					<td>&nbsp;&nbsp;&nbsp;<input id="totalNumType" name="totalNumType" style="width:200px;" editable=false /> </td>
				</tr>
				<tr height="35">
					<td colspan="2" align="right">&nbsp;&nbsp;&nbsp;
						<input id="totalNum" name="totalNum" disabled="true" type="text" class="easyui-numberbox"  missingMessage="请输入可售额度" required="true"  style="height: 24px;border: 1px solid #CDDBC2;"/>
					</td>
				</tr>
				<tr height="35">
					<td align="right">触发通知比例:</td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="warningPercent" type="text" name="warningPercent" disabled="true" class="easyui-numberbox" missingMessage="请输入触发通知比例" required="true" style="height: 24px;border: 1px solid #CDDBC2;"></input>&nbsp;&nbsp;% </td>
				</tr>
				<input type="hidden" value="" id="assetId" name="assetId" />
			</table>
			</form>
		</div>

	</div>
</body>
</html>