var $= function(str){
	return document.querySelector(str);
},
$All= function(str){
	return document.querySelectorAll(str);
};
var fn = {
	each: function(arr, fun){
		for(var i = 0; i < arr.length; i++){
			(function(i){
				fun(arr[i]);
			})(i);
		}
	},
	addClass: function(obj, name){
		obj.classList.add(name);
	},
	removeClass: function(obj, name){
		obj.classList.remove(name);
	},
	serialize: function(oForm){
		var str = '',
			arr = oForm.querySelectorAll('[name]');
		fn.each(arr, function(obj){
			var type = obj.type;
			 if (obj.nodeName.toLowerCase() != 'fieldset' && !obj.disabled && type != 'submit' && type != 'reset' && type != 'button' && type != 'file' && ((type != 'radio' && type != 'checkbox') || obj.checked)){
			 	str += obj.name +'='+obj.value+"&";
			 }
		});

		return str.substring(0, str.length-1);
	},
	ajax: function(json){
		var url = json.url,
			type = json.type || 'GET',
			async = json.async || true,
			data = json.data || '',
			suc = json.success || null,
			fail = json.fail || null;

		if(!url) return;

		if(window.XMLHttpRequest){
			var oAjax = new XMLHttpRequest();
		}else{
			var oAjax = new ActiveXObject("Microsoft.XMLHTTP");
		}

		switch(type.toLowerCase()){
			case 'get':
				oAjax.open('GET', url, true);
				oAjax.send();
				break;
			default:
				oAjax.open('POST', url, true);
				oAjax.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				oAjax.send(data);
				break;
		}

		oAjax.onreadySatateChange = function(){
			if(oAjax.readyState == 4){
				if(oAjax.status >= 200 && oAjax.status <300 || oAjax.status ==304){
					suc && suc(oAjax.responseText);
				}
			}else{
				fail && fail();
			}
		}
	},
	preventMove: function(obj){
		obj.addEventListener('touchmove', function(ev){
			ev.preventDefault();
		}, false);
	}
};
//圆形百分比
function scrollNum(circle, ele, num){
	var timer = null, n = 0;

	setTimeout(function(){
		circle.setAttribute('stroke-dashoffset', num*314/100);
	},10)

	timer = setInterval(function(){
		n++;
		if(n > num){
			timer = null;
			return;
		}
		ele.innerHTML = n;
	}, 800/num);   //800是css动画执行时间
}
//倒计时
function countDown(obj, time){
 	var aSpan = obj.querySelectorAll('span'),
 		timer = null;

 	function down(){
 		var h = parseInt(time/3600),
 			m = parseInt(time%3600/60),
 			s = time%3600%60;

 		h = (h < 10) ? '0'+h : h;

 		m = (m < 10) ? '0'+m : m;

 		s = (s < 10) ? '0' +s : s;

 		aSpan[0].innerHTML = h;
 		aSpan[1].innerHTML = m;
 		aSpan[2].innerHTML = s;
			time--;
			if(time == -1){
				clearInterval(timer);
			}
 	}

 	down();

 	timer = setInterval(down, 1000);
 }

//计算器
function incomeLine(){
	var nW = document.body.clientWidth,
		bCount = true,
		oIncome = $('.J_income'),
		oIncomeCount = $('.J_inconeCount'),
		oCount = $('.J_count'),
		oCountBtn = $('.J_countBtn'),

		oJD = $('.J_lineJD'),
		numJD = oJD.dataset.per,
		oJJ = $('.J_lineJJ'),
		numJJ = oJJ.dataset.per,
		oYH = $('.J_lineYH'),
		numYH = oYH.dataset.per;

	oCount.oninput = function(){
		var s = this.value;
		if(s){
			oCountBtn.classList.remove('disabled');
		}else{
			oCountBtn.classList.add('disabled');
		}
		if(this.value.length>=8){
			this.value = this.value.substring(0, 8)
		}
	};


	oCountBtn.onclick = function(){
		var nVaule = oCount.value;
		if(!nVaule){
			return;
		};
		if(bCount){
 		oIncomeCount.classList.add('action');
 		oCountBtn.classList.add('disabled');
		}else{
 		oIncomeCount.classList.remove('action');
 		oCountBtn.classList.remove('disabled');
		}
		oIncome.style.left = 0;
 	this.innerHTML = '重新预估';

		oJD.setAttribute('stroke-dashoffset', 0);
		setTimeout(function(){
			oJJ.setAttribute('stroke-dashoffset', (420 - numJJ/numJD*nW+10));
		}, 200);
		setTimeout(function(){
 		oYH.setAttribute('stroke-dashoffset', (420 - numYH/numJD*nW+10));
		}, 350);

		bCount = !bCount;

	};
}

// 产品列表
function productLine(){
	var aProPer = $All('.J_proPer'),
		nW = document.body.clientWidth;
	fn.each(aProPer, function(obj){
		var oLine = obj.querySelector('.J_linePro'),
			num = obj.dataset.per;
		oLine.setAttribute('stroke-dashoffset', (326-326 *num * (nW/420)+10));
	})
}

//加载更多
function addMore(){
	var maxH = document.documentElement.scrollHeight;
	window.onscroll = function(){
		var oH = document.documentElement.clientHeight,
			cH = document.body.scrollTop;
		if(maxH-oH-cH <=10){
			fn.ajax({
				type: 'post',
				url: 'http://10.45.243.81/index.jsp',
				data: '{name:"aa", age: 123}',
				success: function(data){
					alert(data);
				}

			})
		}
	};
}

//底部导航栏
function navClick(obj){
	if(obj.id == "today"){
		window.location.href="/index.do";
	}
	if(obj.id == "yang"){
		window.location.href = "/yang.do";
	}
	if(obj.id == "my"){
		window.location.href = "/my.do";
	}

}