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
			<td align="right">资产名称:</td>
			<td><p><input name="assetName" id="assetName" value="${asset.assetName }" type="text"></p></td>
			<td align="right">资产编号:</td>
			<td id="assetAssetId">${asset.assetId }</td>

		</tr>
		<tr>
			<td align="right">资产类型:</td>
			<td>${asset.assetType}</td>
			<td align="right">资产状态:</td>
			<td>${asset.statusDesc }</td>
		</tr>
		<tr>
			<td align="right">资产来源 :</td>
			<td>${asset.assetSourceDesc}</td>
			<td align="right">资产提供商:</td>
			<td>${asset.mercId}/${asset.skuMerchant}</td>
		</tr>
		<tr>
			<td align="right">机构编号:</td>
			<td>${asset.orgId}</td>
			<td align="right">对应产品Id:</td>
			<td id="assetProdId">${asset.prodId }</td>

		</tr>
		<tr>
			<td align="right">产品sku:</td>
			<td>${asset.assetSku}</td>
			<td align="right">产品分类:</td>
			<td>${asset.assetCategory }</td>
		</tr>
		<tr>
			<td align="right">购买递增金额基数:</td>
			<td><input name="intervalAmount" id="intervalAmount" value="${asset.intervalAmount }" type="text">元</td>
			<td align="right">担保单位:</td>
			<td><p><input name="guaranteeUnit" id="guaranteeUnit" value="${asset.guaranteeUnit }" type="text"></p></td>
		</tr>
		<tr>
			<td align="right">起售金额:</td>
			<td><input name="saleAmount" id="saleAmount" value="${asset.saleAmount }" type="text">元<br/>
				<em>(必须为递增金额的整数倍)</em>
			</td>
			<td align="right">单份价格:</td>
			<td><input name="riskPrice" id="riskPrice" value="${asset.riskPrice }" type="text">元</td>
		</tr>
		<tr>
			<td align="right">单笔购买上限:</td>
			<td><p><input name="purchasePrice" id="purchasePrice" value="${asset.purchasePrice }" type="text">元</p></td>
			<td align="right">每日购买上限:</td>
			<td>${asset.everydayPrice }</td>
		</tr>
		<tr>
			<td align="right">单人购买上限:</td>
			<td>${asset.singlePrice }</td>
			<td align="right">募集成功下限:</td>
			<td>${asset.financeAmountMin }</td>
		</tr>
		<tr style="height:200px">
			<td align="right">资产描述:</td>
			<td colspan="3" style="height:200px;width:200px;"><textarea name="description" id="description"  type="textarea" style="height:100%;width:100%" rows="15" cols="35">${asset.description }</textarea></td>
		</tr>
		<tr style="height:200px">
			<td align="right">资产提示语:</td>
			<td colspan="3" style="height:200px;width:200px;"><textarea name="message" id="message"  type="textarea" style="height:100%;width:100%" rows="15" cols="35">${asset.message }</textarea></td>
		</tr>

	</table>
	<%--<p><input name="saleAmount" id="saleAmount" value="${asset.saleAmount }" type="text">元</p>--%>
	<%--<p><input name="riskPrice" id="riskPrice" value="${asset.riskPrice }" type="text">元</p>--%>
	<%--<p><input name="everydayPrice" id="everydayPrice" value="${asset.everydayPrice }" type="text">元</p>--%>
	<%--<p><input name="singlePrice" id="singlePrice" value="${asset.singlePrice }" type="text">元</p>--%>
	<%--<p><input name="financeAmountMin" id="financeAmountMin" value="${asset.financeAmountMin }" type="text">元</p>--%>
</div>
