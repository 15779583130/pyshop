<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/25
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>支付成功</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <link href=${pageContext.request.contextPath}/static/user/"styles/buy.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js" type="text/javascript" charset="utf-8"></script>

</head>
<style>
    div.successDiv{
        margin-top: 20px;
        padding: 10px;
        text-align: center;
    }
    div.successInfo{
        margin: 10px auto;
        padding-top: 10px;
        width:80%;
        border-bottom: #E0E0E0 1px solid;
    }
    div.successInfo p{
        font-size: 16px;
    }
    div.successInfo p span{
        color: #D43F3A;
    }
    div.back p{
        display: inline;
    }

    div.back p a:hover{
        color: #D43F3A;
    }
    div.receInfo p{
        font-size: 12px;
        color: #9D9D9D;
        padding-top: 5px;
    }
    div.receInfo p.rece{
        display: inline;
        margin-right: 20px;
    }
    div.back p a{
        font-size: 12px;
        color: #9D9D9D;
        margin-right: 20px;
    }
</style>

<body>

<!--顶部灰色区域-->
<%@include file="top.jsp"%>
<!--搜索一排-->
<div class="row searchBox">
    <div class="col-md-2" style="text-align: right;">
        <img src="holder.js/130x70" />
    </div>
    <div class="col-md-5" >
        <ul class="list-inline userNavH">
            <li>
                <a href="index.html">首页</a>
            </li>
            <li>
                订单支付成功
            </li>
        </ul>
    </div>
    <div class="col-md-5 ">

    </div>
</div>
<!--内容body-->
<div class="container size">
    <div class="row">
        <div class="col-md-12">
            <div class="row clearfix">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="panel panel-default successDiv">
                        <div style="height:50px;border-bottom: #E0E0E0 1px solid;"></div>
                        <div class="successInfo ">
                            <p>感谢您在本站购物！您的订单已支付成功，订单号为：<span>${order.oid}</span></p>
                            <p>您的实付金额为：<span>${order.total}</span></p>
                            <p>莆院商城祝您购物愉快~期待你的再次光临！</p>
                        </div>
                        <div class="receInfo">
                            <div style="margin:0px 10px 5px;">
                                <p class="rece">收货人:${order.name}</p>
                                <p class="rece">联系电话:${order.telephone}</p>
                            </div>
                            <p>收货地址：${order.address}</p>
                        </div>
                        <div class="back">
                            <p><a href="${pageContext.request.contextPath}/user/index">商城首页</a></p>
                            <p><a href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}">我的订单</a></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </div>
</div>
<!--底部维权-->
<%@include file="bottom.jsp"%>
</body>
<script src="${pageContext.request.contextPath}/static/user/js/footer.js"></script>

</html>
