<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/3
  Time: 22:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>修改密码</title>
    <link href="${pageContext.request.contextPath}/static/user/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/user/css/gloab.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/user/css/index.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/user/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/user/js/register.js"></script>
</head>
<style>
    .bgf{
        margin-top:100px;
        background-color: rgba(255,255,255,.7);
    }
    .bgf4 {
        /*background-color: #f4f4f7;*/
        background-image: url(${pageContext.request.contextPath}/static/images/bg1.jpg);
        background-repeat: no-repeat;
        background-size: 100%;
    }
    .main{
        width: 800px;
        border-radius: 3px;
    }
    .reg-box .intelligent-label{
        color: #222222;
    }
    .reg-box .focus{
        color:#333333;
    }
    .step .on .lbg-txt{
        color: #D43F3A;
    }
    .step .lbg-txt{
        color: #c67171;
    }
    .step .on .line_bg, .step .on .num em{
         background: #D43F3A;
     }
    .step .num em,
    .step .line_bg{
        background: #E3E3E3;
    }

</style>
<script>
    function mysend() {
        $.ajax({
            method:"post",
            url:'${pageContext.request.contextPath}/user/checkCode',
            data:{"email":$("#email").val()},
            dataType:'json',
            success:function (data) {
                $('#mycode').val(data);
            }
        })
    }
</script>
<%@include file="top.jsp"%>
<body class="bgf4">
<div class="login-box f-mt10 f-pb50">
    <div class="main bgf">
        <div class="reg-box-pan display-inline">
            <div class="step">
                <ul>
                    <li class="col-xs-4 on">
                        <span class="num"><em class="f-r5"></em><i>1</i></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">验证用户信息</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>2</i></span>
                        <span class="line_bg lbg-l"></span>
                        <span class="line_bg lbg-r"></span>
                        <p class="lbg-txt">填写新密码</p>
                    </li>
                    <li class="col-xs-4">
                        <span class="num"><em class="f-r5"></em><i>3</i></span>
                        <span class="line_bg lbg-l"></span>
                        <p class="lbg-txt">密码修改成功</p>
                    </li>
                </ul>
            </div>
            <div class="reg-box" id="verifyCheck" style="margin-top:20px;">
                <div class="part1">
                    <div class="item col-xs-12">
                        <div class="col-xs-2"></div>
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>邮箱：</span>
                        <div class="f-fl item-ifo">
                            <input type="email" class="txt03 f-r3 required" name="email" data-valid="isNonEmpty||isEmail" data-error="邮箱不能为空不能为空||邮箱格式不正确" id="email"/>
                            <!--<input type="text" class="txt03 f-r3 required" keycodes="tel" tabindex="2" data-valid="isNonEmpty||isPhone" data-error="手机号码不能为空||手机号码格式不正确" maxlength="11" id="phone" />-->
                            <span class="ie8 icon-close close hide"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请填写注册时使用邮箱地址</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <div class="col-xs-2"></div>
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>验证码：</span>
                        <div class="f-fl item-ifo">
                            <input type="hidden"  id="mycode">
                            <input type="text" maxlength="6" id="verifyNo" class="txt03 f-r3 f-fl required" tabindex="4" style="width:167px" data-valid="isNonEmpty||isInt||isRepeat:mycode" data-error="验证码不能为空||请输入6位数字验证码||验证码错误" />
                            <span class="btn btn-gray f-r3 f-ml5 f-size13" id="time_box" disabled style="width:97px;display:none;">发送验证码</span>
                            <span class="btn btn-gray f-r3 f-ml5 f-size13" id="verifyYz" style="width:97px;" onclick="mysend()">发送验证码</span>
                            <span class="ie8 icon-close close hide" style="right:130px"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus"><span>请查收邮箱收件箱，并填写收到邮件中的验证码</span></label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <div class="col-xs-2"></div>
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <div class="f-fl item-ifo">
                            <a href="javascript:;" class="btn btn-danger btn-block f-r3" id="btn_part1">下一步</a>
                        </div>
                    </div>
                </div>
                <div class="part2" style="display:none">
                    <div class="item col-xs-12">
                        <div class="col-xs-2"></div>
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>密码：</span>
                        <div class="f-fl item-ifo">
                            <input type="password" id="password" maxlength="20" class="txt03 f-r3 required" tabindex="3" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-20||level:2" data-error="密码不能为空||密码长度6-20位||该密码太简单，有被盗风险，建议字母+数字的组合" />
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="password"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">6-20位英文（区分大小写）、数字、字符的组合</label>
                            <label class="focus valid"></label>
                            <span class="clearfix"></span>
                            <label class="strength">
                                <span class="f-fl f-size12">安全程度：</span>
                                <b><i>弱</i><i>中</i><i>强</i></b>
                            </label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <div class="col-xs-2"></div>
                        <span class="intelligent-label f-fl"><b class="ftx04">*</b>确认密码：</span>
                        <div class="f-fl item-ifo">
                            <input type="password" maxlength="20" class="txt03 f-r3 required" tabindex="4" style="ime-mode:disabled;" onpaste="return  false" autocomplete="off" data-valid="isNonEmpty||between:6-16||isRepeat:password" data-error="密码不能为空||密码长度6-16位||两次密码输入不一致" id="rePassword" />
                            <span class="ie8 icon-close close hide" style="right:55px"></span>
                            <span class="showpwd" data-eye="rePassword"></span>
                            <label class="icon-sucessfill blank hide"></label>
                            <label class="focus">请再输入一遍上面的密码</label>
                            <label class="focus valid"></label>
                        </div>
                    </div>
                    <div class="item col-xs-12">
                        <div class="col-xs-2"></div>
                        <span class="intelligent-label f-fl">&nbsp;</span>
                        <div class="f-fl item-ifo">
                            <a href="javascript:;" class="btn btn-danger btn-block f-r3" id="btn_part2">下一步</a>
                        </div>
                    </div>
                </div>
                <div class="part3 text-center" style="display:none">
                    <h3>您的密码修改成功，现在开始您的购物之旅吧！</h3>
                    <p class="c-666 f-mt30 f-mb50">页面将在 <strong id="times" class="f-size18">5</strong> 秒钟后，跳转到
                        <a href="${pageContext.request.contextPath}/user/login" class="c-blue">登录页面</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        //第一页的确定按钮
        $("#btn_part1").click(function() {
            if(!verifyCheck._click()) return;
            $(".part1").hide();
            $(".part2").show();
            $(".step li").eq(1).addClass("on");
        });
        //第二页的确定按钮
        $("#btn_part2").click(function() {
            if(!verifyCheck._click()) return;
            var email=$('#email').val();
            var password=$("#password").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updatePassword?email="+email+"&password="+password,
                successs:function (data) {
                    console.log(data);
                }
            })
            $(".part2").hide();
            $(".part3").show();
        });
        //第三页的确定按钮
        $("#btn_part2").click(function() {
            if(!verifyCheck._click()) return;
            $(".part2").hide();
            $(".part3").show();
            $(".step li").eq(2).addClass("on");
            countdown({
                maxTime: 10,
                ing: function(c) {
                    $("#times").text(c);
                },
                after: function() {
                    window.location.href ="${pageContext.request.contextPath}/user/login";
                }
            });
        });
    });
    function showoutc() {
        $(".m-sPopBg,.m-sPopCon").show();
    }

    function closeClause() {
        $(".m-sPopBg,.m-sPopCon").hide();
    }
</script>
</body>
</html>
