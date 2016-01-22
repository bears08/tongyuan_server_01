<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/pages/golbal_taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>资产审核</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link href="<%=root%>/css/index.css" rel="stylesheet" type="text/css"/>
    <link href="<%=root%>/css/index_fenye.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="<%=root%>/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="<%=root%>/js/datejs/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">var root = "<%=root%>"; </script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/jquery.easyui.min.1.3.6.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="<%=root%>/js/easyui.1.2.6/json.js"></script>
    <script type="text/javascript" src="<%=root%>/js/assetManagement/assetAudit.js?p=<%=System.currentTimeMillis()%>"></script>
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
	width: 142px !important;
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
                            <td><input name="time1" type="text" class="easyui-datebox"></input>&nbsp;-&nbsp;
                                <input name="time2" type="text" class="easyui-datebox" ></input></td>
                        <td align="right">资产类型：</td>
                        <td>
                            <select id="asset_type" class="easyui-combobox" panelHeight='auto' editable='false'  name="assetType" style="width:100px;">  
							    <option value="">请选择</option>  
							    <option value="非标">非标</option>  
							    <option value="基金">基金</option>  
							    <option value="保险">保险</option>  
							</select> 
                        </td>
                        <td align="left">资产提供方：</td>
                        <td align="left">
                             <input id="mercList" name="mercId" editable=false panelHeight="auto" />
                        </td>
                       
                    </tr>
                    <tr>
                    	<td align="right">资产批次：</td>
                    	<td>
                    		 <input id="batch_no" name="batchNo" type="text" class="custsearchInput"/>
                        </td>
                    	 <td align="right">资产编号：</td>
                        <td>
                            <input id="asset_id" name="assetId" type="text" class="custsearchInput"/>
                        </td>
                        <td><input id="queryBtn" name="button" type="button" class="greenBtn" value="查  询"/></td>
                        <td><input id="resetBtn" type="button" class="greenBtn" value="重置" onclick="clearInput()"/></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>

    <div style="height: 8px;"></div>
    <table id="gridResult" class="easyui-datagrid">
    </table>
    
    <!-- dialog 资产审核 -->
    <div id="check_asset_dialog" style="display: none;padding: 10px 5px;font-size: 12px;">
    	<p>审核结果：<span style="padding-left: 20px;">
    		<select id="check_result" style="width: 100px">
    			<option value="1">通过</option>
    			<option value="4">未通过</option>
    		</select>
    	</span></p>
    </div>
    
    <!-- dialog 资产详情 -->
    <div id="asset_detail_dialog" style="padding: 10px 40px;">
    	
    </div>
    
</div>
</body>
</html>