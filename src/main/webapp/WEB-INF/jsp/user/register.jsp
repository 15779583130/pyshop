<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/13
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Submit Handler Demo</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrapValidator.css" />

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/bs/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/layer/layer.js"></script>

    <style>
        #form {
            margin-top: 50px;
            padding: 40px 30px;
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
        <div class="col-sm-4 panel panel-default"  style="background-color: rgba(255,255,255,.5);"  id="form">
            <section>
                <div>
                    <div class="page-header">
                        <h4 class="no-margins">注册莆院商城</h4>
                    </div>

                    <form id="defaultForm" method="post" action="${pageContext.request.contextPath}/user/doregister">
                        <div class="alert alert-success" style="display: none;"></div>

                        <div class="form-group">
                            <div>
                                <input type="text" class="form-control username" name="username" placeholder="用户名" />
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control" id="#username" name="password" placeholder="密码" />
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control" name="confirmPassword" placeholder="确认密码" />
                        </div>


                        <div class="form-group">
                            <input type="telephone" class="form-control" name="telephone" placeholder="手机号" />
                        </div>

                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="邮箱" id="email"/>
                        </div>
                        <input type="hidden" id="code" name="code">

                        <div class="form-group row">
                            <div class="col-md-8" style="padding-right:0px">
                                <input type="text" class="form-control" name="validatorCode" placeholder="验证码"/>
                            </div>
                            <div class="col-md-4">
                                <a href="javascript:sendCode()"class="sc" style="display: block;line-height:30px;" id="sendCode">获取验证码</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-danger btn-block " name="submit ">注册</button>
                        </div>
                    </form>
                </div>
            </section>
        </div>

        <!-- :form -->
    </div>
</div>

<script type="text/javascript ">
    function sendCode(){
        $.ajax({
            method:"post",
            url:'${pageContext.request.contextPath}/user/checkCode',
            data:{"email":$("#email").val()},
            dataType:'json',
            success:function (data) {
                $('#code').val(data);
                var count=60;
                var countdown=setInterval(function () {
                    $("#sendCode").html("<span class='text-warning'>"+count+"秒</span>");
                    count--;
                    if(count==0){
                        $("#sendCode").html("没收到?重新获取验证码");
                        $('#code').val("");
                        clearInterval(countdown);
                    }
                },1000)
            }
        })
    }
</script>

<script type="text/javascript ">
    $(document).ready(function() {
        $('#defaultForm')
            .bootstrapValidator({
                message: 'This value is not valid',
                //live: 'submitted',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
                        message: '该用户名不可用',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '用户名必须在6~20位之间'
                            },
                            remote:{
                                url:'${pageContext.request.contextPath}/user/checkUsername',
                                data:{username:$('input[name="username"]').val()},
                                message:'用户名已存在',
                            },
                            // remote: {
                            //     url: check_useaname(name),
                            //     message: '用户名已存在'
                            // },
                            regexp: {
                                regexp:/^([a-zA-Z0-9_\.]+$)/,
                                message: '用户名只能由字母，数字，小数点和下划线组成'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不能为空'
                            },
                            emailAddress: {
                                regexp:/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,
                                message: '该邮箱地址不可用'
                            },
                            /*regexp:{
                                regexp:/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,

                            }*/
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            /*  stringLength: {
                                      min: 6,
                                      max: 30,
                                      message: '密码必须在6~30位之间'
                              },*/
                            regexp: {
                                regexp: /^(?![A-Z]+$)(?![a-z]+$)(?!\d+$)\S{8,20}$/,
                                message: '密码必须符合由数字,大写字母,小写字母,至少其中两种组成，且长度不小于8'
                            },

                        }
                    },
                    telephone:{
                        validators:{
                            notEmpty:{
                                message:'手机号不能为空'
                            },
                            regexp: {
                                regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                                message: '请输入正确的手机号码'
                            },
                            remote:{
                                url:'${pageContext.request.contextPath}/user/checkTelephone',
                                data:{telephone:$('input[name="telephone"]').val()},
                                message:'该手机号已经注册',
                            },
                        }
                    },
                    confirmPassword: {
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空'
                            },
                            identical: {
                                field: 'password',
                                message: '两次密码输入不一致'
                            }
                        }
                    },
                    code:{

                    },
                    validatorCode:{
                        validators: {
                            notEmpty: {
                                message: '验证码不能为空'
                            },
                            identical: {
                                field: 'code',
                                message: '验证码错误'
                            }
                        }
                    },
                }
            })
            .on('success.form.bv', function(e) {
                // Prevent submit form
                //e.preventDefault();

                // var $form     = $(e.target),
                //     validator = $form.data('bootstrapValidator');
                // $form.find('.alert').html('Thanks for signing up. Now you can sign in as ' + validator.getFieldElements('username').val()).show();
                // $("#defaultForm").submit();
                e.preventDefault();

                $.ajax({
                    url:"${pageContext.request.contextPath}/user/doregister",
                    data:$('#defaultForm').serialize(),
                    success:function(data){
                        layer.alert("注册成功",function () {
                            window.location.href="${pageContext.request.contextPath}/user/login";
                        });

                    },
                    error:function (data) {
                        console.log(data);
                        layer.alert("注册失败");
                    }
                })
            });
    });
</script>
</body>
</html>
