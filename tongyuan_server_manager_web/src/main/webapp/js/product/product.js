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

function modifyProduct(product){
    emptyInput();
    $("#id").val(product.id);
    $("#name").val(product.name);
    $("#price").val(product.price);
    $("#discount").val(product.discount);
    $("#state").combobox("setValue",product.state);
    $("#num").val(product.num);
    $("#categoryId").combobox("setValue",product.categoryId);
    $("#categoryId").combobox("setText",product.categoryName);
    $("#pic").val(product.pic);
    $("#picSmall").val(product.picSmall);
    $("#function").val(product.function);
    $("#element").val(product.element);
    $("#summary").val(product.summary);
    $("#detail").val(product.detail);
    $('#soldStart').datetimebox('setValue',product.soldStart)  ;
    $("#soldEnd").datetimebox("setValue",product.soldEnd)  ;
    $("#sort").val(product.sort);
    $("#isRecommend").combobox("setValue",product.isRecommend);
    $("#isReserve").combobox("setValue",product.isReserve);

    newDialog("修改产品信息");
    $("#id").attr("readonly","readonly");
    $("#productDialog table").show();
    $("#confirmBtn").attr("onclick","updateAction()");
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

function updateAction(){
    var isvalidate = validataInput();
//    if(isvalidate==false){
//        $.messager.alert("系统提示：","请填写完整的表单项");
//        return;
    var id = $("#id").val();
    var name = $("#name").val();
    var price = $("#price").val();
    var discount = $("#discount").val();
    var state = $("#state").combobox("getValue");
    var num = $("#num").val();
    var categoryId = $("#categoryId").combobox("getValue");
    var categoryName = $("#categoryId").combobox("getText");
    var unit = $("#unit").combobox("getText");
    var pic = $("#pic").val();
    var picSmall = $("#picSmall").val();
    var functions = $("#function").val();
    var element = $("#element").val();
    var summary = $("#summary").val();
    var detail = $("#detail").val();
    var soldStart = $('#soldStart').datetimebox('getValue')  ;
    var soldEnd = $("#soldEnd").datetimebox("getValue")  ;
    var sort = $("#sort").val();
    var isReserve = $("#isReserve").combobox("getValue");
    var isRecommend = $("#isRecommend").combobox("getValue");

    var param = {"id":id,"name": name,"price":price,"discount":discount,"state":state,"num":num,
        "categoryId":categoryId,"categoryName":categoryName,
        "unit":unit,"pic":pic,"picSmall":picSmall,"function":functions,"element":element,"summary":summary,"detail":detail,
        "soldStart":soldStart,"soldEnd":soldEnd,"sort":sort,"isRecommend":isRecommend,"isReserve":isReserve};
    $.ajax({
        type: "post",
        url: "/product/update.do",
        contentType: "application/json",
        data: JSON.stringify(param),
        dataType: 'json',
        success: function (data, status, jqXHR) {
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
        },
        error: function (jqXHR, status) {
            alert("cuo wu");
        }
    });
}

function addAction(){
    var isvalidate = validataInput();
//    if(isvalidate==false){
//        $.messager.alert("系统提示：","请填写完整的表单项");
//        return;
    var name = $("#name").val();
    var price = $("#price").val();
    var discount = $("#discount").val();
    var state = $("#state").combobox("getValue");
    var num = $("#num").val();
    var categoryId = $("#categoryId").combobox("getValue");
    var categoryName = $("#categoryId").combobox("getText");
    var unit = $("#unit").combobox("getText");
    var pic = $("#pic").val();
    var picSmall = $("#picSmall").val();
    var functions = $("#function").val();
    var element = $("#element").val();
    var summary = $("#summary").val();
    var detail = $("#detail").val();
    var soldStart = $('#soldStart').datetimebox('getValue')  ;
    var soldEnd = $("#soldEnd").datetimebox("getValue")  ;
    var sort = $("#sort").val();
    var isReserve = $("#isReserve").combobox("getValue");
    var isRecommend = $("#isRecommend").combobox("getValue");

    var param = {"name": name,"price":price,"discount":discount,"state":state,"num":num,
        "categoryId":categoryId,"categoryName":categoryName,
        "unit":unit,"pic":pic,"picSmall":picSmall,"function":functions,"element":element,"summary":summary,"detail":detail,
        "soldStart":soldStart,"soldEnd":soldEnd,"sort":sort,"isRecommend":isRecommend,"isReserve":isReserve};
    $.ajax({
        type: "post",
        url: "/product/add.do",
        contentType: "application/json",
        data: JSON.stringify(param),
        dataType: 'json',
        success: function (data, status, jqXHR) {
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
        },
        error: function (jqXHR, status) {
            alert("cuo wu");
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
//    if($("#proname").val()=="" ||  $("#minimumBuyPrice").numberbox("getValue")==""||$("#annualrate").val()==""||
//        $("#flowdesc").val()==""||$("#cycle").numberbox("getValue")==""){
//        return false;
//    }
}

