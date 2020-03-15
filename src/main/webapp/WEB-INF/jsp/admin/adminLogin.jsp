<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/27
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>莆院商城后台管理</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/admin/css/style.css" />
    <style>
        body{height:100%;background:#16a085;overflow:hidden;}
        canvas{z-index:-1;position:absolute;}
    </style>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/verificationNumbers.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/Particleground.js"></script>
    <script>
        $(document).ready(function() {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //验证码
            createCode();
            //测试提交，对接程序删除即可
            $(".submit_btn").click(function(){
                if(validate()){
                    var username=$("input[name='nowname']").val();
                    var password=$("input[name='nowpassword']").val();
                    $("input[name='username']").val(username);
                    $("input[name='password']").val(password);
                    $(".mysub").click();
                    <%--location.href="${pageContext.request.contextPath}/admin/dologin";--%>
                }
            });
        });
    </script>
    <style>
        .val_icon  .errorInfo{
            font-size:5px;
        }
    </style>
</head>
<body>
<dl class="admin_login">
    <dt>
        <strong>莆院商城后台管理</strong>
        <em>XyShopManagement System</em>
    </dt>
    <dd class="user_icon">
        <input type="text" placeholder="账号" class="login_txtbx" name="nowname" />
    </dd>
    <dd class="pwd_icon">
        <input type="password" placeholder="密码" class="login_txtbx" name="nowpassword"/>
    </dd>
    <dd class="val_icon">
        <div class="checkcode">
            <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx" name="codetext">
            <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
        </div>
        <input type="text" value="${error}" class="ver_btn errorInfo"  style="width:100px;color:#CC0033">
    </dd>
    <dd>
        <input type="button" value="立即登陆" class="submit_btn"/>
    </dd>

    <form action="${pageContext.request.contextPath}/admin/dologin" class="myform" method="post">
        <input type="hidden" name="username">
        <input type="hidden" name="password">
        <input type="submit" class="mysub" style="display: none">
    </form>
    <dd>
        <p><a href="${pageContext.request.contextPath}/user/index">© 2019-2020 PTXY</a></p>
    </dd>
</dl>
</body>
</html>
