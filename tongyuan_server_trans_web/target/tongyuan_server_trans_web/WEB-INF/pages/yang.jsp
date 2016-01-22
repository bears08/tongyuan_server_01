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
<body style="background: #eee">
<div id="title">
    <i class="fr red" style="padding-right: 20px;">12</i>
    <img src="img/shop_car_collection.png" class="fr" style="width: 30px; height: 30px;  background-position: 0 0; padding-top: 8px; "></img>
    <img src="img/main_tab_me_selected.png" class="fl" style="width: 30px; height: 30px;  background-position: 0 0; padding-top: 8px; padding-left: 20px"></img>
	<p class="fz18">养生</p>
</div>
<div class="con">
	<ul class="pro-list p-10-10 mb50">
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li id="gan" onclick="categoryClick(this)">
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">补肝明目</h2>
				</li>
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">补心补气</h2>
				</li>
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">固本配元</h2>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">补脾健胃</h2>
				</li>
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">养肺润肺</h2>
				</li>
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">阳虚体质</h2>
				</li>
			</ol>
		</li>
		<li>
			<div class="mark"></div>
			<ol class="info over">
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">湿热体质</h2>
				</li>
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">痰湿体质</h2>
				</li>
				<li>
					<img style="width: 100px; height: 100px;  background-position: 0 0; " src="http://cp2.douguo.net/upload/caiku/d/1/a/400_d120ae4715b917ba4fd9f0403fb4532a.jpg" alt="">
					<h2 class="center fz18">阴虚体质</h2>
				</li>
			</ol>
		</li>
	</ul>
</div>
<div class="nav pof center">
	<a id="today" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-1"></i><br>今日</a>
	<a id="yang" href="javascript:;" onclick="navClick(this)" class="fl fz12"><i class="icon nav-2 on"></i><br>养生</a>
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
	function categoryClick(obj){
		window.location.href = "index.jsp";
	}
</script>
</body>
</html>