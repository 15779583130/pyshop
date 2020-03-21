<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Submit Handler Demo</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrapValidator.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bs/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/js/verify.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>

    <style>
        #form {
            margin-top: 100px;
            padding: 30px 30px;
        }

        a.sc {
            margin-top: 5px;
        }

        body{
            background-image: url(${pageContext.request.contextPath}/static/images/bg1.jpg);
            background-repeat: no-repeat;
            background-size: 100%;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row">

        <div class="col-sm-7">
        </div>
        <!-- form: -->
        <div class="col-sm-4 panel panel-default" style="background-color: rgba(255,255,255,.5);"  id="form">
            <section>
                <div>
                    <div class="page-header">
                        <h4 class="no-margins">登录莆院商城</h4>
                    </div>

                    <form id="defaultForm" method="post" action="${pageContext.request.contextPath}/dologin2">
                        <div class="alert alert-success" style="display: none;"></div>

                        <div class="form-group">
                            <div>
                                <input type="text" class="form-control username" name="telephone" placeholder="请输入手机号" required />

                            </div>
                            <span id="tusername"></span>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control" id="#username" name="password" placeholder="请输入密码" required/>
                        </div>

                        <div class="form-group row">
                            <div class="col-lg-8">
                                <input type="text" class="form-control varify-input-code" name="validatorCode" placeholder="验证码" />
                            </div>
                            <div id="mpanel2" class="col-lg-4" style="margin-right:0px;margin-left: -15px">
                            </div>
                            <%--<button type="button" id="check-btn" >确定</button>--%>
                            <input type="hidden" id="check-btn" value="确定">

                        </div>
                        <span style="color: red" class="error">${error}</span>
                        <div class="checkbox">

                            <label class="col-md-4">
                                <input type="checkbox"/>记住密码
                            </label>
                            <label class="col-md-8" >
                                <p style="margin-left:30px">
                                    <a href="${pageContext.request.contextPath}/user/findPassword">忘记密码？&nbsp;</a>|
                                    <a href="${pageContext.request.contextPath}/user/register">&nbsp;去注册！</a>
                                </p>
                            </label>
                        </div>
                        <div class="form-group"></div>

                        <%--<div class="form-group">--%>
                            <%--<div class=" col-sm-12">--%>
                                <%--<div class="checkbox" style="padding-left:0">--%>
                                    <%--<label>--%>
                                        <%--<input type="checkbox"/>记住密码--%>
                                    <%--</label>--%>
                                <%--</div>--%>
                                <%--<div class="col-sm-8" style=" margin: -30px 160px;">--%>
                                    <%--<p>--%>
                                        <%--<a href="#">忘记密码？&nbsp;</a>|--%>
                                        <%--<a href="regist.html">&nbsp;去注册！</a>--%>
                                    <%--</p>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <div class="form-group">
                            <button type="button" class="btn btn-danger btn-block"  id="IsBy" onclick="mysub()">登录</button>
                        </div>
                    </form>
                </div>
            </section>
        </div>

        <!-- :form -->
    </div>
</div>
<script type="text/javascript">
    function mysub(){
        var result=$("input[name='validatorCode']").val();
        $('#checkcode').val(result);
        $('#check-btn').click();
    };
    $('#mpanel2').codeVerify({
        type : 1,
        width : '100px',
        height : '30px',
        fontSize : '30px',
        codeLength : 4,
        btnId : 'check-btn',
        ready : function() {
        },
        success : function() {
            $('#defaultForm').submit();
        },
        error : function() {
            $('.error').html("验证码错误");
        }
    });
</script>
</body>

</html>