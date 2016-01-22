<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%--<%@include file="golbal_taglib.jsp" %>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>同源管理平台</title>
<link href="/images/tyys7_fzzzh_48.png" rel="shortcut icon" />
<link href="/css/default.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="/js/easyui.1.2.6/themes/default/easyui.css"/>
<%--<link rel="stylesheet" type="text/css" href="/js/easyui.1.2.6/themes/default/easyui.css"/>--%>
<link rel="stylesheet" type="text/css" href="/js/easyui.1.2.6/themes/icon.css"/>
<script type="text/javascript" src="/js/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="/js/easyui.1.2.6/jquery.easyui.min.js"></script>
<script type="text/javascript" src='/js/easyui.1.2.6/caidan.index.js'></script>
<%--<script type="text/javascript">var root = ""; </script>--%>
<script type="text/javascript">

var _menus = {
    "menus": [
        {
            "menuid": "1",
            "icon": "icon-sys",
            "menuname": "同源管理",
            "menus": [
                {
                    "menuid": "1001",
                    "menuname": "用户管理",
                    "icon": "icon-sys",
                    "child": [
                        {
                            "menuid": "1001001",
                            "menuname": "用户管理",
                            "icon": "icon-tree-level",
                            "url": "/finance/userpage"
                        }
                    ]
                },
                {
                    "menuid": "1007",
                    "menuname": "员工管理",
                    "icon": "icon-sys",
                    "child": [
                        {
                            "menuid": "1007001",
                            "menuname": "员工管理",
                            "icon": "icon-tree-level",
                            "url": "/finance/merchant/index"
                        }
                    ]
                },
                {
                    "menuid": "1002",
                    "menuname": "商品管理",
                    "icon": "icon-sys",
                    "child": [
                        {
                            "menuid": "1002001",
                            "menuname": "商品管理",
                            "icon": "icon-tree-level",
                            "url": "/product/list.do"
                        }/*,
                         {
                         "menuid": "1002002",
                         "menuname": "产品贴息管理",
                         "icon": "icon-tree-level",
                         "url": "/finance/userpage"
                         },
                         {
                         "menuid": "1002003",
                         "menuname": "用户贴息管理",
                         "icon": "icon-tree-level",
                         "url": "/finance/userpage"
                         },
                         {
                         "menuid": "1002004",
                         "menuname": "产品可售资产查询",
                         "icon": "icon-tree-level",
                         "url": "/finance/userpage"
                         }*/
                    ]
                },
                {
                    "menuid": "1003",
                    "menuname": "帐务管理",
                    "icon": "icon-sys",
                    "child": [
                        {
                            "menuid": "1003003",
                            "menuname": "固定资产",
                            "icon": "icon-tree-level",
                            "url": "/finance/assetManagement/jrAssetAssign/index"
                        },
                        {
                            "menuid": "1003003",
                            "menuname": "现金流水",
                            "icon": "icon-tree-level",
                            "url": "/finance/assetManagement/nonstandard/index"
                        },
                        {
                            "menuid": "1003003",
                            "menuname": "清算结算",
                            "icon": "icon-tree-level",
                            "url": "/finance/assetManagement/entering/index"
                        },
                        {
                            "menuid": "1003002",
                            "menuname": "资产负债",
                            "icon": "icon-tree-level",
                            "url": "/finance/assetManagement/auditpage"
                        }
                    ]
                },
                {
                    "menuid": "1004",
                    "menuname": "交易管理",
                    "icon": "icon-sys",
                    "child": [
                        {
                            "menuid": "1004001",
                            "menuname": "订单管理",
                            "icon": "icon-tree-level",
                            "url": "/finance/tradeSearch/orderPurchse/index"
                        },
                        {
                            "menuid": "1004001",
                            "menuname": "购物车管理",
                            "icon": "icon-tree-level",
                            "url": "/finance/tradeSearch/orderPurchse/index2"
                        },
                        {
                            "menuid": "1004002",
                            "menuname": "支付流水",
                            "icon": "icon-tree-level",
                            "url": "/finance/tradeSearch/orderRansom/index"
                        },
                        {
                            "menuid": "1004003",
                            "menuname": "配送管理",
                            "icon": "icon-tree-level",
                            "url": "/finance/tradeSearch/statistics/index"
                        }
                    ]
                },
                {
                    "menuid": "1005",
                    "menuname": "公司管理",
                    "icon": "icon-sys",
                    "child": [
                         {
                            "menuid": "1005002",
                            "menuname": "自有店铺",
                            "icon": "icon-tree-level",
                            "url": "/company/store.do"
                        },
                        {
                            "menuid": "1005002",
                            "menuname": "外部商户",
                            "icon": "icon-tree-level",
                            "url": "/company/merchant.do"
                        }
                    ]
                }
            ]
        }
    ]
};

</script>

</head>
<body class="easyui-layout" style="overflow-y: hidden" fit="true" scroll="no">
<noscript>
    <div style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
    </div>
</noscript>

<div id="loading-mask"
     style="position:absolute;top:0px; left:0px; width:100%; height:100%; background:#D2E0F2; z-index:20000">
    <div id="pageloading"
         style="position:absolute; top:50%; left:50%; margin:-120px 0px 0px -120px; text-align:center;  border:2px solid #8DB2E3; width:200px; height:40px;  font-size:14px;padding:10px; font-weight:bold; background:#fff; color:#15428B;">
        <img src="/images/loading.gif" align="absmiddle"/> 正在加载中,请稍候...
    </div>
</div>

<div region="north" split="true" border="false" style="overflow: hidden; height: 60px;
        background: url(/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana">
    <span style="float:right; padding-right:20px;" class="head">欢迎您 <a href="#" id="loginOut">安全退出</a></span>
    <span style="padding-left:10px; font-size: 16px; "><img src="/images/tyys7_fzzzh_96.png" width="50" height="50"
                                                            align="absmiddle"/> 同源管理平台</span>
</div>
<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
    <div class="footer">Copyright © 2015-2018 www.tyuan.com</div>
</div>
<div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
    <div id="nav">
    </div>

</div>
<div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
    <div id="tabs" class="easyui-tabs" fit="true" border="false">
        <div title="欢迎使用" style="padding:20px;overflow:hidden;font-weight: bold;">
            欢迎使用同源管理平台！
        </div>
    </div>
</div>

<div id="mm" class="easyui-menu" style="width:150px;">
    <div id="tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="close">关闭</div>
    <div id="closeall">全部关闭</div>
    <div id="closeother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="closeright">当前页右侧全部关闭</div>
    <div id="closeleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
</div>

</body>
</html>