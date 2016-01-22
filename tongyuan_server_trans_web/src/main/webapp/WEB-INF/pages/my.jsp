<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=0, initial-scale=1">
	<meta name="format-detection" content="telephone=no" />
	<title>同源养生餐</title>
	<link rel="stylesheet" href="/css/style.css">
    <script src="/js/common.js"></script>
</head>
<body style="background: #eee;">
<div id="title">
    <i class="fr red" style="padding-right: 20px;">12</i>
    <img src="img/shop_car_collection.png" class="fr" style="width: 30px; height: 30px;  background-position: 0 0; padding-top: 8px; "></img>
    <img src="img/main_tab_me_selected.png" class="fl" style="width: 30px; height: 30px;  background-position: 0 0; padding-top: 8px; padding-left: 20px"></img>
	<p class="fz18">我的</p>
</div>
<div class="con fund" style="background: #fff; margin-bottom: 60px;">
		<ol class="info over">
			<li>
			</li>
			<li>
				<p class="fz12 red"  onclick="window.location.href='/login.do'">登录/注册</p>
			</li>
		</ol>
	<div class="detial-footer fund-footer">
		<ul>
			<li class="bor-b">
				<a href="javascript:;">
					<i class="fr icon i-next"></i>
					<span>收货地址：</span>
					<span class="frm">新外大街23号院</span>
				</a>
			</li>
			<li class="bor-b">
				<a href="javascript:;">
					<i class="fr icon i-next"></i>
					<span>我的订单：</span>
					<span class="frm">订单号：20160111</span>
				</a>
			</li>
			<li class="bor-b">
				<a href="javascript:;">
					<i class="fr icon i-next"></i>
					<span>账户余额：</span>
					<span class="frm">0.0元</span>
				</a>
			</li>
			<li class="bor-b">
				<a href="javascript:;">
					<i class="fr icon i-next"></i>
					<span>我的积分：</span>
					<span class="frm">20160111同钱</span>
				</a>
			</li>
			<li>
				<a href="javascript:;">
					<i class="fr icon i-next"></i>
					<span>我的优惠券：</span>
					<span class="frm">3张源券</span>
				</a>
			</li>
		</ul>
	</div>
	<div class="nav pof center">
		<a id="today" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-1"></i><br>今日</a>
		<a id="yang" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-2"></i><br>养生</a>
		<a id="my" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-3 on"></i><br>我的</a>
	</div>
</div>
<script src="./js/common.js"></script>
</body>
</html>