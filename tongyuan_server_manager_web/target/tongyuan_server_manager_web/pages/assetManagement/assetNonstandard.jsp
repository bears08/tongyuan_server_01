<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>资产分配</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
    <script type="text/javascript">var root = "<%=root%>"; </script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.1.3.6.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/assetManagement/assetNonstandard.js?p=<%=System.currentTimeMillis()%>"></script>
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">	
    <style type="text/css">
        table tr td {
	font-size: 12px;
}

.custsearchInput {
	width: 145px;
	height: 24px;
	border: 1px solid #CDDBC2 !important;
}

.combo,.numberbox{
	border: 1px solid #CDDBC2;
	width: 147px !important;
	height: 26px !important;
}

.main {
	overflow: hidden;
}

.validatebox-text {
	width: 125px !important;
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
<input type="hidden" id="rootPath" value="<%=root %>" />
<input type="hidden" id="excelTemplatePath" value="${excelTemplatePath }" />
<div class="main" style="width: 99%">
    <div id="showFormDiv" class="main" style="width: 99%">
       <form name="search_form">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right">资产类型：</td>
                        <td>
                            <select id="asset_type" class="easyui-combobox" panelHeight='auto' editable='false'  name="assetType" style="width:100px;">  
							    <option value="">--请选择--</option>  
							    <option value="债权">债权</option>  
							    <option value="金融保险">金融保险</option>
							    <option value="金融票据">金融票据</option>  
							    <option value="保险">保险</option>  
							</select> 
                        </td>
                        <td align="right">资产编号：</td>
                        <td>
                           <input id="asset_id" name="assetId" type="text" class="custsearchInput"/>
                        </td>
                    </tr>
                    <tr>
                     	<td align="right">本地状态：</td>
                        <td align="left">
                        	<select id="" name="status" class="easyui-combobox" panelHeight='auto' editable='false'  name="updateFlag" style="width:100px;">
                        		<option value="">--请选择--</option>
                        		<option value="0">待审核</option>
                        		<option value="1">已审核待上架</option>
                        		<option value="2">在售</option>
                        		<option value="3">已下架</option>
                        		<option value="4">审核失败</option>
                        		<option value="5">待售</option>
                        	</select>
                        </td>
                     	<td align="right">金融资产状态：</td>
                        <td align="left">
                        	<select id="" class="easyui-combobox" panelHeight='auto' editable='false'  name="jrStatus" style="width:100px;">
                        		<option value="">--请选择--</option>
                        		<option value="1">未审核 </option>
                        		<option value="2">审核通过</option>
                        		<option value="3">已驳回</option>
                        		<option value="4">已上架</option>
                        		<option value="5">已下架</option>
                        		<option value="6">募集中</option>
                        		<option value="7">募集确认中</option>
                        		<option value="8">募集成功</option>
                        		<option value="9">募集失败</option>
                        		<option value="10">已打款</option>
                        		<option value="11">到期未审核</option>
                        		<option value="12">到期未承兑</option>
                        		<option value="13">已承兑</option>
                        		<option value="14">风控通过</option>
                        		<option value="15">风控驳回</option>
                        	</select>
                        </td>
                        <td>
                        	<input id="queryBtn" name="button" type="button" class="greenBtn" value="查  询"/>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>

    <div style="height: 8px;"></div>
    <table id="gridResult" class="easyui-datagrid">
    </table>
    
    <!-- dialog 资产详情 -->
    <div id="asset_edit_dialog" style="padding: 10px 40px;"> </div>
    
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
			<input type="hidden" value="" id="assetId" name="assetId" />
		</table>
		</form>
	</div>

</div>
</body>
</html>