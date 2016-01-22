$(document).ready(function(){
});



function submitaudit(obj){
    if(obj==1){           //拒绝
        $("#passaudit").attr("action","/finance/assetaudit.html");
    }else if(obj==2){      //通过
        $("#passaudit").attr("action","/finance/assetpublish.html");
    }
    $("#passaudit").submit();
}