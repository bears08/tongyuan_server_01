<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css" rel="stylesheet">
	.show_asset_detail_div table tr td{
		padding-right: 10px;
		padding-top: 17px;
		font-size: 12px;
	}
</style>
<div class="show_asset_detail_div">
	<table>
		<tr>
			<td align="right">批次号:</td>
			<td>${asset.batchNo }</td>
		</tr>
		<tr>
			<td align="right">资产编号:</td>
			<td>${asset.assetId }</td>
		</tr>
		<tr>
			<td align="right">资产名称:</td>
			<td>${asset.assetName }</td>
		</tr>
		<tr>
			<td align="right">每份金额:</td>
			<td>${asset.riskPrice }</td>
		</tr>
		<tr>
			<td align="right">险种代码:</td>
			<td>${asset.riskCode }</td>
		</tr>
		<tr>
			<td align="right">理财期限:</td>
			<td>${asset.financePeriod }天</td>
		</tr>
		<tr>
			<td align="right">单笔购买上限:</td>
			<td>${asset.purchasePrice }</td>
		</tr>
	</table>
</div>