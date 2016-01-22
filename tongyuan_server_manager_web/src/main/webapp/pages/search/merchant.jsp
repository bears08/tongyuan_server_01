<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>商户录入</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.1.3.6.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/search/merchant.js?p=<%=System.currentTimeMillis()%>"></script>
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/icon.css" type="text/css">
    <link rel="stylesheet" href="<%=root%>/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">	
    <style type="text/css">
        table tr td {
	font-size: 12px;
}

.custsearchInput {
	width: 145px;
	height: 24px;
}

.combo {
	border: 1px solid #CDDBC2;
	width: 146px !important;
	height: 22px !important;
}

.main {
	overflow: hidden;
}

.validatebox-text {
	width: 124px !important;
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
<div class="main" style="width: 99%">
    <div id="showFormDiv" class="main" style="width: 99%">
       <form name="search_form">
            <div class="customerSearch h40" style="width: 98%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="right">录入时间：</td>
                            <td><input name="time1" type="text" class="easyui-datebox" data-options="editable:false" ></input>&nbsp;-&nbsp;
                                <input name="time2" type="text" class="easyui-datebox" data-options="editable:false" ></input></td>
                        <td align="right">公司全称：</td>
                        <td>
                           <input id="merchantName" name="mercName" type="text" class="custsearchInput"/>
                        </td>
                         <td align="right">理财商号：</td>
                        <td>
                            <input id="merc_id" name="mercId" type="text" class="custsearchInput"/>
                        </td>
                    </tr>
                    <tr align="right" height="50">
                        <td colspan="6">
                        	<input id="queryBtn" name="button" type="button" class="greenBtn" value="查  询"/>&nbsp;&nbsp;
                        	<input id="resetBtn" type="button" class="greenBtn" value="重置" onclick="clearInput()"/>&nbsp;&nbsp;
                        	<input id="newAssetBtn" type="button" class="greenBtn" value="新增" />
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
    <div id="asset_edit_dialog" style="padding: 10px 40px;">
    	
    </div>
    
    <!-- 添加商户window -->
    <div id="addMerchnatWindow" class="easyui-dialog" title="增加商户信息" style="width:370px;height:300px;padding: 20px;" data-options="closed:true,collapsible:false,minimizable:false,maximizable:false,modal:true,buttons:[{
				text:'保存',
				handler:function(){
					addNewMerchant();
				}
			},{
				text:'关闭',
				handler:function(){
					$('#addMerchnatWindow').dialog('close');
				}
			}],
			onClose:function(){
				$('form[name=\'addMerchnatForm\'] input').val('');
				$('#addMerchnatWindow').dialog('setTitle','增加商户信息');
				act = 'add';
			}">
			<form action="" method="post" name="addMerchnatForm">
				<input type="hidden" name="mercKeyIdAdd" />
				<input type="hidden" name="lastMerchantIdAdd" />
				<table border="0" cellspacing="0" cellspadding="10">
					<tr height="50">
						<td align="right" width="100px;">商户名称：</td>
						<td style="padding-left: 10px;"><input class="custsearchInput" type="text" name="mercNameAdd" /></td>
					</tr>
					<tr height="50">
						<td align="right" width="100px;">商户编号(1代)：</td>
						<td style="padding-left: 10px;"><input class="custsearchInput" type="text" name="mercIdAdd" /></td>
					</tr>
					<tr height="50">
						<td align="right" width="100px;">商户编号(2代)：</td>
						<td style="padding-left: 10px;"><input class="custsearchInput" type="text" name="secondMercAdd" /></td>
					</tr>
				</table>
			</form>
		</div>
	
</div>
</body>
</html>