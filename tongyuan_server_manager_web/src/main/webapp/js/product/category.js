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

function modifyCategory(category){
//alert(category.name);
    emptyInput();

    $("#id").val(category.id);
    $("#name").val(category.name);
    $("#state").combobox("setValue",category.state);
    $("#pic").val(category.pic);
    $("#picSmall").val(category.picSmall);
    $("#summary").val(category.summary);
    $("#detail").val(category.detail);
    $('#soldStart').datetimebox('setValue',category.soldStart)  ;
    $("#soldEnd").datetimebox("setValue",category.soldEnd)  ;
    $("#sort").val(category.sort);
    $("#isRecommend").combobox("setValue",category.isRecommend);
    newDialog("修改产品分类信息");
//    $("#prodId").attr("readonly","readonly");
    $("#categoryDialog table").show();
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

function addCategory(){
    $("#categoryDialog table").show();
    emptyInput();
    newDialog("添加产品分类");
    $("#confirmBtn").attr("onclick","addAction()");
};

function newDialog(title){
    $('#categoryDialog').dialog({
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
//    var isvalidate = validataInput();
//    if(isvalidate==false){
//        alert("请填写完整数据！");
//        return;
//    }
    var id = $("#id").val();
    var name = $("#name").val();
    var state = $("#state").combobox("getValue");
    var pic = $("#pic").val();
    var picSmall = $("#picSmall").val();
    var summary = $("#summary").val();
    var detail = $("#detail").val();
    var soldStart = $('#soldStart').datetimebox('getValue')  ;
    var soldEnd = $("#soldEnd").datetimebox("getValue")  ;
    var sort = $("#sort").val();
    var isRecommend = $("#isRecommend").combobox("getValue");

    var param = {"id":id,"name": name,"state":state,"pic":pic,"picSmall":picSmall,"summary":summary,"detail":detail,
        "soldStart":soldStart,"soldEnd":soldEnd,"sort":sort,"isRecommend":isRecommend};
    $.ajax({
        type: "post",
        url: "/category/update.do",
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
                $('#categoryDialog').panel("close");
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
//    var isvalidate = validataInput();
//    if(isvalidate==false){
//        $.messager.alert("系统提示：","请填写完整的表单项");
//        return;
//    }

    var name = $("#name").val();
    var state = $("#state").combobox("getValue");
    var pic = $("#pic").val();
    var picSmall = $("#picSmall").val();
    var summary = $("#summary").val();
    var detail = $("#detail").val();
    var soldStart = $('#soldStart').datetimebox('getValue')  ;
    var soldEnd = $("#soldEnd").datetimebox("getValue")  ;
    var sort = $("#sort").val();
    var isRecommend = $("#isRecommend").combobox("getValue");

    var param = {"name": name,"state":state,"pic":pic,"picSmall":picSmall,"summary":summary,"detail":detail,
    "soldStart":soldStart,"soldEnd":soldEnd,"sort":sort,"isRecommend":isRecommend};
    $.ajax({
        type: "post",
        url: "/category/add.do",
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
        	   $('#categoryDialog').panel("close");
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
    if($("#proname").val()=="" ||  $("#minimumBuyPrice").numberbox("getValue")==""||$("#annualrate").val()==""||
        $("#flowdesc").val()==""||$("#cycle").numberbox("getValue")==""){
        return false;
    }
}

