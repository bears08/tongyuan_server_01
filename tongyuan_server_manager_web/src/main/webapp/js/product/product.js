/**
 * 程序初始化
 */
$(document).ready(function(){
	$("#minimumBuyPrice").numberbox({
		precision:2
	});
});

function deletePro(prodId){
	$.messager.confirm('确认','您确认要下架该产品信息么？',function(r){   
	    if (r){   
	         $.ajax({
	            type:'GET',
	            url: $("#rootPath").val()+"/finance/deleteprod?prodId="+prodId,
	            success: function(msg){
	               $.messager.show({
						title:'系统提示: ',
						msg:"下架产品操作"+msg,
						timeout:2000,
						showType:'slide'
					});
					window.setInterval(function(){
						window.location.reload();
					},2000);
	                //
	            }
	        });
	    }   
	});  
};

function modifyProduct(prodId){
    emptyInput();
    $.getJSON($("#rootPath").val()+"/finance/getProductById?prodId="+prodId, function(json){
        $("#proname").val(json.name);
        $("#cycle").numberbox("setValue",json.investCycle);
        $("#annualrate").val(json.annualRate);
        $("#flowdesc").val(json.flowDesc);
        $("#minimumBuyPrice").numberbox("setValue",json.minimumBuyPrice);
        $("#guaranteeSafe").val(json.guaranteeSafe);
        $("#prodId").val(json.prodId);
        $("#isForeign").combobox("setValue",json.isForeign);
        $("#badge").val(json.badge);
        $("#sort").val(json.sort);
        $("#isNewUser").combobox("setValue",json.isNewUser);
        $("#isGold").combobox("setValue",json.isGold);
        $("#isPromotion").combobox("setValue",json.isPromotion);
        $("#sellStartTime").datetimebox('setValue', formatDate(new Date(json.sellStartTime)));
        $("#singleMaxAmount").val(json.singleMaxAmount);
    });
    newDialog("修改产品信息");
    $("#prodId").attr("readonly","readonly");
    $("#productDialog table").show();
    $("#confirmBtn").attr("onclick","updateAction(\""+prodId+"\")");
};

function formatDate(now) {
if(now=='Invalid Date' || now==null || now==''){
    return"";
}
var year=now.getYear()+1900;
var month=now.getMonth()+1;
var date=now.getDate();
var hour=now.getHours();
var minute=now.getMinutes();
var second=now.getSeconds();
return year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
}

function addPro(){
    $("#productDialog table").show();
    emptyInput();
    newDialog("添加产品信息");
//    $("#addProdId").hide();
//    $("#isNewUser").combobox("setValue","1");
//    $("#isGold").combobox("setValue","1");
//    $("#isPromotion").combobox("setValue","1");
    $("#confirmBtn").attr("onclick","addAction()");
};

function newDialog(title){
    $('#productDialog').dialog({
        title: title,
        width: 600,
        height: 300,
        closed: false,
        cache: false,
        modal: true,
        resizeable:true
    });
};

function updateAction(prodId){
    var isvalidate = validataInput();
    if(isvalidate==false){
        alert("请填写完整数据！");
        return;
    }
    var proname = $("#proname").val();
    var cycle = $("#cycle").numberbox("getValue");
    var annualrate = $("#annualrate").val();
    var flowdesc = $("#flowdesc").val();
    var minimumBuyPrice = $("#minimumBuyPrice").numberbox("getValue");
    var guaranteeSafe = $("#guaranteeSafe").val();
    var isForeign = $("#isForeign").combobox("getValue");
    var badge = $("#badge").val();
    var sort = $("#sort").val();
    var isNewUser = $("#isNewUser").combobox("getValue");
    var isGold = $("#isGold").combobox("getValue");
    var isPromotion = $("#isPromotion").combobox("getValue");
    var sellStartTime = $("#sellStartTime").datetimebox('getValue');
    var singleMaxAmount = $("#singleMaxAmount").val();
    var param = {"prodId":prodId, "name": proname, "investCycle": cycle, "annualRate": annualrate, "flowDesc": flowdesc, "minimumBuyPrice": minimumBuyPrice,"guaranteeSafe":guaranteeSafe,"isForeign":isForeign,"badge":badge,"sort":sort,"isNewUser":isNewUser,"isGold":isGold,"isPromotion":isPromotion, "sellStartTime":sellStartTime,"singleMaxAmount":singleMaxAmount};
    $.post($("#rootPath").val()+"/finance/updateprod", param,
        function(data){
        	 $('#productDialog').panel("close");
             $.messager.show({
				title:'系统提示: ',
				msg:"产品信息更新"+data,
				timeout:2000,
				showType:'slide'
			});
		    window.setTimeout(function(){
		       window.location.reload();
		    },2000)
    });
}

function addAction(){
    var isvalidate = validataInput();
//    if(isvalidate==false){
//        $.messager.alert("系统提示：","请填写完整的表单项");
//        return;
//    }
    var name = $("#name").val();
    var cycle = $("#cycle").numberbox("getValue");
    var annualrate = $("#annualrate").val();
    var flowdesc = $("#flowdesc").val();
    var minimumBuyPrice = $("#minimumBuyPrice").numberbox("getValue");
    var guaranteeSafe = $("#guaranteeSafe").val();
    var isForeign = $("#isForeign").combobox("getValue");
    var badge = $("#badge").val();
    var sort = $("#sort").val();
    var isNewUser = $("#isNewUser").combobox("getValue");
    var isGold = $("#isGold").combobox("getValue");
    var isPromotion = $("#isPromotion").combobox("getValue");
    var sellStartTime = $("#sellStartTime").val();
    var singleMaxAmount = $("#singleMaxAmount").val();
    var param = {"name": name};
//    $.post("/product/add.do", param,
//        function(data){
//            $('#productDialog').panel("close");
//            $.messager.show({
//                title:'系统提示: ',
//                msg:"产品信息更新"+data,
//                timeout:2000,
//                showType:'slide'
//            });
//            window.setTimeout(function(){
//                window.location.reload();
//            },2000)
//        });
    $.post("/product/add.do", param,function(data){
             $.messager.show({
				title:'系统提示: ',
				msg:data.msg,
				timeout:2000,
				showType:'slide'
			});
           if(data.flag){
        	   $('#productDialog').panel("close");
        	   window.setTimeout(function(){
	           	   window.location.reload();
	           },2000)
           }
    });

}

function emptyInput(){
//    $("#proname").val("");
//    $("#cycle").numberbox("setValue","");
//    $("#annualrate").val("");
//    $("#flowdesc").val("");
//    $("#minimumBuyPrice").numberbox("setValue","");
//    $("#guaranteeSafe").val("");
//    $("#badge").val("");
//    $("#sort").val("");
//    $("#sellStartTime").val("");
//    $("#singleMaxAmount").val("0");
}

function validataInput(){
    if($("#proname").val()=="" ||  $("#minimumBuyPrice").numberbox("getValue")==""||$("#annualrate").val()==""||
        $("#flowdesc").val()==""||$("#cycle").numberbox("getValue")==""){
        return false;
    }
}

