<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/3
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>用户信息</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/userLeftNav.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap-datetimepicker.min.css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<style>
    div.userLeftNavDiv li a.myactive{
        color: #D43F3A;
    }
</style>
<script>
    $(function () {
        $('.userLeftNavDiv .list-group li:eq(0) a').addClass("myactive");
        if('${result}'!=null&&'${result}'!=""){
            layer.alert('${result}');
        }
    })
    <%--function mysub() {--%>
        <%--$.ajax({--%>
            <%--url:"${pageContext.request.contextPath}/user/update",--%>
            <%--data:$("#infoform").serialize(),--%>
            <%--method:'post',--%>
            <%--async:true,--%>
            <%--success:function (data) {--%>
                <%--alert(data);--%>
            <%--},--%>
            <%--error:function (data) {--%>
                <%--alert(22);--%>
            <%--}--%>
        <%--})--%>

    <%--}--%>
</script>
<body>

<!--顶部灰色区域-->
<%@include file="top.jsp"%>
<!--搜索一排-->
<div class="row searchBox">
    <div class="col-md-2 column" style="text-align: right;">
        <img  src="${pageContext.request.contextPath}/static/images/logo7.png" width="140" height="70"/>
    </div>
    <div class="col-md-5 userBt" style="line-height: 70px;">
        <ul class="list-inline userNavH">
            <li>
                <a href="${pageContext.request.contextPath}/user/index">首页</a>
            </li>
            <li>
                用户信息
            </li>
        </ul>
    </div>
    <div class="col-md-5 ">

    </div>
</div>

<div class="container">
    <div class="row">
        <!--侧边导航-->
        <div class="col-md-2">
            <div class="userLeftNavDiv">
                <ul class="list-group ">
                    <h4>个人中心</h4>
                    <li class="list-group-item userlist">
                        <div class="">
                            <a href="${pageContext.request.contextPath}/user/userInfo" >用户信息</a>
                        </div>
                    </li>
                    <li class="list-group-item userlist">
                        <div class=''>
                            <a href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}">我的订单</a>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="">
                            <a href="${pageContext.request.contextPath}/user/foots?uid=${user.uid}">我的足迹</a>
                        </div>
                    </li>
                    <li class='list-group-item'>
                        <div class="">
                            <a href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}">我的收藏</a>
                        </div>
                    </li>

                </ul>
            </div>
        </div>
        <div class="col-md-8 size">
            <!--用户信息表单-->
            <div class="content" style="margin-left: 30px;">
                <div class="col-md-12 panel panel-default userInfoDiv" style="padding: 0px;margin-top: 15px;">
                    <div class="panel-heading">
                        <h3 class="panel-title">
                            基本资料
                        </h3>
                    </div>
                    <form class="userInfoForm panel-body form-horizontal" id="infoform" action="${pageContext.request.contextPath}/user/update" method="post" enctype="multipart/form-data">
                        <div class="form-group row">
                            <label class="center-block col-md-2 control-label">当前头像:</label>
                            <div class="col-md-1"></div>
                            <label class="col-md-3">
                                <div class="headImgDiv">
                                    <a href="#" class="headImg" >
                                        <img src="${pageContext.request.contextPath}/static/images/${user.uimage}" class="img-circle" alt='' width="100px" height="100px" />
                                        <div class="clickEditDiv">
                                            <a class="clickEdit btn btn-defaultt btn-xs">点我编辑</a>
                                        </div>
                                    </a>
                                </div>
                            </label>
                            <div style="margin-top:45px">
                                <span>更换头像:</span>
                                <input type="file" name="mypic">
                            </div>
                            <%--<label class="col-lg-6 ">--%>
                                <%--<input type="file" class="btn btn-default btn-xs ">--%>
                                <%--&lt;%&ndash;<a href="" class="btn btn-default  btn-xs replaceHI">更换头像</a>&ndash;%&gt;--%>
                            <%--</label>--%>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">用户名:</label>
                            <div class="col-md-10">
                                <input type="hidden" name="uid" value="${user.uid}">
                                <input type="text" name="username" id="username" value="${user.username}" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 control-label">性别:</label>
                            <div class="col-md-10">
                                <input type="radio" name="sex" id="male" value="男" ${user.sex=="男"?'checked':''}/>
                                <span style="margin: auto 10px;">男</span>
                                <input type="radio" name="sex" id="female" value="女" ${user.sex=="女"?'checked':''} style="margin-left:10px;"/>
                                <span style="margin: auto 10px;">女</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">生日:</label>
                            <div class="col-md-10">
                                <input type="date" name="birth" class="form-control" value="<fmt:formatDate value="${user.birth}" pattern="yyyy-MM-dd"></fmt:formatDate>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">电话:</label>
                            <div class="col-md-10">
                                <input type="text" name="telephone" class="form-control" value="${user.telephone}" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-2 control-label">邮箱:</label>
                            <div class="col-md-10">
                                <input type="email" name="email" class="form-control" value="${user.email}" />
                            </div>
                        </div>
                        <div>
                            <div class="col-lg-3"></div>
                            <div class="col-lg-9">
                                <input type="submit" class="btn btn-warning formSure" value="保存">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<!--底部维权-->
</body>
<!--底部维权-->
<div class="row buttom navbar-fixed-bottom" id="footer">
    <div class="col-md-12 ">
        <p class="copyRight">Copyright © 2019 PTXY. All rights reserved. </p>
        <p>互联网违法和不良信息举报电话：12321 <a href="${pageContext.request.contextPath}/admin/login" style="margin-left:5px;color:#fff">管理员登录</a></p>
    </div>
</div>

</html>
