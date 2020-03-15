<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/3
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>收藏夹</title>
    <LINK rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userLeftNav.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userNavH.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/userSearch.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/topOther.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/buttom.css" />
    <script src="${pageContext.request.contextPath}/static/user/scripts/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/user/scripts/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/static/layer/layer.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/holder.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/user/scripts/Calculation.js"></script>

</head>
<style>
    div.collectDiv .imgDiv img {
        width: 140px;
        height: 140px;
        vertical-align: middle;
    }

    div.collectDiv .backGeZi {
        display: none;
        position: absolute;
        top: 0px;
        text-align: center;
        vertical-align: middle;
        width: 140px;
        height: 140px;
        background-color: rgba(255, 255, 255, .2);
        opacity: 0;
    }

    div.collectDiv .photoGeZi:hover div.backGeZi {
        display: block;
        opacity: 1;
        z-index: 999;
    }

    div.collectDiv .photoGeZi:hover .collectDele {
        margin-top: 2px;
        margin-left: 70%;
    }

    div.collectDiv .photoGeZi:hover .collectDele span:hover {
        background: #EEA236;
        color: #FFFFFF;
    }

    div.collectDiv .photoGeZi:hover div.backGeZiButton {
        margin-top: 65%;
    }

    div.collectDiv .collectDes p {
        font-size: 14px;
        text-align: center;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        margin: 2px;
    }
    div.collectDiv .collectDes .collectPrice p{
        display: inline;
        font-size: 14px;
    }
    div.collectDiv .collectDes .collectPrice span.money{
        color: #D43F3A;
        font-weight: bold;
        margin-right: 5px;
    }
    div.collectDiv .collectDes .collectPrice span.moneyDele{
        text-decoration: line-through;
        font-size: 12px;
        color: #999999;
    }
    div.collectDiv .collectDes a {
        color: #666;
    }

    div.collectDiv .collectDes a:hover {
        color: #A40000;
    }
</style>

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
                收藏夹
            </li>
        </ul>
    </div>
    <div class="col-md-5 " >

    </div>
</div>
<div class="container">
    <div class="row">
        <!--侧边导航-->
        <div class="col-md-2">
            <div class="userLeftNavDiv">
                <ul class="list-group">
                    <h4>个人中心</h4>
                    <li class="list-group-item userlist">
                        <a href="${pageContext.request.contextPath}/user/userInfo">用户信息</a>
                    </li>
                    <li class="list-group-item userlist">
                        <a href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}" >我的订单</a>
                    </li>
                    <li class="list-group-item">
                        <a href="${pageContext.request.contextPath}/user/foots?uid=${user.uid}">我的足迹</a>
                    </li>
                    <li class='list-group-item'>
                        <a href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}"  style="color: #D43F3A;">我的收藏</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-10 size" style="margin-top: 15px;padding-top: 10px;border-top: 1px solid #F9F2F4;">
            <div class="row">
                <div class="collectDiv">
                    <c:forEach items="${pageInfo.list}" var="product">
                        <div class="col-md-2 ">
                            <div class="photoGeZi">
                                <div class="imgDiv">
                                    <img src="${pageContext.request.contextPath}/static/images/${product.pimage}"/>
                                </div>
                                <div class="backGeZi">
                                    <div class="collectDele">
                                            <a onclick="deleteFavourite('${product.pid}','${user.uid}')">
                                                <span class="btn btn-xs glyphicon glyphicon-trash "> </span>
                                            </a>

                                    </div>
                                    <div class="backGeZiButton">
                                        <a href="${pageContext.request.contextPath}/user/buyNow?uid=${user.uid}&pid=${product.pid}&buyNum=1" class="btn btn-danger btn-xs">立即购买</a>
                                        <a href="${pageContext.request.contextPath}/user/product_info?pid=${product.pid}" class="btn btn-primary btn-xs">查看详情</a>
                                    </div>
                                </div>
                            </div>
                            <div class="collectDes">
                                <div>
                                    <p>
                                        <a href="${pageContext.request.contextPath}/user/product_info?pid=${product.pid}">${product.pname}</a>
                                    </p>
                                </div>
                                <div class="collectPrice">
                                    <p><span class="money"><i>￥</i>${product.shopPrice}</span></p>
                                    <p><span class="moneyDele"><i>￥</i>${product.marketPrice}</span></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10" style="text-align: center;">
            <ul class="pagination">
                <li><a href="javascript:findPage(1)"><span>首页</span></a></li>
                <c:if test="${pageInfo.pageNum==1}">
                    <li class="disabled"><a href="javascript:void(0)"><span>上一页</span></a></li>
                </c:if>

                <c:if test="${pageInfo.pageNum!=1}">
                    <li><a href="javascript:findPage(${pageInfo.pageNum-1})"><span>上一页</span></a></li>
                </c:if>

                <c:forEach begin="1" end="${pageInfo.pages}" var="page">
                    <c:if test="${pageInfo.pageNum==page}">
                        <li class="active"><a href="javascript:void(0)">${page}</a></li>
                    </c:if>
                    <c:if test="${pageInfo.pageNum!=page}">
                        <li style="margin-right:5px"><a href="javascript:findPage(${page})">${page}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${pageInfo.pageNum==pageInfo.pages||pageInfo.pages==0}">
                    <li class="disabled"><a href="javascript:void(0)"> <span>下一页</span>
                    </a></li>

                </c:if>

                <c:if test="${pageInfo.pageNum!=pageInfo.pages&&pageInfo.pages!=0}">
                    <li><a href="javascript:findPage(${pageInfo.pageNum+1})"> <span>下一页</span>
                    </a></li>
                </c:if>
                <li><a href="javascript:findPage(${pageInfo.pages})"><span>尾页</span></a></li>
            </ul>
        </div>
    </div>

</div>
<!--底部维权-->
<!--底部维权-->
<div class="row buttom navbar-fixed-bottom" id="footer">
    <div class="col-md-12 ">
        <p class="copyRight">Copyright © 2019 PTXY. All rights reserved. </p>
        <p>互联网违法和不良信息举报电话：12321 <a href="${pageContext.request.contextPath}/admin/login" style="margin-left:5px;color:#fff">管理员登录</a></p>
    </div>
</div>
</body>
<script>
    function deleteFavourite(pid,uid) {
        layer.confirm("您确定要移出收藏夹吗?",function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/deleteFavourite?uid="+uid+"&pid="+pid,
                dataType:'json',
                success:function (data) {
                    window.location.reload();
                }
            })
        })
    }
    function findPage(pageNum) {
        if(pageNum!=0){
            window.location.href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}&pageNum="+pageNum;
        }
    }
</script>
</html>
