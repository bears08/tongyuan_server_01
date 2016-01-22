<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <link href="/img/tyys.png" rel="shortcut icon" />
	<meta name="viewport" content="width=device-width, user-scalable=0, initial-scale=1">
	<meta name="format-detection" content="telephone=no" />
	<title>同源养生餐</title>
	<link rel="stylesheet" href="/css/style.css">
	<script src="/js/common.js"></script>
</head>
<body style="background: #eee">
<div id="title">
    <i id="cartNum" onclick="javascript:window.location.href='/cart.do';" class="fr red" style="padding-right: 20px;">12</i>
    <img onclick="javascript:window.location.href='/cart.do';" src="img/shop_car_collection.png" class="fr" style="width: 30px; height: 30px;  background-position: 0 0; padding-top: 8px; "></img>
    <img onclick="javascript:window.location.href='/my.do';" src="img/main_tab_me_selected.png" class="fl" style="width: 30px; height: 30px;  background-position: 0 0; padding-top: 8px; padding-left: 20px"></img>
	<p class="fz18">今日</p>
</div>
<div class="con">
	<ul class="pro-list p-10-10 mb50">
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
				</li>
				<li>
					<h2 class="center fz18">猪肉白菜水饺</h2>
					<div class="tip mb10 fz12"><span>15.0</span><span>特价</span></div>
					<span class="fz12 gray9">白菜微寒，微苦，得秋气最重补肺</span>
				</li>
				<li style="padding-top: 50px">
						<i class=" icon i-jian"></i>
						<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
						<i name="jia" class="icon i-jia"></i>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
				</li>
				<li>
					<h2 class="center fz18">猪肉白菜水饺</h2>
					<div class="tip mb10 fz12"><span>15.0</span><span>特价</span></div>
					<span class="fz12 gray9">白菜微寒，微苦，得秋气最重补肺</span>
				</li>
				<li style="padding-top: 50px">
					<i name="jian" class=" icon i-jian" onclick="jiaJian(this)"></i>
					<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
					<i name="jia" class="icon i-jia" onclick="jiaJian(this)"></i>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
				</li>
				<li>
					<h2 class="center fz18">猪肉白菜水饺</h2>
					<div class="tip mb10 fz12"><span>15.0</span><span>特价</span></div>
					<span class="fz12 gray9">白菜微寒，微苦，得秋气最重补肺</span>
				</li>
				<li style="padding-top: 50px">
					<i class=" icon i-jian"></i>
					<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
					<i class="icon i-jia"></i>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
				</li>
				<li>
					<h2 class="center fz18">猪肉白菜水饺</h2>
					<div class="tip mb10 fz12"><span>15.0</span><span>特价</span></div>
					<span class="fz12 gray9">白菜微寒，微苦，得秋气最重补肺</span>
				</li>
				<li style="padding-top: 50px">
					<i class=" icon i-jian"></i>
					<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
					<i class="icon i-jia"></i>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
				</li>
				<li>
					<h2 class="center fz18">猪肉白菜水饺</h2>
					<div class="tip mb10 fz12"><span>15.0</span><span>特价</span></div>
					<span class="fz12 gray9">白菜微寒，微苦，得秋气最重补肺</span>
				</li>
				<li style="padding-top: 50px">
					<i class=" icon i-jian"></i>
					<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
					<i class="icon i-jia"></i>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
				</li>
				<li>
					<h2 class="center fz18">猪肉白菜水饺</h2>
					<div class="tip mb10 fz12"><span>15.0</span><span>特价</span></div>
					<span class="fz12 gray9">白菜微寒，微苦，得秋气最重补肺</span>
				</li>
				<li style="padding-top: 50px">
					<i class=" icon i-jian"></i>
					<span class="fz12 red" style="padding-left: 20px;padding-right: 20px">30</span>
					<i class="icon i-jia"></i>
				</li>
			</ol>
		</li>
	</ul>
</div>

<div class="nav pof center">
	<a id="today" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-1 on"></i><br>今日</a>
	<a id="yang" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-2"></i><br>养生</a>
	<a id="my" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-3"></i><br>我的</a>
</div>
<script>
	window.onload = function(){
		var aCountDown = $All('.J_countDown');

		for(var i = 0; i < aCountDown.length; i++){
			var time = aCountDown[i].dataset.num;
			countDown(aCountDown[i], time);
		}
	};

	function jiaJian(obj){
		if(obj.getAttribute('name') == "jia"){
			var num = obj.previousElementSibling.innerHTML;
			num ++;
			obj.previousElementSibling.innerHTML = num;
		}
		if(obj.getAttribute('name') == "jian"){
			var num = obj.nextElementSibling.innerHTML;
			num --;
			obj.nextElementSibling.innerHTML = num;
		}
	}
</script>
</body>
</html>