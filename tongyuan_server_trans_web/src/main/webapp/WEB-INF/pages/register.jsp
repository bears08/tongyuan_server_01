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
		<p class="fz18">注册</p>
	</div>
	<div class="con payment J_payment">
		<div class="payment-input over flexbox">
			<div>手机号码：</div>
			<input type="tel" name="money" class="flex1">
		</div>
		<div class="payment-input over flexbox">
			<div>验证码：</div>
			<input class="flex1">
			<div><a class="fl btn  white"  href="javascript:window.location.href='finish.jsp';">获取验证码</a></div>
		</div>
		<div class="payment-input over flexbox">
			<div>设置密码：</div>
			<input type="tel" name="money" class="flex1">
		</div>

	</div>
	<div class="payment-btn pof">
		<a class="fl btn btn-big white"  href="javascript:window.location.href='finish.jsp';">注册</a>
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