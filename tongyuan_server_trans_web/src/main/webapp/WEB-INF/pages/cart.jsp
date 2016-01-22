<%@ page language="java" contentType="text/html; charset=UTF-8" %>
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
<body style="background: #eee">
	<div id="title">
		<i class="fl icon i-back" onclick="javascript:history.back();"></i>
		<p class="fz18">购物车</p>
	</div>
	<div class="con payment J_payment">
		<ul>
			<li>
				<ol class="info over">
					<li>
						红烧豆腐
					</li>
					<li>
						<i class=" icon i-jian"></i>
						<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
						<i name="jia" class="icon i-jia"></i>
					</li>
					<li>
						12.0元
					</li>
				</ol>
			</li>
			<li>
				<ol class="info over">
					<li>
						葱爆海参
					</li>
					<li>
						<i class=" icon i-jian"></i>
						<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">3</span>
						<i name="jia" class="icon i-jia"></i>
					</li>
					<li>
						42.0元
					</li>
				</ol>
			</li>
			<li>
				<ol class="info over">
					<li>
						清炒土豆丝
					</li>
					<li>
						<i class=" icon i-jian"></i>
						<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">1</span>
						<i name="jia" class="icon i-jia"></i>
					</li>
					<li>
						8.0元
					</li>
				</ol>
			</li>
			<li>
				<ol class="info over">
					<li>
						醋溜白菜
					</li>
					<li>
						<i class=" icon i-jian"></i>
						<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">4</span>
						<i name="jia" class="icon i-jia"></i>
					</li>
					<li>
						60.0元
					</li>
				</ol>
			</li>
		</ul>
		<div class="fz12 gray9 ml10" style="line-height: 18px; margin-top: 8px">
			<p>总金额：<em class="red">120.00元</em> <span class="ml10">总份数：<em class="red">13</em>份</span></p>
			<p>本订单由<em class="red">同源养生</em>为您配送</p>
		</div>
		<div class="payment-input over flexbox">
			<div>收货地址：</div>
			<input class="flex1" placeholder="新外大街23号院2号楼1单元202">
		</div>
		<div class="payment-input over flexbox">
			<div>手机号码：</div>
			<input type="tel" name="money" class="flex1">
		</div>
		<div class="payment-input over flexbox">
			<div>验证码：</div>
			<input class="flex1">
			<span><a class="fl"  style="background: #d9434b;color: #fff;" href="javascript:window.location.href='finish.jsp';">获取验证码</a></span>
		</div>
		<div class="payment-input over flexbox">
			<div>付款方式：</div>
			<div>货到付款</div>
		</div>
		<div class="payment-input over flexbox">
			<div>订单备注：</div>
			<input type="tel" name="money" class="flex1">
		</div>

	</div>
	<div class="payment-btn pof">
		<a class="fl btn btn-big white"  href="javascript:window.location.href='/finish.do';">确认下单</a>
	</div>
<script>
//var oInput = document.querySelector('input[name="money"]'),
// 	u = navigator.userAgent,
//  	ios = ((u.search(/iphone/ig) != -1)? true : false),
//	oCon = document.querySelector('.J_payment');
//	if(!ios){
//		aa();
//	}
//
//		function aa(){
//			oInput.onfocus = function(){
//				oCon.style.top = '-110px';
//			}
//			oInput.onblur = function(){
//				oCon.style.top = '0';
//			}
//		}
</script>
</body>
</html>