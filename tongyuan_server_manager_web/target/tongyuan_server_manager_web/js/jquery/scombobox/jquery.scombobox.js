
jQuery.basePath=function(filename){
	var eles = document.getElementsByTagName('script');
	for(var i=0;i<eles.length;i++){
		var src = eles[i].getAttribute('src');
		if(src&&src.indexOf(filename)==src.length-filename.length){
			return src.substr(0,src.indexOf(filename));
		}
	}
};
(function($){
	$.fn.scombobox = function(opt,data){
		if(typeof(opt)=='string'){
			return $.fn.scombobox.method[opt](this,data);
		}
		else{
			return $.fn.scombobox.method.init(this,opt);
		}
	};
	$.fn.scombobox.defaults={panels:{},valueField:'id',textField:'text',width:'auto',panelWidth:'auto',panelHeight:150,
			value:null,multiple:false,separator:',',editable:true,disabled:false,maxOptions:50,
			filter:function(key,row){
				if(!key)return {position:0,length:0};
				if((pos=row[this.textField].indexOf(key))>=0){
					var ary = [key];ary.position=pos;
					return ary;
				}
				return $.pinyin?$.pinyin.filter(row[this.textField],key):false;
			}
	};
	$.fn.scombobox.method={
			init:function(target,options){
				return init(target,options);
			},
			options:function(target){
				return target.data('options');
			},
			getValue:function(target){
				return $(target[0]).data('scombo-val').val();
			},
			getValues:function(target){
				return $(target[0]).data('scombo-val').val().split($(target[0]).data('options').separator);
			},
			getText:function(target){
				return target.val();
			},
			setValue:function(target,val){
				validate(target,true);
				var valInput = $(target[0]).data('scombo-val').val(val);
				changeEvt($(target[0]),valInput);
				return target;
			},
			setValues:function(target,val){
				validate(target,true);
				var valInput = $(target[0]).data('scombo-val').val(val.constructor==Array?val.join($(target[0]).data('options').separator):val);
				changeEvt($(target[0]),valInput);
				return target;
			},
			setText:function(target,text){
				validate(target,true);
				return target.val(text);
			},
			valuebox:function(target){
				return target.data('scombo-val');
			},
			remove:function(target){
				target.data('scombo-val').remove();
				return target.remove();
			},
			showPanel:function(target,event){//触发面板显示的事件
				return showPanel(target,event);
			},
			hidePanel:function(target){
				validate(target,true);
				var th = $(target),div=th.data('scombo-panel');
				div.hide();
				changeEvt(th);
				return th;
			},
			disable:function(target){
				target.data('options').disabled=true;
				$(document).trigger('click',[true]);
				return target.attr('disabled',true);
			},
			enable:function(target){
				target.data('options').disabled=false;
				validate(target,true);
				return target.attr('disabled',false);
			},
			editable:function(target,editable){
				target.data('options').editable=editable;
				validate(target,true);
				return target;
			}
	};
	function init(target,options){
		if(!$.pinyin){
			$.getScript($.basePath('jquery.easyui.min.js')+'pinyin.js');
		}
		var opt = $.extend({},$.fn.scombobox.defaults,options);
		target.attr('autocomplete', 'off').data('options',opt).unbind('.scombo');
		if(!$.fn.scombobox.defaults._panel){//如果还没有创建面板，则新建面板
			var div =$.fn.scombobox.defaults._panel= $('<div class="scombo-panel"></div>').appendTo('body').bind('mousedown',function(){return false;});
			div.hide();
		}
		target.bind('dataloaded.scombo',dataloadedEvent);
		validate(target,true);
		target.data('scombo-panel',$.fn.scombobox.defaults._panel);//将下拉面板绑定到输入框上
		target.each(function(){
			var th=$(this),opt=$.extend({},$.fn.scombobox.defaults,parseOption(this),options);
			th.data('options',opt);
			var valInput = $('<input type=hidden >').attr('name',th.attr('name')).insertBefore(this);
			if(th.attr('tagName').toLowerCase()=='select'){//如果是select，需要将Select隐藏，显示input
				th = $('<input type=text autocomplete=off>').insertBefore(this).bind('dataloaded.scombo',dataloadedEvent).data('options',opt).data('scombo-panel',$.fn.scombobox.defaults._panel);
				var domAttrs = {type:true,outerHTML:true,innerHTML:true,outerText:true,innerText:true,tagName:true,textContent:true,localName:true,nodeName:true,baseURI:true,namespaceURI:true};
				for(var p in this){
					try{if(this[p]&&!domAttrs[p]&&typeof(this[p])=='string')th.attr(p,this[p]);}catch(e){;}
				}
				th.attr('style',$(this).attr('style'));
				$(this).remove();
				target.push(th[0]);
			}
			//设定隐藏域的值
			valInput.val(getVal(opt.value,th.val()));
			th.addClass('scombo-box').attr('readonly',opt.disabled).attr('scombo-name',th.attr('name')).removeAttr('name').val('')
					.data('scombo-val',valInput).data('old-val',valInput.val()).bind('click.scombo focus.scombo paste.scombo keyup.scombo type.scombo',function(event){
				$.fn.scombobox.method.showPanel(this,event);return $.event.fix(event).type=='paste';//只有粘贴事件冒泡，其它事件不冒泡
			});
			if(opt.width&&opt.width!='auto'){//处理宽度
				var wid=getVal(opt.width,th.outerWidth());
				th.width(wid);
				if(th.outerWidth()!=wid){//防止不同盒子模型解析的宽度不一致
					th.width(wid-(th.outerWidth()-wid)).height(18);
				}
			}
		});
		if(opt.url){//最后再从服务器加载内容，以免取不到VALUE隐藏字段
			$.post(opt.url,opt.params,function(data){
				try{
					var ary = $.parseJSON(data);
				}
				catch(e){;}
				opt.data = ary||data;
				target.trigger('dataloaded');//触发数据加载成功事件
			});
		}
		else{//触发数据加载成功事件
			target.trigger('dataloaded');
		}
		return target;
	}
	function showPanel(target,event){
		var th = $(target),div=th.data('scombo-panel'),opt=th.data('options');
		if(!opt||opt.disabled)return th;//禁用时直接返回，不显示下拉面板
		var pos = th.offset();
		pos.top+=th.outerHeight()+2;
		pos.width = getVal(opt.panelWidth,th.outerWidth()-1);
		pos.height = getVal(opt.panelHeight,'');
		div.css(pos);//定位
		if(event){
			var evt = $.event.fix(event),kc=evt.keyCode;
			if(evt.type!='click'&&evt.type!='focus'){
				if(kc==13){//回车
					if((item=$('.hover',div)).length>0){
						th.val(item.text());
						th.data('scombo-val').val(item.attr('value'));
						th.removeData('keypress');
						$(document).trigger('click',[true]);
						return;
					}
				}
				else if(kc==38){//向上
					if($('.hover',div).length==0){
						var item=$('.scombo-item:last',div).addClass('hover');
						makeCenter(div,$('.hover:first',div));
					}
					else{
						var item = $('.hover',div);
						if(item.prev().length>0){
							makeCenter(div,$('.hover:first',div));
							item.removeClass('hover').prev().addClass('hover');
						}
					}
					return;
				}
				else if(kc==40){//向下
					if($('.hover',div).length==0){
						$('.scombo-item:first',div).addClass('hover');
						makeCenter(div,$('.hover:first',div));
					}
					else{
						var item = $('.hover',div);
						if(item.next().length>0){
							makeCenter(div,$('.hover:first',div));
							item.removeClass('hover').next().addClass('hover');
						}
					}
					return;
				}//非控制按键和功能按键8==BACKSPACE,32=SPACE,48-57=0-9,65-90=A-Z,96-111=小键盘,186-222=大键盘上的特殊字符
				else if(kc==8||kc==32||(kc>=48&&kc<=111)||kc>=186){
					th.data('keypress',1);
				}
			}
		}
		var key = event&&(evt.type=='keyup'||evt.type=='type')?th.val():null;//非键盘事件触发时，展开所有选项
		if((div.data('scombo-box')&&div.data('scombo-box')[0]!=th[0])||div.data('scombo-box',th).css('display')=='none'){
			if(div.data('scombo-box')&&div.data('scombo-box')[0]!=th[0]){
				$(document).trigger('click',[true]);
				div.data('scombo-box',th);
			}
			$(document).bind('mousedown.scombo',function (event,hidePanel){//页面中其他位置的点击事件，点击后隐藏下拉面板
				var obj = $($.event.fix(event).target);
				if(!$.fn.scombobox.defaults._panel){
					return;
				}
				var th = $.fn.scombobox.defaults._panel.data('scombo-box');
				if(!hidePanel&&th[0]==obj[0]){
					return;
				}
				var opt = th.data('options');
				if(th.data('keypress')){//如果用户使用键盘输入了，则进行显示值处理
					if(opt.editable){//可写时，将写入的内容存到VALUE字段中
						th.data('scombo-val').val(th.val());
					}
					else{
						var text = '',vals=th.data('scombo-val').val().split(opt.separator);
						for(var i=0;i<opt.data.length;i++){
							if((pos=vals.indexOf(opt.data[i][opt.valueField]))>=0){
								text+=opt.separator+opt.data[i][opt.textField];
								vals.splice(pos,1);
							}
						}
						th.val(text.substr(opt.separator.length));
					}
				}
				changeEvt(th);
				$.fn.scombobox.defaults._panel.removeData('last-key').removeData('keypress').hide();
				$(document).unbind('mousedown.scombo');//解绑本事件
			});
			fillData(div,opt,null);//第一次显示下拉选项时，展开所有选项
		}
		if(div.data('last-key')!=key){
			div.data('last-key',key);
			fillData(div,opt,key);
		}
		return th;
	}
	function changeEvt(th,valInput){
		if(!th||th.length==0)return;
		valInput=valInput||th.data('scombo-val');
		if(valInput.val()!=valInput.data('old-val')){
			th.trigger('change',[valInput.val(),valInput.data('old-val')]);
			valInput.data('old-val',valInput.val());
		}
	}
	function parseOption(target){
		var th = $(target),opt={};
		for(var p in $.fn.scombobox.defaults){
			var val = th.attr(p)+'',dval=$.fn.scombobox.defaults[p];
			if(th.attr(p)){
				opt[p] = val;
				if(typeof(dval)=='boolean')opt[p]=val=='true';
				else if(typeof(dval)!='string')try{opt[p]=eval(val);}catch(e){;}
			}
		}
		if(!opt.data&&th.attr('tagName')=='SELECT'){
			var ary = opt.data = [];
			$('option',th).each(function(){
				ary.push({id:$(this).val(),text:$(this).text()});
			});
		}
		return opt;
	}
	function dataloadedEvent(){
		var opt=$(this).data('options'),val=$(this).data('scombo-val').val();
		if(typeof(opt.data)=='string'){//如果data为string类型，则转化成数组对象格式
			var tmp = opt.data.replace(/([^:]*):([^,]*),?/g,function($0,$1,$2){
				return ',{"'+opt.valueField+'":"'+$1.replace(/"/g,'&#34;')+'","'+opt.textField+'":"'+$2.replace(/"/g,'&#34;')+'"}';
			});
			opt.data=$.parseJSON('['+tmp.replace(/^,+|,+$/g,'')+']');
		}
		for(var i=0;i<opt.data.length;i++){//将ID翻译成文本
			if(opt.data[i][opt.valueField]==val){
				$(this).val(opt.data[i][opt.textField]);
				break;
			}
		}
	}
	function validate(target, doit){
		if ($.fn.validatebox){
			var opts = $(target).data('options');
			$(target).validatebox(opts);
			if (doit){
				$(target).validatebox('validate').trigger('mouseleave');
			}
		}
	}
	function makeCenter(div,item){
		div.scrollTop(0);
		if(pos=item.position()){
			div.scrollTop(pos.top-div.height()/2);
		}
	}
	function getVal(exp,defaults){
		try{
			if(typeof(exp)=='function'){
				return parseInt(exp.call(this))||defaults;//如果定义的是FUNCTION，则调用FUNCTION方法获取值，如未返回值或返回的非数字，则使用输入框原宽度
			}
			else{
				return parseInt(exp)||defaults;//如果不是有效数字，使用输入框原宽度
			}
		}
		catch(e){
			return defaults;
		}
	}
	function fillData(div,opt,key){//将内容转化成HTML
		var ary = [];
		for(var i=0;i<opt.data.length;i++){
			if(res=opt.filter(key,opt.data[i])){//根据输入的值对内容进行过滤显示
				var idx = "";
				text = opt.data[i][opt.textField];
				idx = tostr(text.length,3)+tostr(res.position,4)+tostr(res.length,3);
				if(res.length>0){//对匹配出的字串进行着色表示
					for(var j=0;j<res.length;j++){
						text = text.replace(res[j],'<span class=key>'+res[j]+'</span>');
					}
				}
				ary.push({id:opt.data[i][opt.valueField],text:text,idx:idx});
			}
		}
		for(var i=1;i<ary.length;i++){//对数组按idx进行排序
			for(var j=0;j<ary.length-i;j++){
				if(ary[j].idx>ary[j+1].idx){
					var tmp = ary[j];
					ary[j]=ary[j+1];ary[j+1]=tmp;
				}
			}
		}
		var htm = '';
		var max = key?Math.min(opt.maxOptions,ary.length):ary.length;//过滤时只显示设定的最多项目，否则显示全部内容
		
		for(var i=0;i<max;i++){//转化为HTML文本
			if(!opt.multiple||ary[i].id){//多选时，只有VALUE不为空时才显示
				htm+='<div class=scombo-item value="'+ary[i].id+'">'+ary[i].text+'</div>';
			}
		}
		div.html(htm).toggleClass('multiple-combo',opt.multiple).scrollTop(0).show();
		if($('.scombo-item:first',div).text()==$('.scombo-item:first>span',div).text()){
			$('.scombo-item:first',div).addClass('hover');
		}
		if(val=div.data('scombo-box').data('scombo-val').val()){//如果值不为空，则选中对应的选项
			if(opt.multiple){//多选
				$.each(val.split(opt.separator),function(){
					$('.scombo-item[value="'+this+'"]:first').addClass('selected');
				});
			}
			else{//单选
				$('.scombo-item[value="'+val+'"]:first').addClass('selected');
			}
			makeCenter(div,$('.selected:first',div));
		}
		$('.scombo-item',div).bind('mousedown.sombo',function(){//增加选项单击事件
			var target = $(this).parent().data('scombo-box'),th=$(this),opt=target.data('options');
			if(opt.multiple){//多选
				th.toggleClass('selected');
				var ids=[],texts=[];
				$('.selected',div).each(function(){
					ids.push($(this).attr('value'));
					texts.push($(this).text());
				});
				target.data('scombo-val').val(ids.join(opt.separator));
				target.removeData('keypress').val(texts.join(opt.separator)||'');
			}
			else{//单选
				target.data('scombo-val').val(th.attr('value')||'');
				target.val(th.text()||'');
				target.removeData('keypress');//去掉keypress属性，在调用$(document).click()时，不再将文本值赋到VALUE字段中去
				$(document).trigger('mousedown',[true]);
			}
			validate(target,true);
			return false;
		}).mouseover(function(){
			$('.hover',div).removeClass('hover');
			$(this).addClass('hover');
		}).mouseout(function(){
			$(this).removeClass('hover');
		});
	}
	function tostr(num,len){
		var str = '00000000000000000000'+num;
		return str.substr(str.length-len);
	}
})(jQuery);