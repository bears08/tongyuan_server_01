<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@include file="golbal_taglib.jsp"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title>定期理财运营系统登录</title>
    <link class="bootstrap library" rel="stylesheet" type="text/css" href="<%=root %>/css/bootstrap.min.css">
    <script type="text/javascript" src="<%=root %>/js/jquery/jquery-1.7.2.min.js"></script>
    <script class="bootstrap library" src="<%=root %>/js/bootstrap.min.js"
            type="text/javascript"></script>
</head>

<body>
<div class="container">
    <section class="loginBox row-fluid">
        <table>
           <tr>
               <td style="width: ">
            <form name="login" action="/finance/login" method="post">
            <section class="span7 left">
                <h2>用户登录</h2>
                <label><font color="red">${errmessage}</font></label>
                <p><input name="username" placeholder="用户名" type="text"></p>
                <p><input name="password" placeholder="密码" type="password"></p>
                <section class="row-fluid">
                    <section class="span1"><input value=" 登录 " class="btn btn-primary" type="submit"></section>
                </section>
            </section>
            </form>
               </td>
               <td>
                   <section class="span5 right">
                   <h2>没有帐户？</h2>
                   <section>
                       <p>注册功能暂不能用，请先用admin登录</p>
                       <p><input value=" 注册 " class="btn regBtn" type="button"></p>
                   </section>
               </td>
            </tr>
        </table>
    </section>

</div>



<style>* {
    margin: 0;
    padding: 0;
}

body {
    background: #444 url();
    font-family: "宋体";
}

.loginBox {
    width: 420px;
    height: 230px;
    padding: 0 20px;
    border: 1px solid #fff;
    color: #000;
    margin-top: 40px;
    border-radius: 8px;
    background: white;
    box-shadow: 0 0 15px #222;
    background: -moz-linear-gradient(top, #fff, #efefef 8%);
    background: -webkit-gradient(linear, 0 0, 0 100%, from(#f6f6f6), to(#f4f4f4));
    font: 11px/1.5em 'Microsoft YaHei';
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -210px;
    margin-top: -115px;
}

.loginBox h2 {
    height: 45px;
    font-size: 20px;
    font-weight: normal;
}

.loginBox .left {
    border-right: 1px solid #ccc;
    height: 100%;
    padding-right: 20px;
}

.regBtn {
    margin-top: 21px;
}
input{
    width: 170px;
}
</style>
<script></script>
</body>
</html>