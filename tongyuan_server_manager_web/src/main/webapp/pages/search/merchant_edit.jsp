<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css" rel="stylesheet">
	.show_asset_detail_div table tr td{
		padding-right: 10px;
		padding-bottom: 17px;
		font-size: 12px;
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
	        	var regObj = /^\d{10}$/;
	            return regObj.test(value);
	        },   
	        message: '10位数据，按照日期+2位数据结构，比如2015040901'  
	    }   
	}); 
	
	
</script>
<div class="show_asset_detail_div">
	<form action="" id="merchantEnteringForm" method="post" name="merchantEnteringForm">
	<input type="hidden" value="" name="id" />
	<input type="hidden" value="add" name="act" id="act" />
	<input type="hidden" value="" name="lastMerchantId" id="lastMerchantId" />
	<table>
		<tr>
			<td align="right">理财商户号:</td>
			<td><input id="risk_type" type="text" required=true name="mercId" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">公司执照编号:</td>
			<td><input id="risk_type" type="text" required=true name="mercLicence" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">执照生效日期:</td>
			<td><input id="risk_type" type="text" data-options="editable:false" required=true name="licenceEnableDate" class="easyui-datebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">执照失效日期:</td>
			<td><input id="risk_type" type="text" data-options="editable:false" required=true name="licenceDisableDate" class="easyui-datebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">公司全称:</td>
			<td><input id="risk_type" type="text" required=true name="mercName" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">公司法人:</td>
			<td><input id="risk_type" type="text" required=true name="mercLegalPerson" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">法人证件类型:</td>
			<td><input id="risk_type" type="text" required=true name="lpCertType" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">法人证件号:</td>
			<td><input id="risk_type" type="text" required=true name="lpCertNo" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">组织机构代码:</td>
			<td><input id="risk_type" type="text" required=true name="mercNo" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">公司地址:</td>
			<td><input id="risk_type" type="text" required=true name="mercAddress" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		
		<tr>
			<td align="right">物资文件地址:</td>
			<td><input id="risk_type" type="text" required=true name="qualificationFilePath" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
		<tr>
			<td align="right">物资文件名:</td>
			<td><input id="risk_type" type="text" required=true name="qualificationFileName" class="easyui-validatebox"  validType="length[1,100]"/></td>
		</tr>
	</table>
	</form>
	<script type="text/javascript">
	if(act == "edit"){
		$('#asset_edit_dialog').dialog("setTitle","编辑商户信息");

		//通过数据ID去获取资产的详细信息
		$.ajax({
			url:$("#rootPath").val()+"/finance/merchant/"+data+"/showMerchantForJson",
			dataType:"JSON",
			type:"post",	
			async:true,
			success:function(data){
					$('#merchantEnteringForm').form("load",{
						id:data.id,
						mercId:data.mercId,
						mercLicence:data.mercLicence,
						licenceEnableDate:formatLongTime(data.licenceEnableDate),
						licenceDisableDate:formatLongTime(data.licenceDisableDate),
						mercName:data.mercName,
						mercLegalPerson:data.mercLegalPerson,
						lpCertType:data.lpCertType,
						lpCertNo:data.lpCertNo,
						mercNo:data.mercNo,
						mercAddress:data.mercAddress,
						qualificationFilePath:data.qualificationFilePath,
						qualificationFileName:data.qualificationFileName,
						lastMerchantId:data.mercId,
						act:"edit"
					});
			}
		});
	}
	act = "add";
	</script>
</div>
