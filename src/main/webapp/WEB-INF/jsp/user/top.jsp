<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/13
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/top.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/user/styles/bootstrap.min.css" />

<div class="bg">
    <div class="col-md-12 ">
        <div class="topAllLeft ">
            <p class="top_left">
                <a href="${pageContext.request.contextPath}/user/index">
                    <span class="glyphicon glyphicon-home" style="margin-right: 2px;"></span>
                    商城首页</a>
            </p>
            <p class="top_left">Hi,
                <a href="login.html">${user==null?"请先登录":user.username}</a>
            </p>
        </div>
        <div class="top_right">
            <ul>
                <c:if test="${user!=null}">
                    <li class="topRli">
                        <a href="${pageContext.request.contextPath}/user/exit"><i></i>退出</a>
                    </li>
                </c:if>

                <li class="topRli">
                    <a href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}">
                        <span class="glyphicon glyphicon-star-empty"></span>
                        我的收藏</a>
                </li>
                <li class="topRli">
                    <a href="${pageContext.request.contextPath}/user/shoppingCart?uid=${user.uid}">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        购物车</a>
                </li>
                <li class="topRli dropdown">
                    <a href="login.html" data-toggle="dropdown">我的商城
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/user/userInfo">个人信息</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/myorder?uid=${user.uid}">全部订单</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/favourite?uid=${user.uid}">我的收藏</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/user/foots?uid=${user.uid}">我的足迹</a>
                        </li>
                    </ul>
                </li>

                <c:if test="${empty sessionScope.user}">
                    <li class="topRli">
                        <a href="${pageContext.request.contextPath}/user/register" style="color: #D43F3A;">${sessionScope.user} 注册</a>
                    </li>
                    <li class="topRli">
                        <a href="${pageContext.request.contextPath}/user/login" style="color: #D43F3A;">登录</a>
                    </li>
                </c:if>

            </ul>
        </div>
    </div>
</div>