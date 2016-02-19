<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%--<%@include file="/pages/golbal_taglib.jsp"%>--%>
<!DOCTYPE html>
<html>
<head>
<title>商品分类</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
<link href="/css/index.css" rel="stylesheet" type="text/css" />
<link href="/css/index_fenye.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/js/easyui.1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/easyui.1.2.6/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/easyui.1.2.6/json.js"></script>
<link rel="stylesheet" href="/js/easyui.1.2.6/themes/icon.css" type="text/css">
<link rel="stylesheet" href="/js/easyui.1.2.6/themes/default/easyui.css" type="text/css">
<link rel="stylesheet" href="/css/custom.css" type="text/css">
<script type="text/javascript" src="/js/product/category.js?p=<%=System.currentTimeMillis()%>"></script>
</head>

<body>
	<input type="hidden" id="rootPath"
		value="<%=request.getContextPath()%>" />
	<div class="main" style="width: 99%">
		<div id="showFormDiv" class="main"
			style="width: 99%; text-align: center">
			<table border="1" cellpadding="3" cellspacing="0"
				style="margin: 80px auto auto;" id="bigtable">
				<thead>
					<th>编号</th>
					<th>名称</th>
					<th>状态</th>
					<th>评分</th>
					<th>大图</th>
					<th>小图</th>
					<th>简介</th>
					<th>详情</th>
					<th>开售时间</th>
					<th>停售时间</th>
					<th>是否推荐</th>
					<th>排序字段</th>
					<th>操作人员</th>
					<th>创建时间</th>
					<th>更新时间</th>
					<th>操作</th>
				</thead>
				<tbody>
					<c:if test="${!empty categoryList && fn:length(categoryList)>0}">
						<c:forEach items="${categoryList}" var="category">
							<tr>
								<td width="40px">${category.id}</td>
								<td width="40px">${category.name}</td>
								<td width="40px">${category.state}</td>
								<td width="40px">${category.score}</td>
								<td width="40px">${category.pic}</td>
								<td width="40px">${category.picSmall}</td>
								<td width="40px">${category.summary}</td>
								<td width="40px">${category.detail}</td>
                                <td width="120px"><fmt:formatDate value="${category.soldStart}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                <td width="120px"><fmt:formatDate value="${category.soldEnd}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${category.isRecommend == 0 ? "不推荐":"推荐"}</td>
								<td width="40px">${category.sort}</td>
								<td width="40px">${category.operatorName}</td>
								<td width="120px"><fmt:formatDate value="${category.createDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td width="120px"><fmt:formatDate value="${category.updateDate}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td width="100px" style="line-height: 30px;">
									<input type="button" class="greenBtn" value="修改" onclick="modifyCategory('${category.id}')">
									<%--<input type="button" class="greenBtn" style="visibility:${category.state == 0 ? '' : 'hidden'};" value="下架" onclick="deletePro('${category.id}')">--%>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<table style="text-align: center; width: 99%">
				<tr>
					<td><input type="button" value="新增" class="greenBtn" onclick="addCategory()"> <input type="button" value="刷新" class="greenBtn" onclick="window.location.reload();"></td>
				</tr>
			</table>
		</div>

		<div id="categoryDialog">
			<table
				style="display: none; width: 99%; border-collapse: separate; border-spacing: 10px;">
				<tr height="30">
					<td align="right">名称：</td>
					<td><input id="name" class="easyui-validatebox"></td>
				</tr>
                <tr height="30">
                    <td align="right">状态：</td>
                    <td>
                        <select id="state" class="easyui-combobox" style="width: 155px;"  panelHeight='auto'>
                            <option value="0">下架</option>
                            <option value="1">上架</option>
                        </select>
                    </td>
                </tr>
                <tr height="30">
                    <td align="right">大图：</td>
                    <td><input id="pic" type="text"></td>
                </tr>
                <tr height="30">
                    <td align="right">小图：</td>
                    <td><input id="picSmall" type="text"></td>
                </tr>
                <tr height="30">
                    <td align="right">简介：</td>
                    <td><input id="summary" type="text"></td>
                </tr>
                <tr height="30">
                    <td align="right">详情：</td>
                    <td><input id="detail" type="text"></td>
                </tr>
                <tr height="30">
                    <td align="right">开卖时间：</td>
                    <td>
                        <input id="soldStart" name="time6" type="text" class="easyui-datetimebox"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="right">停卖时间：</td>
                    <td>
                        <input id="soldEnd" name="time6" type="text" class="easyui-datetimebox"/>
                    </td>
                </tr>
                <tr height="30">
                    <td align="right">排序：</td>
                    <td><input id="sort" type="text"></td>
                </tr>
                <tr height="30">
                    <td align="right">是否推荐：</td>
                    <td>
                        <select id="isRecommend" class="easyui-combobox" style="width: 155px;"  panelHeight='auto'>
                            <option value="0">不需要推荐</option>
                            <option value="1">需要推荐</option>
                        </select>
                    </td>
                </tr>
				<tr height="30">
					<td align="center" colspan="2">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" value="确定" id="confirmBtn" class="greenBtn" onclick="addCategory()"/>
						<input type="button" value="取消" id="cancelBtn" onclick="$('#categoryDialog').dialog('close');" class="greenBtn" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>