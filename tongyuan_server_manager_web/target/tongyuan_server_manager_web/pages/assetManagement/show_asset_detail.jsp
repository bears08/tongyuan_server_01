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
			<td align="right">险种代码:</td>
			<td>${asset.riskCode }</td>
		</tr>
		<tr>
			<td align="right">理财期限:</td>
			<td>${asset.financePeriod }天</td>
		</tr>
		<tr>
			<td align="right">保险类型:</td>
			<td>${asset.assetType }</td>
		</tr>
		<tr>
			<td align="right">单价价格:</td>
			<td>${asset.riskPrice }元</td>
		</tr>
		<tr>
			<td align="right">单笔购买上限:</td>
			<td>${asset.purchasePrice}元</td>
		</tr>
		<tr>
			<td align="right">提前赎回手续费:</td>
			<td>${asset.advanceFee }%</td>
		</tr>
		<tr>
			<td align="right">收益率:</td>
			<td>${asset.returnRate }%</td>
		</tr>
		
	</table>
</div>