<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css" rel="stylesheet">
	.show_asset_detail_div table tr td{
		padding-right: 10px;
		padding-bottom: 17px;
		font-size: 12px;
	}
	#mercListForInner{
		width: 120px !important;
	}
	
	.inputdiy{
		width: 144px !important;	
	}
	.combo-arrow{
		line-height: 28px !important;
	}
    #period{
        width: 20px;
    }
</style>
<script type="text/javascript">
	
	/**
	|*  
	|* 批次号验证规则
	|*
	|*/
	$.extend($.fn.validatebox.defaults.rules, {   
		batchNo: {   
	        validator: function(value,param){
	        	var regObj = /^\d{6}$/;
	            return regObj.test(value);
	        },   
	        message: '六位数字，从000001开始'  
	    }   
	}); 
	
	/**
	|*  
	|* 资产编号验证规则
	|*
	|*/
	$.extend($.fn.validatebox.defaults.rules, {   
		assetId: {   
	        validator: function(value,param){
	        	var regObj = /^([0-9]|[a-zA-Z])+$/;
	            return regObj.test(value);
	        },   
	        message: '不能输入非法字符'  
	    }   
	}); 
	
</script>
<div class="show_asset_detail_div">
	<form action="" id="assetPublishFrom" method="post" name="assetPublishFrom">
	<input type="hidden" value="" name="id" />
	<input type="hidden" value="" name="act" id="act" />
	<input type="hidden" value="" name="lastAssetId" id="lastAssetId" />
	<input type="hidden" value="" name="status" id="status" />
	<input type="hidden" value="" name="prodId" id="prodId" />
	<table>
		<tr>
			<td align="right">批次号:</td>
			<td><input id="asset_batch_no" required=true name="batchNo" class="easyui-validatebox custsearchInput inputdiy" validType="batchNo['#asset_batch_no']"/> </td>
		</tr>
		<tr>
			<td align="right">资产编号:</td>
			<td><input id="asset_asset_id " required=true type="text"  name="assetId" class="easyui-validatebox custsearchInput inputdiy" required=true validType="assetId['#asset_asset_id']"  /></td>
		</tr>
		<tr>
			<td align="right">资产名称:</td>
			<td><input id="asset_name" type="text" required=true  name="assetName" class="easyui-validatebox custsearchInput inputdiy"  validType="length[1,100]" invalidMessage="资产名称超过上限" missingMessage="请输入资产名称" /></td>
		</tr>
		<tr>
			<td align="right">资产提供商:</td>
			<td><input id="mercListForInner" name="mercId" editable=false panelHeight="auto" /></td>
		</tr>
		<tr>
			<td align="right">起售金额:</td>
			<td><input id="sale_amount" type="text" required=true class="easyui-numberbox custsearchInput inputdiy" precision=2 name="saleAmount" missingMessage="单位为元，支持小数点后两位输入" invalidMessage="请输入合法的金额，小数点后两位" /></td>
		</tr>
		<tr>
			<td align="right">险种代码:</td>
			<td><input id="risk_code" type="text" required=true name="riskCode" class="easyui-validatebox custsearchInput inputdiy"  validType="length[1,100]" invalidMessage="险种代码长度超过上限" missingMessage="请输入险种代码" /></td>
		</tr>
		<tr>
			<td align="right">提前赎回手续费:</td>
			<td><input id="advance_fee" type="text" required=true name="advanceFee" class="easyui-numberbox custsearchInput inputdiy" precision=2  missingMessage="单位为%，支持小数点后两位输入" invalidMessage="请输入合法的数值" />&nbsp;%</td>
		</tr>
		<tr>
			<td align="right">保险类型:</td>
			<td>
				<select id="risk_type" name="riskType" class="easyui-combobox" panelHeight='auto' editable='false'>
					<option value="保险">保险</option>
					<option value="非标">非标</option>
					<option value="基金">基金</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right">单份价格:</td>
			<td><input id="risk_price" type="text" required=true name="riskPrice" precision=2 class="easyui-numberbox custsearchInput inputdiy" missingMessage="请输入单份价格" invalidMessage="请输入合法的数值" /></td>
		</tr>
		<tr>
			<td align="right">单笔购买上限:</td>
			<td><input id="purchase_price" type="text" required=true name="purchasePrice" class="easyui-numberbox custsearchInput inputdiy" precision=2  missingMessage="请输入单笔购买上限" invalidMessage="请输入合法的数值" /></td>
		</tr>
		<tr>
			<td  align="right" text-align="top"  width="90px;">理财期限:</td>
			<td>
				<input id="finance_period" type="text"  required=true  name="financePeriod" class="easyui-numberbox custsearchInput inputdiy" missingMessage="请输入理财期限，单位为天" invalidMessage="请输入合法的数值"  />
				<!-- <p style="font-size: 11px;color: #ccc;">如果保险公司发布险种时指定了保障期间，系统填入值。格式为xxD，最后一位为单位，格式为：D-天Y-年W-周M-月，否则为空</p> -->
            </td>
            <td>
                <select id="period_unit" name="periodUnit" class="custsearchInput inputdiy" style="width:50px !important;">
                    <option value="D" selected="selected">D</option>
                    <option value="M">M</option>
                    <option value="Y">Y</option>
                </select>
            </td>
		</tr>
		<tr>
			<td align="right">收益率:</td>
			<td><input id="return_rate" type="text" required=true name="returnRate" class="easyui-numberbox custsearchInput inputdiy" precision=1  missingMessage="单位为%，支持小数点后一位输入" />&nbsp;%</td>
		</tr>
		<tr>
			<td align="right">折扣率:</td>
			<td><input id="discount_rate" type="text" required=true name="discountRate" class="easyui-numberbox custsearchInput inputdiy" precision=2  missingMessage="单位为%，支持小数点后两位输入" />&nbsp;%</td>
		</tr>
		<tr>
			<td align="right">收益计算公式:</td>
			<td>
                <select id="calc_formula" class="easyui-combobox" name="calcFormula" panelHeight='auto' editable='false' panelWidth='200px'>
                    <option value="0" selected="selected">0</option>
                    <option value="本金*利率*(理财期限/365)">本金*利率*(理财期限/365)</option>
                    <option value="本金*pow((1+利率),(理财期限/365))">本金*(1+利率)^(理财期限/365)</option>
                </select>
            <%--<input id="calc_formula" type="text" required=true name="calcFormula" class="easyui-validatebox custsearchInput inputdiy" missingMessage="请输入收益计算公式" />--%>
            </td>
		</tr>
		<tr>
			<td align="right">资产起息规则:</td>
			<td>
                <select id="assetValueRule" class="easyui-combobox" name="assetValueRule" panelHeight='auto' editable='false'>
                    <option value="1" selected="selected">下一个自然日起息</option>
                    <option value="2">下一个工作日起息</option>
                    <option value="3">募集成功日起息</option>
                </select>
            </td>
		</tr>
	</table>
	</form>
</div>
<script type="text/javascript">
/**
 * 初始化商户列表
 */
 $('#mercListForInner').combobox({ 
     valueField:'mercId',   
     textField:'mercName',
     required:true,
     url:$("#rootPath").val()+"/finance/tradeSearch/orderPurchse/findAllMerchant",
     onLoadSuccess:function(){
         if(initialCountForMerc == 1){
             var dataJson = $(this).combobox("getData");
             var jsonStr = JSON.stringify(dataJson);
             var newJsonStr = jsonStr.substr(1,jsonStr.length);
             newJsonStr = "[{\"mercId\":-1,\"mercName\":\"请选择\",\"selected\":true},"+newJsonStr;
             var data = JSON.parse(newJsonStr);
             $(this).combobox("loadData",data);
         }
     }
 });

 if(act == "edit"){
		$('#asset_edit_dialog').dialog("setTitle","编辑资产信息");
		//通过数据ID去获取资产的详细信息
		$.ajax({
			url:$("#rootPath").val()+"/finance/assetManagement/publish/"+data+"/showAssetDetailForJson",
			dataType:"JSON",
			type:"post",	
			async:true,
			success:function(data){
				console.info(data);
				$('#assetPublishFrom').form("load",{
						id:data.id,
						mercId:data.mercId,
						batchNo:data.batchNo,
						assetId:data.assetId,
						assetName:data.assetName,
						saleAmount:data.saleAmount,
						riskCode:data.riskCode,
						advanceFee:data.advanceFee,
						assetType:data.assetType,
						riskPrice:data.riskPrice,
						riskType:data.riskType,
						purchasePrice:data.purchasePrice,
						financePeriod:data.financePeriod,
						returnRate:data.returnRate,
						calcFormula:data.calcFormula,
						discountRate:data.discountRate,
						lastAssetId:data.assetId,
						status:data.status,
						prodId:data.prodId,
						act:"edit",
                        periodUnit:data.periodUnit,
                        assetValueRule:data.assetValueRule
				});
			}
		});
	}
</script>
