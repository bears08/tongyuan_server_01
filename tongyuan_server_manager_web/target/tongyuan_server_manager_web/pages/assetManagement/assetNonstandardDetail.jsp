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
			<td>${asset.assetName }</td>
			<td align="right">资产编号:</td>
			<td>${asset.assetId}</td>
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
			<td>${asset.prodId}</td>
		</tr>
		<tr>
			<td align="right">产品sku:</td>
			<td>${asset.assetSku}</td>
			<td align="right">产品分类:</td>
			<td>${asset.assetCategory }</td>
		</tr>
		<tr>
			<td align="right">是否支持转让:</td>
			<td>${asset.onlyAssignmentDesc }</td>
			<td align="right">计息日:</td>
			<td>${asset.calcInterestTime}</td>
		</tr>
		<tr>
			<td align="right">收益方式:</td>
			<td>${asset.profitType }</td>
			<td align="right">年化收益率:</td>
			<td>${asset.returnRate }%</td>
		</tr>
		<tr>
			<td align="right">金融状态:</td>
			<td>${asset.jrStatusDesc }</td>
			<td align="right">库存:</td>
			<td>${asset.stock}</td>
		</tr>
		<tr>
			<td align="right">理财期限:</td>
			<td>${asset.financePeriod }</td>
			<td align="right">投资周期单位:</td>
			<td>${asset.periodUnit }</td>
		</tr>
		<tr>
			<td align="right">起售金额:</td>
			<td>${asset.saleAmount }元</td>
			<td align="right">单份价格:</td>
			<td>${asset.riskPrice }元</td>
		</tr>
		<tr>
			<td align="right">单笔购买上限:</td>
			<td>${asset.purchasePrice }元</td>
			<td align="right">每日购买上限:</td>
			<td>${asset.everydayPrice }元</td>
		</tr>
		<tr>
			<td align="right">单人购买上限:</td>
			<td>${asset.singlePrice }元</td>
			<td align="right">募集成功下限:</td>
			<td>${asset.financeAmountMin }元</td>
		</tr>
		<tr>
			<td align="right">购买递增金额基数:</td>
			<td>${asset.intervalAmount }元</td>
			<td align="right">总额度:</td>
			<td>${asset.amount }元</td>
		</tr>
	
		<tr>
			<td align="right">上架时间:</td>
			<td>${asset.putawayTime }</td>
			<td align="right">下架时间:</td>
			<td>${asset.soldoutTime }</td>
		</tr>
		<tr>
			<td align="right">产品理财到期日:</td>
			<td>${asset.financeEndTime }</td>
			<td align="right">产品兑付日期:</td>
			<td>${asset.redemptionDate }</td>
		</tr>
		<tr>
			<td align="right">年龄下限:</td>
			<td>${asset.minAge }</td>
			<td align="right">年龄上限:</td>
			<td>${asset.maxAge }</td>
		</tr>
		<tr>
			<td align="right">担保单位:</td>
			<td>${asset.guaranteeUnit }</td>
			<td align="right">金融销售时间:</td>
            <td>${asset.sellStartTime }</td>
		</tr>
		<tr style="height:200px">
			<td align="right">资产描述:</td>
			<td colspan="3" style="height:200px;width:200px;"><textarea readonly="readonly" name="description" id="description"  type="textarea" style="height:100%;width:100%" rows="15" cols="35">${asset.description }</textarea></td>
		</tr>
		<tr style="height:200px">
			<td align="right">资产提示语:</td>
			<td colspan="3" style="height:200px;width:200px;"><textarea readonly="readonly" name="message" id="message"  type="textarea" style="height:100%;width:100%" rows="15" cols="35">${asset.message }</textarea></td>
		</tr>
	</table>
</div>
