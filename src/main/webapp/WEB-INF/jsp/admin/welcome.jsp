<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/7/25
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bs/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css">
    <script src="${pageContext.request.contextPath}/static/bs/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bs/js/holder.min.js"></script>
</head>
<script>
    $(function () {
        $('#myli a:eq(0)').addClass("active");
    })
</script>
<style>
    .jumbotron{
         min-height:420px;
    }
    .jumbotron h1{
        line-height:250px;
        text-align:center;
    }
</style>
<body>
<div id="route">
    <ol class="breadcrumb">
        <li class="active">系统菜单</li>
    </ol>
</div>
<div id="content">
    <div class="jumbotron">
        <h1>Welcome!</h1>
    </div>
</div>
</body>
</html>
