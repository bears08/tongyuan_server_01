<%@ page language="java" pageEncoding="UTF-8" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>资产录入</title>
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
    <script type="text/javascript" src="<%=root%>/js/assetManagement/bigPackage.js?p=<%=System.currentTimeMillis()%>"></script>
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
                        <td align="right">录入时间：</td>
                            <td><input name="time1" type="text" class="easyui-datebox custsearchInput" editable=false></input>&nbsp;-&nbsp;
                                <input name="time2" type="text" class="easyui-datebox custsearchInput" editable=false></input></td>
                        <td align="right">资产类型：</td>
                        <td>
                            <select id="asset_type" class="easyui-combobox" panelHeight='auto' editable='false'  name="assetType" style="width:100px;">  
							    <option value="">--请选择--</option>  
							    <option value="0">非标资产</option>  
							    <option value="1">票据</option>  
							    <option value="2">保险</option>  
							</select> 
                        </td>
                    </tr>
                    <tr>
                     	<td align="right">&nbsp;状态：</td>
                        <td align="left">
                        	<select id="" class="easyui-combobox" panelHeight='auto' editable='false'  name="updateFlag" style="width:100px;">
							    <option value="">--请选择--</option>  
                        		<option value="1">已同步</option>
                        		<option value="0">未同步</option>
                        	</select>
                        </td>
                    	 
                        <td>&nbsp;</td>
                        <td>
                        	<input id="queryBtn" name="button" type="button" class="greenBtn" value="查  询"/>
                        	<input id="resetBtn" type="button" class="greenBtn" value="批量录入" onclick="enteringExcelTemplate()"/>
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
    
    <div id="fileUploadWindow" class="easyui-window" title="资产批量录入" style="width:350px;height:120px;padding:20px 30px;" data-options="closed:true,modal:true,collapsible:false,minimizable:false,maximizable:false,onClose:function(){
    	$('#excelFile').val(null);
    }">
    	<form id="uploadFileForm" action="" method="post" enctype="multipart/form-data">
    		<input id="excelFile" type="file" name="excelFile" /><input onclick="doEnteringExcelTemplate()" type="button" value="上传" />
    	</form>
    </div>  
</div>
</body>
</html>